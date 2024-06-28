local QBCore = exports['qb-core']:GetCoreObject()

-- Functions

local function IsWeaponBlocked(WeaponName)
    local retval = false
    for _, name in pairs(Config.DurabilityBlockedWeapons) do
        if name == WeaponName then
            retval = true
            break
        end
    end
    return retval
end

-- Callback

QBCore.Functions.CreateCallback('qb-weapons:server:GetConfig', function(_, cb)
    cb(Config.WeaponRepairPoints)
end)

QBCore.Functions.CreateCallback('weapon:server:GetWeaponAmmo', function(source, cb, WeaponData)
    local Player = QBCore.Functions.GetPlayer(source)
    local retval = 0
    if WeaponData then
        if Player then
            local ItemData = Player.Functions.GetItemBySlot(WeaponData.slot)
            if ItemData then
                retval = ItemData.info.ammo and ItemData.info.ammo or 0
            end
        end
    end
    cb(retval, WeaponData.name)
end)

QBCore.Functions.CreateCallback('qb-weapons:server:RepairWeapon', function(source, cb, RepairPoint, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local minute = 60 * 1000
    local Timeout = math.random(5 * minute, 10 * minute)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponClass = (QBCore.Shared.SplitStr(WeaponData.ammotype, '_')[2]):lower()

    if not Player then
        cb(false)
        return
    end

    if not Player.PlayerData.items[data.slot] then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_weapon_in_hand'), 'error')
        TriggerClientEvent('qb-weapons:client:SetCurrentWeapon', src, {}, false)
        cb(false)
        return
    end

    if not Player.PlayerData.items[data.slot].info.quality or Player.PlayerData.items[data.slot].info.quality == 100 then
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_damage_on_weapon'), 'error')
        cb(false)
        return
    end

    if not Player.Functions.RemoveMoney('cash', Config.WeaponRepairCosts[WeaponClass]) then
        cb(false)
        return
    end

    Config.WeaponRepairPoints[RepairPoint].IsRepairing = true
    Config.WeaponRepairPoints[RepairPoint].RepairingData = {
        CitizenId = Player.PlayerData.citizenid,
        WeaponData = Player.PlayerData.items[data.slot],
        Ready = false,
    }

    if not exports['qb-inventory']:RemoveItem(src, data.name, 1, data.slot, 'qb-weapons:server:RepairWeapon') then
        Player.Functions.AddMoney('cash', Config.WeaponRepairCosts[WeaponClass], 'qb-weapons:server:RepairWeapon')
        return
    end

    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[data.name], 'remove')
    TriggerClientEvent('qb-inventory:client:CheckWeapon', src, data.name)
    TriggerClientEvent('qb-weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)

    SetTimeout(Timeout, function()
        Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
        Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready = true
        TriggerClientEvent('qb-weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
        exports['qb-phone']:sendNewMailToOffline(Player.PlayerData.citizenid, {
            sender = Lang:t('mail.sender'),
            subject = Lang:t('mail.subject'),
            message = Lang:t('mail.message', { value = WeaponData.label })
        })

        SetTimeout(7 * 60000, function()
            if Config.WeaponRepairPoints[RepairPoint].RepairingData.Ready then
                Config.WeaponRepairPoints[RepairPoint].IsRepairing = false
                Config.WeaponRepairPoints[RepairPoint].RepairingData = {}
                TriggerClientEvent('qb-weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[RepairPoint], RepairPoint)
            end
        end)
    end)

    cb(true)
end)

QBCore.Functions.CreateCallback('prison:server:checkThrowable', function(source, cb, weapon)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(false) end
    local throwable = false
    for _, v in pairs(Config.Throwables) do
        if QBCore.Shared.Weapons[weapon].name == 'weapon_' .. v then
            if not exports['qb-inventory']:RemoveItem(source, 'weapon_' .. v, 1, false, 'prison:server:checkThrowable') then return cb(false) end
            throwable = true
            break
        end
    end
    cb(throwable)
end)

-- Events

RegisterNetEvent('qb-weapons:server:UpdateWeaponAmmo', function(CurrentWeaponData, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    amount = tonumber(amount)
    if CurrentWeaponData then
        if Player.PlayerData.items[CurrentWeaponData.slot] then
            Player.PlayerData.items[CurrentWeaponData.slot].info.ammo = amount
        end
        Player.Functions.SetInventory(Player.PlayerData.items, true)
    end
end)

RegisterNetEvent('qb-weapons:server:TakeBackWeapon', function(k)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local itemdata = Config.WeaponRepairPoints[k].RepairingData.WeaponData
    itemdata.info.quality = 100
    exports['qb-inventory']:AddItem(src, itemdata.name, 1, false, itemdata.info, 'qb-weapons:server:TakeBackWeapon')
    TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[itemdata.name], 'add')
    Config.WeaponRepairPoints[k].IsRepairing = false
    Config.WeaponRepairPoints[k].RepairingData = {}
    TriggerClientEvent('qb-weapons:client:SyncRepairShops', -1, Config.WeaponRepairPoints[k], k)
end)

RegisterNetEvent('qb-weapons:server:SetWeaponQuality', function(data, hp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local WeaponSlot = Player.PlayerData.items[data.slot]
    WeaponSlot.info.quality = hp
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent('qb-weapons:server:UpdateWeaponQuality', function(data, RepeatAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local WeaponData = QBCore.Shared.Weapons[GetHashKey(data.name)]
    local WeaponSlot = Player.PlayerData.items[data.slot]
    local DecreaseAmount = Config.DurabilityMultiplier[data.name]
    if WeaponSlot then
        if not IsWeaponBlocked(WeaponData.name) then
            if WeaponSlot.info.quality then
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('qb-weapons:client:UseWeapon', src, data, false)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), 'error')
                        break
                    end
                end
            else
                WeaponSlot.info.quality = 100
                for _ = 1, RepeatAmount, 1 do
                    if WeaponSlot.info.quality - DecreaseAmount > 0 then
                        WeaponSlot.info.quality = WeaponSlot.info.quality - DecreaseAmount
                    else
                        WeaponSlot.info.quality = 0
                        TriggerClientEvent('qb-weapons:client:UseWeapon', src, data, false)
                        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.weapon_broken_need_repair'), 'error')
                        break
                    end
                end
            end
        end
    end
    Player.Functions.SetInventory(Player.PlayerData.items, true)
end)

RegisterNetEvent('qb-weapons:server:removeWeaponAmmoItem', function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player or type(item) ~= 'table' or not item.name or not item.slot then return end
    exports['qb-inventory']:RemoveItem(source, item.name, 1, item.slot, 'qb-weapons:server:removeWeaponAmmoItem')
end)

QBCore.Functions.CreateUseableItem("metalscratchy", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('qb-weapons:client:scratch', source)
    end
end)
    
RegisterNetEvent('qb-weapons:server:scratch', function(weapon, weaponammo)
    local Player = QBCore.Functions.GetPlayer(source)
    local weaponInfo = QBCore.Shared.Weapons[weapon]
    local weaponName = weaponInfo["name"]
    if weaponInfo then
        weaponInfo = Player.Functions.GetItemByName(weaponName)
        if weaponInfo then
            local info = {
                ammo = weaponammo,
                serie="xxxxxx"
            }
            Player.Functions.RemoveItem(weaponName, 1)
            Player.Functions.AddItem(weaponName, 1, weaponInfo.slot, info)
        end
    end
end)

-- Commands

QBCore.Commands.Add('repairweapon', 'Repair Weapon (God Only)', { { name = 'hp', help = Lang:t('info.hp_of_weapon') } }, true, function(source, args)
    TriggerClientEvent('qb-weapons:client:SetWeaponQuality', source, tonumber(args[1]))
end, 'god')

-- Items

-- STIDVC 2011
-- Mag
QBCore.Functions.CreateUseableItem('2011_clip1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'clip1')
end)
QBCore.Functions.CreateUseableItem('2011_clip2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'clip2')
end)
-- Slides
QBCore.Functions.CreateUseableItem('2011_slide1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide1')
end)
QBCore.Functions.CreateUseableItem('2011_slide2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide2')
end)
QBCore.Functions.CreateUseableItem('2011_slide3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide3')
end)
QBCore.Functions.CreateUseableItem('2011_slide4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide4')
end)
QBCore.Functions.CreateUseableItem('2011_slide5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide5')
end)
QBCore.Functions.CreateUseableItem('2011_slide6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide6')
end)
QBCore.Functions.CreateUseableItem('2011_slide7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide7')
end)
QBCore.Functions.CreateUseableItem('2011_slide8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'slide8')
end)
-- MUZZLE
QBCore.Functions.CreateUseableItem('2011_muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)
QBCore.Functions.CreateUseableItem('2011_muzzle2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle2')
end)
QBCore.Functions.CreateUseableItem('2011_muzzle3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle3')
end)
-- Barrel
QBCore.Functions.CreateUseableItem('2011_barrel1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel1')
end)
QBCore.Functions.CreateUseableItem('2011_barrel2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel2')
end)
QBCore.Functions.CreateUseableItem('2011_barrel3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'barrel3')
end)
-- Laser
QBCore.Functions.CreateUseableItem('2011_flash1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'light1')
end)
QBCore.Functions.CreateUseableItem('2011_flash2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'light2')
end)
QBCore.Functions.CreateUseableItem('2011_flash3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'light3')
end)
QBCore.Functions.CreateUseableItem('2011_flash4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'light4')
end)
QBCore.Functions.CreateUseableItem('2011_flash5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'light5')
end)

-- AMMO
local AmmoTypes = {
    pistol_ammo = { ammoType = 'AMMO_PISTOL', amount = 30 },
    rifle_ammo = { ammoType = 'AMMO_RIFLE', amount = 30 },
    smg_ammo = { ammoType = 'AMMO_SMG', amount = 30 },
    shotgun_ammo = { ammoType = 'AMMO_SHOTGUN', amount = 10 },
    mg_ammo = { ammoType = 'AMMO_MG', amount = 30 },
    snp_ammo = { ammoType = 'AMMO_SNIPER', amount = 10 },
    emp_ammo = { ammoType = 'AMMO_EMPLAUNCHER', amount = 10 }
}

for ammoItem, properties in pairs(AmmoTypes) do
    QBCore.Functions.CreateUseableItem(ammoItem, function(source, item)
        TriggerClientEvent('qb-weapons:client:AddAmmo', source, properties.ammoType, properties.amount, item)
    end)
end

-- TINTS

local function GetWeaponSlotByName(items, weaponName)
    for index, item in pairs(items) do
        if item.name == weaponName then
            return item, index
        end
    end
    return nil, nil
end

local function IsMK2Weapon(weaponHash)
    local weaponName = QBCore.Shared.Weapons[weaponHash]['name']
    return string.find(weaponName, 'mk2') ~= nil
end

local function EquipWeaponTint(source, tintIndex, item, isMK2)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local ped = GetPlayerPed(source)
    local selectedWeaponHash = GetSelectedPedWeapon(ped)

    if selectedWeaponHash == `WEAPON_UNARMED` then
        TriggerClientEvent('QBCore:Notify', source, 'You have no weapon selected.', 'error')
        return
    end

    local weaponName = QBCore.Shared.Weapons[selectedWeaponHash].name
    if not weaponName then return end

    if isMK2 and not IsMK2Weapon(selectedWeaponHash) then
        TriggerClientEvent('QBCore:Notify', source, 'This tint is only for MK2 weapons', 'error')
        return
    end

    local weaponSlot, weaponSlotIndex = GetWeaponSlotByName(Player.PlayerData.items, weaponName)
    if not weaponSlot then return end

    if weaponSlot.info.tint == tintIndex then
        TriggerClientEvent('QBCore:Notify', source, 'This tint is already applied to your weapon.', 'error')
        return
    end

    weaponSlot.info.tint = tintIndex
    Player.PlayerData.items[weaponSlotIndex] = weaponSlot
    Player.Functions.SetInventory(Player.PlayerData.items, true)
    exports['qb-inventory']:RemoveItem(source, item, 1, false, 'qb-weapon:EquipWeaponTint')
    TriggerClientEvent('qb-inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'remove')
    TriggerClientEvent('qb-weapons:client:EquipTint', source, selectedWeaponHash, tintIndex)
end

for i = 0, 7 do
    QBCore.Functions.CreateUseableItem('weapontint_' .. i, function(source, item)
        EquipWeaponTint(source, i, item.name, false)
    end)
end

for i = 0, 32 do
    QBCore.Functions.CreateUseableItem('weapontint_mk2_' .. i, function(source, item)
        EquipWeaponTint(source, i, item.name, true)
    end)
end

-- Attachments

local function HasAttachment(component, attachments)
    for k, v in pairs(attachments) do
        if v.component == component then
            return true, k
        end
    end
    return false, nil
end

local function DoesWeaponTakeWeaponComponent(item, weaponName)
    if WeaponAttachments[item] and WeaponAttachments[item][weaponName] then
        return WeaponAttachments[item][weaponName]
    end
    return false
end

local function EquipWeaponAttachment(src, item)
    local shouldRemove = false
    local ped = GetPlayerPed(src)
    local selectedWeaponHash = GetSelectedPedWeapon(ped)
    if selectedWeaponHash == `WEAPON_UNARMED` then return end
    local weaponName = QBCore.Shared.Weapons[selectedWeaponHash].name
    if not weaponName then return end
    local attachmentComponent = DoesWeaponTakeWeaponComponent(item, weaponName)
    if not attachmentComponent then
        TriggerClientEvent('QBCore:Notify', src, 'This attachment is not valid for the selected weapon.', 'error')
        return
    end
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    local weaponSlot, weaponSlotIndex = GetWeaponSlotByName(Player.PlayerData.items, weaponName)
    if not weaponSlot then return end
    weaponSlot.info.attachments = weaponSlot.info.attachments or {}
    local hasAttach, attachIndex = HasAttachment(attachmentComponent, weaponSlot.info.attachments)
    if hasAttach then
        RemoveWeaponComponentFromPed(ped, selectedWeaponHash, attachmentComponent)
        table.remove(weaponSlot.info.attachments, attachIndex)
    else
        weaponSlot.info.attachments[#weaponSlot.info.attachments + 1] = {
            component = attachmentComponent,
        }
        GiveWeaponComponentToPed(ped, selectedWeaponHash, attachmentComponent)
        shouldRemove = true
    end
    Player.PlayerData.items[weaponSlotIndex] = weaponSlot
    Player.Functions.SetInventory(Player.PlayerData.items, true)
    if shouldRemove then
        exports['qb-inventory']:RemoveItem(src, item, 1, false, 'qb-weapons:EquipWeaponAttachment')
        TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove')
    end
end

for attachmentItem in pairs(WeaponAttachments) do
    QBCore.Functions.CreateUseableItem(attachmentItem, function(source, item)
        EquipWeaponAttachment(source, item.name)
    end)
end

QBCore.Functions.CreateCallback('qb-weapons:server:RemoveAttachment', function(source, cb, AttachmentData, WeaponData)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local Inventory = Player.PlayerData.items
    local allAttachments = WeaponAttachments
    local AttachmentComponent = allAttachments[AttachmentData.attachment][WeaponData.name]
    if Inventory[WeaponData.slot] then
        if Inventory[WeaponData.slot].info.attachments and next(Inventory[WeaponData.slot].info.attachments) then
            local HasAttach, key = HasAttachment(AttachmentComponent, Inventory[WeaponData.slot].info.attachments)
            if HasAttach then
                table.remove(Inventory[WeaponData.slot].info.attachments, key)
                Player.Functions.SetInventory(Player.PlayerData.items, true)
                exports['qb-inventory']:AddItem(src, AttachmentData.attachment, 1, false, false, 'qb-weapons:server:RemoveAttachment')
                TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[AttachmentData.attachment], 'add')
                TriggerClientEvent('QBCore:Notify', src, Lang:t('info.removed_attachment', { value = QBCore.Shared.Items[AttachmentData.attachment].label }), 'error')
                cb(Inventory[WeaponData.slot].info.attachments)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

-- Mini Uzi
-- Mag
QBCore.Functions.CreateUseableItem('miniuzi_clip1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'clip1')
end)
QBCore.Functions.CreateUseableItem('miniuzi_clip2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'clip2')
end)
QBCore.Functions.CreateUseableItem('miniuzi_clip3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'clip3')
end)
QBCore.Functions.CreateUseableItem('miniuzi_clip4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'clip4')
end)
-- SCOPEs
QBCore.Functions.CreateUseableItem('miniuzi_scope1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope1')
end)
QBCore.Functions.CreateUseableItem('miniuzi_scope2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope2')
end)
QBCore.Functions.CreateUseableItem('miniuzi_scope3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope3')
end)
QBCore.Functions.CreateUseableItem('miniuzi_scope4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope4')
end)
QBCore.Functions.CreateUseableItem('miniuzi_scope5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope5')
end)
QBCore.Functions.CreateUseableItem('miniuzi_scope6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope6')
end)
-- Suppressor
QBCore.Functions.CreateUseableItem('miniuzi_suppressor1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor1')
end)
QBCore.Functions.CreateUseableItem('miniuzi_suppressor2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor2')
end)
-- Barrel
QBCore.Functions.CreateUseableItem('miniuzi_stock1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock1')
end)
QBCore.Functions.CreateUseableItem('miniuzi_stock2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock2')
end)

-- Scopes

QBCore.Functions.CreateUseableItem('markomods-scope1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope1')
end)
QBCore.Functions.CreateUseableItem('markomods-scope2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope2')
end)
QBCore.Functions.CreateUseableItem('markomods-scope3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope3')
end)
QBCore.Functions.CreateUseableItem('markomods-scope4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope4')
end)
QBCore.Functions.CreateUseableItem('markomods-scope5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope5')
end)
QBCore.Functions.CreateUseableItem('markomods-scope5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope6')
end)
QBCore.Functions.CreateUseableItem('markomods-scope6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope7')
end)
QBCore.Functions.CreateUseableItem('markomods-scope7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope8')
end)
QBCore.Functions.CreateUseableItem('markomods-scope8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope9')
end)

-- Magazines

QBCore.Functions.CreateUseableItem('w_ar_hk416b_mag1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag1')
end)
QBCore.Functions.CreateUseableItem('markomods-mag1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag1')
end)
QBCore.Functions.CreateUseableItem('markomods-mag2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag2')
end)
QBCore.Functions.CreateUseableItem('markomods-mag3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag3')
end)
QBCore.Functions.CreateUseableItem('markomods-mag4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag4')
end)
QBCore.Functions.CreateUseableItem('markomods-mag5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag5')
end)
QBCore.Functions.CreateUseableItem('markomods-mag6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag6')
end)
QBCore.Functions.CreateUseableItem('markomods-mag7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag7')
end)

-- Stock

QBCore.Functions.CreateUseableItem('markomods-stock1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock1')
end)
QBCore.Functions.CreateUseableItem('markomods-stock2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock2')
end)
QBCore.Functions.CreateUseableItem('markomods-stock3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock3')
end)
QBCore.Functions.CreateUseableItem('markomods-stock4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock4')
end)
QBCore.Functions.CreateUseableItem('markomods-stock5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock5')
end)

-- Hand Gaurds 

QBCore.Functions.CreateUseableItem('markomods-handguard1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'gaurd1')
end)
QBCore.Functions.CreateUseableItem('markomods-handguard2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'gaurd2')
end)
QBCore.Functions.CreateUseableItem('markomods-handguard3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'gaurd3')
end)

--  Grips

QBCore.Functions.CreateUseableItem('markomods-grip1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip1')
end)
QBCore.Functions.CreateUseableItem('markomods-grip2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip2')
end)
QBCore.Functions.CreateUseableItem('markomods-grip3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip3')
end)
QBCore.Functions.CreateUseableItem('markomods-grip4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip4')
end)
QBCore.Functions.CreateUseableItem('markomods-grip5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'grip5')
end)

-- Suppressors 

QBCore.Functions.CreateUseableItem('markomods-suppressor1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor1')
end)
QBCore.Functions.CreateUseableItem('markomods-suppressor2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor2')
end)
QBCore.Functions.CreateUseableItem('markomods-suppressor3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor3')
end)
QBCore.Functions.CreateUseableItem('markomods-suppressor4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor4')
end)
QBCore.Functions.CreateUseableItem('markomods-suppressor5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor5')
end)
QBCore.Functions.CreateUseableItem('markomods-suppressor6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor6')
end)
QBCore.Functions.CreateUseableItem('markomods-suppressor7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'suppressor7')
end)

-- Flash Lights

QBCore.Functions.CreateUseableItem('markomods-flash1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash1')
end)
QBCore.Functions.CreateUseableItem('markomods-flash2', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash2')
end)
QBCore.Functions.CreateUseableItem('markomods-flash3', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash3')
end)
QBCore.Functions.CreateUseableItem('markomods-flash4', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash4')
end)
QBCore.Functions.CreateUseableItem('markomods-flash5', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash5')
end)
QBCore.Functions.CreateUseableItem('markomods-flash6', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash6')
end)
QBCore.Functions.CreateUseableItem('markomods-flash7', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash7')
end)
QBCore.Functions.CreateUseableItem('markomods-flash8', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'flash8')
end)

QBCore.Functions.CreateUseableItem('pm4-mag1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'mag1')
end)

QBCore.Functions.CreateUseableItem('pm4-muzzle1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'muzzle1')
end)

QBCore.Functions.CreateUseableItem('pm4-scope1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'scope1')
end)

QBCore.Functions.CreateUseableItem('pm4-stock1', function(source, item)
    TriggerClientEvent('weapons:client:EquipAttachment', source, item, 'stock1')
end)