Config = Config or {}

Config.ReloadTime = math.random(2000, 5000)

Config.DurabilityBlockedWeapons = {
    "weapon_stungun",
    "weapon_nightstick",
    "weapon_flashlight",
    "weapon_crowbar",
    "weapon_bat",
    "weapon_colbaton",
}

Config.Throwables = {
    "ball",
    "bzgas",
    "flare",
    "grenade",
    "molotov",
    "pipebomb",
    "proxmine",
    "smokegrenade",
    "snowball",
    "stickybomb",
}

Config.DurabilityMultiplier = {
	-- Melee
	-- ['weapon_unarmed'] 				 = 0.02,
	['weapon_dagger'] 				 = 0.02,
	--['weapon_bat'] 				 	 = 0.02,
	['weapon_bottle'] 				 = 0.02,
	--['weapon_crowbar'] 				 = 0.02,
	-- ['weapon_flashlight'] 			 = 0.02,
	['weapon_golfclub'] 			 = 0.02,
	['weapon_hammer'] 				 = 0.02,
	['weapon_hatchet'] 				 = 0.02,
	['weapon_knuckle'] 				 = 0.02,
	['weapon_knife'] 				 = 0.02,
	['weapon_machete'] 				 = 0.02,
	['weapon_switchblade'] 			 = 0.02,
	-- ['weapon_nightstick'] 			 = 0.02,
	['weapon_wrench'] 				 = 0.02,
	['weapon_battleaxe'] 			 = 0.02,
	['weapon_poolcue'] 				 = 0.02,
	['weapon_briefcase'] 			 = 0.02,
	['weapon_briefcase_02'] 		 = 0.02,
	['weapon_garbagebag'] 			 = 0.02,
	['weapon_handcuffs'] 			 = 0.02,
	['weapon_bread'] 				 = 0.02,
	['weapon_stone_hatchet'] 		 = 0.02,

	-- Handguns
	['weapon_pistol'] 				 = 0.02,
	['weapon_pistol_mk2'] 			 = 0.02,
	['weapon_combatpistol'] 		 = 0.02,
	['weapon_appistol'] 			 = 0.02,
	-- ['weapon_stungun'] 				 = 0.02,
    -- ['weapon_stungun_mp'] 				 = 0.02,
	['weapon_pistol50'] 			 = 0.02,
	['weapon_snspistol'] 			 = 0.02,
	['weapon_heavypistol'] 			 = 0.02,
	['weapon_vintagepistol'] 		 = 0.02,
	['weapon_flaregun'] 			 = 0.02,
	['weapon_marksmanpistol'] 		 = 0.02,
	['weapon_revolver'] 			 = 0.02,
	['weapon_revolver_mk2'] 		 = 0.02,
	['weapon_doubleaction'] 		 = 0.02,
	['weapon_snspistol_mk2'] 		 = 0.02,
	['weapon_raypistol'] 			 = 0.02,
	['weapon_ceramicpistol'] 		 = 0.02,
	['weapon_navyrevolver'] 		 = 0.02,
	['weapon_gadgetpistol'] 		 = 0.02,

	-- Submachine Guns
	['weapon_microsmg'] 			 = 0.02,
	['weapon_smg'] 				     = 0.02,
	['weapon_smg_mk2'] 				 = 0.02,
	['weapon_assaultsmg'] 			 = 0.02,
	['weapon_combatpdw'] 			 = 0.02,
	['weapon_machinepistol'] 		 = 0.02,
	['weapon_minismg'] 				 = 0.02,
	['weapon_raycarbine'] 			 = 0.02,

	-- Shotguns
	['weapon_pumpshotgun'] 			= 0.02,
	['weapon_sawnoffshotgun'] 		= 0.02,
	['weapon_assaultshotgun'] 		= 0.02,
	['weapon_bullpupshotgun'] 		= 0.02,
	['weapon_musket'] 				= 0.02,
	['weapon_heavyshotgun'] 		= 0.02,
	['weapon_dbshotgun'] 			= 0.02,
	['weapon_autoshotgun'] 			= 0.02,
	['weapon_pumpshotgun_mk2'] 		= 0.02,
	['weapon_combatshotgun'] 		= 0.02,

	-- Assault Rifles
	['weapon_assaultrifle'] 		= 0.02,
	['weapon_assaultrifle_mk2'] 	= 0.02,
	['weapon_carbinerifle'] 		= 0.02,
	['weapon_carbinerifle_mk2'] 	= 0.02,
	['weapon_advancedrifle'] 		= 0.02,
	['weapon_specialcarbine'] 		= 0.02,
	['weapon_bullpuprifle'] 		= 0.02,
	['weapon_compactrifle'] 		= 0.02,
	['weapon_specialcarbine_mk2'] 	= 0.02,
	['weapon_bullpuprifle_mk2'] 	= 0.02,
	['weapon_militaryrifle'] 		= 0.02,
    ['weapon_heavyrifle']           = 0.02,

	-- Light Machine Guns
	['weapon_mg'] 				    = 0.02,
	['weapon_combatmg'] 			= 0.02,
	['weapon_gusenberg'] 			= 0.02,
	['weapon_combatmg_mk2'] 		= 0.02,

	-- Sniper Rifles
	['weapon_sniperrifle'] 			= 0.02,
	['weapon_heavysniper'] 			= 0.02,
	['weapon_marksmanrifle'] 		= 0.02,
	['weapon_remotesniper'] 		= 0.02,
	['weapon_heavysniper_mk2'] 		= 0.02,
	['weapon_marksmanrifle_mk2'] 	= 0.02,

	-- Heavy Weapons
	['weapon_rpg'] 				    = 0.02,
	['weapon_grenadelauncher'] 		= 0.02,
	['weapon_grenadelauncher_smoke']= 0.02,
    ['weapon_emplauncher']          = 0.02,
	['weapon_minigun'] 				= 0.02,
	['weapon_firework'] 			= 0.02,
	['weapon_railgun'] 				= 0.02,
	['weapon_hominglauncher'] 		= 0.02,
	['weapon_compactlauncher'] 		= 0.02,
	['weapon_rayminigun'] 			= 0.02,

	-- Throwables
	['weapon_grenade'] 				= 0.02,
	['weapon_bzgas'] 				= 0.02,
	['weapon_molotov'] 				= 0.02,
	['weapon_stickybomb'] 			= 0.02,
	['weapon_proxmine'] 			= 0.02,
	['weapon_snowball'] 			= 0.02,
	['weapon_pipebomb'] 			= 0.02,
	['weapon_ball'] 				= 0.02,
	['weapon_smokegrenade'] 		= 0.02,
	['weapon_flare'] 				= 0.02,

	-- Miscellaneous
	['weapon_petrolcan'] 			= 0.02,
	['weapon_fireextinguisher'] 	= 0.02,
	['weapon_hazardcan'] 			= 0.02,
    ['weapon_fertilizercan'] 		= 0.02,
    ['weapon_2011'] 				= 0.02,
    ['weapon_miniuzi'] 				= 0.02,
    ['weapon_m4'] 				    = 0.02,
    ['weapon_fnx45'] 				= 0.02,
    ['weapon_pm4']                  = 0.02,
    ['weapon_bean_bag']             = 0.02,
}

Config.WeaponRepairPoints = {
    [1] = {
        coords = vector3(964.02, -1267.41, 34.97),
        IsRepairing = false,
        RepairingData = {},
    }
}

Config.WeaponRepairCosts = {
    ["pistol"] = 1000,
    ["smg"] = 3000,
    ["mg"] = 4000,
    ["rifle"] = 5000,
    ["sniper"] = 7000,
    ["shotgun"] = 6000
}

WeaponAttachments = {
    -- PISTOLS
    ['WEAPON_PISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_01',
            item = 'pistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL_CLIP_02',
            item = 'pistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PISTOL_VARMOD_LUXE',
            item = 'pistol_luxuryfinish',
        },
    },
    ['WEAPON_COMBATPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_01',
            item = 'combatpistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPISTOL_CLIP_02',
            item = 'combatpistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER',
            item = 'combatpistol_luxuryfinish',
        },
    },
    ['WEAPON_APPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_01',
            item = 'appistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_APPISTOL_CLIP_02',
            item = 'appistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_APPISTOL_VARMOD_LUXE',
            item = 'appistol_luxuryfinish',
        },
    },
    ['WEAPON_PISTOL50'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_01',
            item = 'pistol50_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_PISTOL50_CLIP_02',
            item = 'pistol50_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PISTOL50_VARMOD_LUXE',
            item = 'pistol50_luxuryfinish',
        },
    },
    ['WEAPON_REVOLVER'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_REVOLVER_CLIP_01',
            item = 'revolver_defaultclip',
        },
        ['vipvariant'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_GOON',
            item = 'revolver_vipvariant',
            type = 'skin',
        },
        ['bodyguardvariant'] = {
            component = 'COMPONENT_REVOLVER_VARMOD_BOSS',
            item = 'revolver_bodyguardvariant',
            type = 'skin',
        },
    },
    ['WEAPON_SNSPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_01',
            item = 'snspistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SNSPISTOL_CLIP_02',
            item = 'snspistol_extendedclip',
            type = 'clip',
        },
        ['grip'] = {
            component = 'COMPONENT_SNSPISTOL_VARMOD_LOWRIDER',
            item = 'snspistol_grip',
        },
    },
    ['WEAPON_HEAVYPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_01',
            item = 'heavypistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYPISTOL_CLIP_02',
            item = 'heavypistol_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE',
            item = 'heavypistol_grip',
        },
    },
    ['WEAPON_VINTAGEPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_01',
            item = 'vintagepistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_VINTAGEPISTOL_CLIP_02',
            item = 'vintagepistol_extendedclip',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
            type = 'silencer',
        },
    },
    -- SMG'S
    ['WEAPON_MICROSMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_01',
            item = 'microsmg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MICROSMG_CLIP_02',
            item = 'microsmg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_PI_FLSH',
            item = 'pistol_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'microsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_MICROSMG_VARMOD_LUXE',
            item = 'microsmg_luxuryfinish',
        },
    },
    ['WEAPON_SMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SMG_CLIP_01',
            item = 'smg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SMG_CLIP_02',
            item = 'smg_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SMG_CLIP_03',
            item = 'smg_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO_02',
            item = 'smg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_SMG_VARMOD_LUXE',
            item = 'smg_luxuryfinish',
        },
    },
    ['WEAPON_ASSAULTSMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_01',
            item = 'assaultsmg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSMG_CLIP_02',
            item = 'assaultsmg_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'microsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER',
            item = 'assaultsmg_luxuryfinish',
        },
    },
    ['WEAPON_MINISMG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_01',
            item = 'minismg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MINISMG_CLIP_02',
            item = 'minismg_extendedclip',
            type = 'clip',
        },
    },
    ['WEAPON_MACHINEPISTOL'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_01',
            item = 'machinepistol_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_02',
            item = 'machinepistol_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_MACHINEPISTOL_CLIP_03',
            item = 'machinepistol_drum',
            type = 'clip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_PI_SUPP',
            item = 'pistol_suppressor',
        },
    },
    ['WEAPON_COMBATPDW'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_01',
            item = 'combatpdw_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_02',
            item = 'combatpdw_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMBATPDW_CLIP_03',
            item = 'combatpdw_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'combatpdw_grip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'combatpdw_scope',
        },
    },
    -- SHOTGUNS
    ['WEAPON_PUMPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_SR_SUPP',
            item = 'shotgun_suppressor',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER',
            item = 'pumpshotgun_luxuryfinish',
        },
    },
    ['WEAPON_SAWNOFFSHOTGUN'] = {
        ['luxuryfinish'] = {
            component = 'COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE',
            item = 'sawnoffshotgun_luxuryfinish',
        },
    },
    ['WEAPON_ASSAULTSHOTGUN'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_01',
            item = 'assaultshotgun_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTSHOTGUN_CLIP_02',
            item = 'assaultshotgun_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_BULLPUPSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_HEAVYSHOTGUN'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_01',
            item = 'heavyshotgun_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_02',
            item = 'heavyshotgun_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_HEAVYSHOTGUN_CLIP_03',
            item = 'heavyshotgun_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
    },
    ['WEAPON_COMBATSHOTGUN'] = {
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
    },
    -- RIFLES
    ['WEAPON_ASSAULTRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_01',
            item = 'assaultrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_02',
            item = 'assaultrifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_ASSAULTRIFLE_CLIP_03',
            item = 'assaultrifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MACRO',
            item = 'microsmg_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE',
            item = 'assaultrifle_luxuryfinish',
        },
    },
    ['WEAPON_CARBINERIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_01',
            item = 'carbinerifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_02',
            item = 'carbinerifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_CARBINERIFLE_CLIP_03',
            item = 'carbinerifle_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'carbinerifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE',
            item = 'carbinerifle_luxuryfinish',
        },
    },
    ['WEAPON_ADVANCEDRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_01',
            item = 'advancedrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_CLIP_02',
            item = 'advancedrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'combatpdw_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE',
            item = 'advancedrifle_luxuryfinish',
        },
    },
    ['WEAPON_SPECIALCARBINE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_01',
            item = 'specialcarbine_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_02',
            item = 'specialcarbine_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_SPECIALCARBINE_CLIP_03',
            item = 'specialcarbine_drum',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'carbinerifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER',
            item = 'specialcarbine_luxuryfinish',
        },
    },
    ['WEAPON_BULLPUPRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_01',
            item = 'bullpuprifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_BULLPUPRIFLE_CLIP_02',
            item = 'bullpuprifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_SMALL',
            item = 'combatpdw_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW',
            item = 'bullpuprifle_luxuryfinish',
        },
    },
    ['WEAPON_COMPACTRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_01',
            item = 'compactrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_02',
            item = 'compactrifle_extendedclip',
            type = 'clip',
        },
        ['drum'] = {
            component = 'COMPONENT_COMPACTRIFLE_CLIP_03',
            item = 'compactrifle_drum',
            type = 'clip',
        },
    },
    ['WEAPON_HEAVYRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYRIFLE_CLIP_01',
            item = 'bullpuprifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_HEAVYRIFLE_CLIP_02',
            item = 'bullpuprifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_MEDIUM',
            item = 'carbinerifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_BULLPUPRIFLE_VARMOD_LOW',
            item = 'bullpuprifle_luxuryfinish',
        },
    },
    -- MACHINE GUNS
    ['WEAPON_GUSENBERG'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_GUSENBERG_CLIP_01',
            item = 'gusenberg_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_GUSENBERG_CLIP_02',
            item = 'gusenberg_extendedclip',
            type = 'clip',
        },
    },
    -- LAUNCHERS
    ['WEAPON_EMPLAUNCHER'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_EMPLAUNCHER_CLIP_01',
            item = 'emplauncher_defaultclip',
            type = 'clip',
        },
    },
    -- SNIPERS
    ['WEAPON_SNIPERRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_SNIPERRIFLE_CLIP_01',
            item = 'sniperrifle_defaultclip',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP_02',
            item = 'smg_suppressor',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            item = 'sniper_scope',
            type = 'scope',
        },
        ['advancedscope'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            item = 'snipermax_scope',
            type = 'scope',
        },
        ['grip'] = {
            component = 'COMPONENT_SNIPERRIFLE_VARMOD_LUXE',
            item = 'sniper_grip',
        },
    },
    ['WEAPON_HEAVYSNIPER'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_HEAVYSNIPER_CLIP_01',
            item = 'heavysniper_defaultclip',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE',
            item = 'sniper_scope',
            type = 'scope',
        },
        ['advancedscope'] = {
            component = 'COMPONENT_AT_SCOPE_MAX',
            item = 'snipermax_scope',
            type = 'scope',
        },
    },
    ['WEAPON_MARKSMANRIFLE'] = {
        ['defaultclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_01',
            item = 'marksmanrifle_defaultclip',
            type = 'clip',
        },
        ['extendedclip'] = {
            component = 'COMPONENT_MARKSMANRIFLE_CLIP_02',
            item = 'marksmanrifle_extendedclip',
            type = 'clip',
        },
        ['flashlight'] = {
            component = 'COMPONENT_AT_AR_FLSH',
            item = 'rifle_flashlight',
        },
        ['scope'] = {
            component = 'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM',
            item = 'marksmanrifle_scope',
        },
        ['suppressor'] = {
            component = 'COMPONENT_AT_AR_SUPP',
            item = 'rifle_suppressor',
        },
        ['grip'] = {
            component = 'COMPONENT_AT_AR_AFGRIP',
            item = 'rifle_grip',
        },
        ['luxuryfinish'] = {
            component = 'COMPONENT_MARKSMANRIFLE_VARMOD_LUXE',
            item = 'marksmanrifle_luxuryfinish',
        },
    },
    ['WEAPON_2011'] = {
        -- Mag
        ['clip1'] = {
            component = 'COMPONENT_MARKOMODS2011_CLIP_01',
            label = 'STI Mag 1',
            item = '2011_clip1',
        },
        ['clip2'] = {
            component = 'COMPONENT_MARKOMODS2011_CLIP_02',
            label = 'STI Mag 2',
            item = '2011_clip2',
        },
        -- Flashlight 
        ['light1'] = {
            component = 'COMPONENT_MARKOMODS2011_FLSH_01',
            label = 'STI Light 1',
            item = '2011_flash1',
        }, 
        ['light2'] = {
            component = 'COMPONENT_MARKOMODS2011_FLSH_02',
            label = 'STI Light 2',
            item = '2011_flash2',
        },
        ['light3'] = {
            component = 'COMPONENT_MARKOMODS2011_FLSH_03',
            label = 'STI Light 3',
            item = '2011_flash3',
        }, 
        ['light4'] = {
            component = 'COMPONENT_MARKOMODS2011_FLSH_04',
            label = 'STI Light 4',
            item = '2011_flash4',
        },
        ['light5'] = {
            component = 'COMPONENT_MARKOMODS2011_FLSH_05',
            label = 'STI Light 5',
            item = '2011_flash5',
        },
        -- Slide
        ['slide1'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_01',
            label = 'STI Slide 1',
            item = '2011_slide1',
        },
        ['slide2'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_02',
            label = 'STI Slide 2',
            item = '2011_slide2',
        }, 
        ['slide3'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_03',
            label = 'STI Slide 3',
            item = '2011_slide3',
        },
        ['slide4'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_04',
            label = 'STI Slide 4',
            item = '2011_slide4',
        }, 
        ['slide5'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_05',
            label = 'STI Slide 5',
            item = '2011_slide5',
        },
        ['slide6'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_06',
            label = 'STI Slide 6',
            item = '2011_slide6',
        }, 
        ['slide7'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_07',
            label = 'STI Slide 7',
            item = '2011_slide7',
        },
        ['slide8'] = {
            component = 'COMPONENT_MARKOMODS2011_SLIDE_08',
            label = 'STI Slide 8',
            item = '2011_slide8',
        }, 
        -- Muzzle
        ['muzzle1'] = {
            component = 'COMPONENT_MARKOMODS2011_MUZZLE_01',
            label = 'STI Muzzle 1',
            item = '2011_muzzle1',
        },
        ['muzzle2'] = {
            component = 'COMPONENT_MARKOMODS2011_MUZZLE_02',
            label = 'STI Muzzle 2',
            item = '2011_muzzle2',
        }, 
        ['muzzle3'] = {
            component = 'COMPONENT_MARKOMODS2011_MUZZLE_03',
            label = 'STI Muzzle 3',
            item = '2011_muzzle3',
        },
        -- Barrel
        ['barrel1'] = {
            component = 'COMPONENT_MARKOMODS2011_BARREL_01',
            label = 'STI Barrel 1',
            item = '2011_barrel1',
        },
        ['barrel2'] = {
            component = 'COMPONENT_MARKOMODS2011_BARREL_02',
            label = 'STI Barrel 2',
            item = '2011_barrel2',
        }, 
        ['barrel3'] = {
            component = 'COMPONENT_MARKOMODS2011_BARREL_03',
            label = 'STI Barrel 3',
            item = '2011_barrel3',
        }, 
    },
    ['WEAPON_MINIUZI'] = {
        -- Mag
        ['clip1'] = {
            component = 'COMPONENT_MARKOMODSUZI_CLIP_01',
            label = 'Mini Mag 1',
            item = 'miniuzi_clip1',
        },
        ['clip2'] = {
            component = 'COMPONENT_MARKOMODSUZI_CLIP_02',
            label = 'Mini Mag 2',
            item = 'miniuzi_clip2',
        },
        ['clip3'] = {
            component = 'COMPONENT_MARKOMODSUZI_CLIP_03',
            label = 'Mini Mag 3',
            item = 'miniuzi_clip3',
        },
        ['clip4'] = {
            component = 'COMPONENT_MARKOMODSUZI_CLIP_04',
            label = 'Mini Mag 4',
            item = 'miniuzi_clip4',
        },
        -- Stock
        ['stock1'] = {
            component = 'COMPONENT_MARKOMODSUZI_STOCK_01',
            label = 'Mini Stock 1',
            item = 'miniuzi_stock1',
        }, 
        ['stock2'] = {
            component = 'COMPONENT_MARKOMODSUZI_STOCK_02',
            label = 'Mini Stock 2',
            item = 'miniuzi_stock2',
        },
        -- Suppressor
        ['suppressor1'] = {
            component = 'COMPONENT_MARKOMODSUZI_SUPP_01',
            label = 'Mini Supp 1',
            item = 'miniuzi_suppressor1',
        }, 
        ['suppressor2'] = {
            component = 'COMPONENT_MARKOMODSUZI_SUPP_02',
            label = 'Mini Supp 2',
            item = 'miniuzi_suppressor2',
        },
        -- Scope
        ['scope1'] = {
            component = 'COMPONENT_MARKOMODSUZI_SCOPE_01',
            label = 'Mini Scope 1',
            item = 'miniuzi_scope1',
        },
        ['scope2'] = {
            component = 'COMPONENT_MARKOMODSUZI_SCOPE_02',
            label = 'Mini Scope 2',
            item = 'miniuzi_scope2',
        }, 
        ['scope3'] = {
            component = 'COMPONENT_MARKOMODSUZI_SCOPE_03',
            label = 'Mini Scope 3',
            item = 'miniuzi_scope3',
        },
        ['scope4'] = {
            component = 'COMPONENT_MARKOMODSUZI_SCOPE_04',
            label = 'Mini Scope 4',
            item = 'miniuzi_scope4',
        }, 
        ['scope5'] = {
            component = 'COMPONENT_MARKOMODSUZI_SCOPE_05',
            label = 'Mini Scope 5',
            item = 'miniuzi_scope5',
        },
        ['scope6'] = {
            component = 'COMPONENT_MARKOMODSUZI_SCOPE_06',
            label = 'Mini Scope 6',
            item = 'miniuzi_scope6',
        }, 
    },
    ['WEAPON_M4'] = {
        ['scope1'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_01',
            label = 'M4 Supressor 1',
            item = 'markomods-scope1',
        },
        ['scope2'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_02',
            label = 'M4 Supressor 2',
            item = 'markomods-scope2',
        },
        ['scope3'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_03',
            label = 'M4 Supressor 3',
            item = 'markomods-scope3',
        },
        ['scope4'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_04',
            label = 'M4 Supressor 4',
            item = 'markomods-scope4',
        },
        ['scope5'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_05',
            label = 'M4 Supressor 5',
            item = 'markomods-scope5',
        },
        ['scope6'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_06',
            label = 'M4 Supressor 6',
            item = 'markomods-scope6',
        },
        ['scope7'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_07',
            label = 'M4 Supressor 7',
            item = 'markomods-scope7',
        },
        ['scope8'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_08',
            label = 'M4 Supressor 8',
            item = 'markomods-scope8',
        },
        ['scope9'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_09',
            label = 'M4 Supressor 9',
            item = 'markomods-scope9',
        },
        ['mag1'] = {
            component = 'COMPONENT_MARKOMODSM4_CLIP_01',
            label = 'M4 Mag 1',
            item = 'markomods-mag1',
            type = 'clip',
        },
        ['mag2'] = {
            component = 'COMPONENT_MARKOMODSM4_CLIP_02',
            label = 'M4 Mag 3',
            item = 'markomods-mag2',
            type = 'clip',
        },
        ['mag3'] = {
            component = 'COMPONENT_MARKOMODSM4_CLIP_03',
            label = 'M4 Mag 3',
            item = 'markomods-mag3',
            type = 'clip',
        },
        ['mag4'] = {
            component = 'COMPONENT_MARKOMODSM4_CLIP_04',
            label = 'M4 Mag 4',
            item = 'markomods-mag4',
            type = 'clip',
        },
        ['mag5'] = {
            component = 'COMPONENT_MARKOMODSM4_CLIP_05',
            label = 'M4 Mag 5',
            item = 'markomods-mag5',
            type = 'clip',
        },
        ['mag6'] = {
            component = 'COMPONENT_MARKOMODSM4_CLIP_06',
            label = 'M4 Mag 6',
            item = 'markomods-mag6',
            type = 'clip',
        },
        ['mag7'] = {
            component = 'COMPONENT_MARKOMODSM4_CLIP_07',
            label = 'M4 Mag 7',
            item = 'markomods-mag7',
            type = 'clip',
        },
        ['stock1'] = {
            component = 'COMPONENT_MARKOMODSM4_STOCK_01',
            label = 'M4 Stock 1',
            item = 'markomods-stock1',
        },
        ['stock2'] = {
            component = 'COMPONENT_MARKOMODSM4_STOCK_02',
            label = 'M4 Stock 2',
            item = 'markomods-stock2',
        },
        ['stock3'] = {
            component = 'COMPONENT_MARKOMODSM4_STOCK_03',
            label = 'M4 Stock 3',
            item = 'markomods-stock3',
        },
        ['stock4'] = {
            component = 'COMPONENT_MARKOMODSM4_STOCK_04',
            label = 'M4 Stock 4',
            item = 'markomods-stock4',
        },
        ['stock5'] = {
            component = 'COMPONENT_MARKOMODSM4_STOCK_05',
            label = 'M4 Stock 5',
            item = 'markomods-stock5',
        },
        ['gaurd1'] = {
            component = 'COMPONENT_MARKOMODSM4_HANDGUARD_01',
            label = 'M4 Hand Guard 1',
            item = 'markomods-handguard1',
        },
        ['gaurd2'] = {
            component = 'COMPONENT_MARKOMODSM4_HANDGUARD_02',
            label = 'M4 Hand Guard 2',
            item = 'markomods-handguard2',
        },
        ['gaurd3'] = {
            component = 'COMPONENT_MARKOMODSM4_HANDGUARD_03',
            label = 'M4 Hand Guard 3',
            item = 'markomods-handguard3',
        },
        ['grip1'] = {
            component = 'COMPONENT_MARKOMODSM4_GRIP_01',
            label = 'M4 Grip 1',
            item = 'markomods-grip1',
        },
        ['grip2'] = {
            component = 'COMPONENT_MARKOMODSM4_GRIP_02',
            label = 'M4 Grip 2',
            item = 'mk18m4_grip2',
        },
        ['grip3'] = {
            component = 'COMPONENT_MARKOMODSM4_GRIP_03',
            label = 'M4 Grip 3',
            item = 'mk18m4_grip3',
        },
        ['grip4'] = {
            component = 'COMPONENT_MARKOMODSM4_GRIP_04',
            label = 'M4 Grip 4',
            item = 'mk18m4_grip4',
        },
        ['grip5'] = {
            component = 'COMPONENT_MARKOMODSM4_GRIP_05',
            label = 'M4 Grip 5',
            item = 'mk18m4_grip5',
        },
        ['suppressor1'] = {
            component = 'COMPONENT_MARKOMODSM4_SUPPRESSOR_01',
            label = 'M4 Supressor 1',
            item = 'markomods-suppressor1',
        },
        ['suppressor2'] = {
            component = 'COMPONENT_MARKOMODSM4_SUPPRESSOR_02',
            label = 'M4 Supressor 2',
            item = 'markomods-suppressor2',
        },
        ['suppressor3'] = {
            component = 'COMPONENT_MARKOMODSM4_SUPPRESSOR_03',
            label = 'M4 Supressor 3',
            item = 'markomods-suppressor3',
        },
        ['suppressor4'] = {
            component = 'COMPONENT_MARKOMODSM4_SUPPRESSOR_04',
            label = 'M4 Supressor 4',
            item = 'markomods-suppressor4',
        },
        ['suppressor5'] = {
            component = 'COMPONENT_MARKOMODSM4_SUPPRESSOR_05',
            label = 'M4 Supressor 5',
            item = 'markomods-suppressor5',
        },
        ['suppressor6'] = {
            component = 'COMPONENT_MARKOMODSM4_SUPPRESSOR_06',
            label = 'M4 Supressor 6',
            item = 'markomods-suppressor6',
        },
        ['suppressor7'] = {
            component = 'COMPONENT_MARKOMODSM4_SUPPRESSOR_07',
            label = 'M4 Supressor 7',
            item = 'markomods-suppressor7',
        },
        ['scope1'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_01',
            label = 'M4 Scope 1',
            item = 'markomods-scope1',
        },
        ['scope2'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_02',
            label = 'M4 Scope 2',
            item = 'markomods-scope2',
        },
        ['scope3'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_03',
            label = 'M4 Scope 3',
            item = 'markomods-scope3',
        },
        ['scope4'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_04',
            label = 'M4 Scope 4',
            item = 'markomods-scope4',
        },
        ['scope5'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_05',
            label = 'M4 Scope 5',
            item = 'markomods-scope5',
        },
        ['scope6'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_06',
            label = 'M4 Scope 6',
            item = 'markomods-scope6',
        },
        ['scope7'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_07',
            label = 'M4 Scope 7',
            item = 'markomods-scope7',
        },
        ['scope8'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_08',
            label = 'M4 Scope 8',
            item = 'markomods-scope8',
        },
        ['scope9'] = {
            component = 'COMPONENT_MARKOMODSM4_SCOPE_09',
            label = 'M4 Scope 9',
            item = 'markomods-scope9',
        },
        ['flash1'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_01',
            label = 'M4 Light 1',
            item = 'markomods-flash1',
        },
        ['flash2'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_02',
            label = 'M4 Light 2',
            item = 'markomods-flash2',
        },
        ['flash3'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_03',
            label = 'M4 Light 3',
            item = 'markomods-flash3',
        },
        ['flash4'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_04',
            label = 'M4 Light 4',
            item = 'markomods-flash4',
        },
        ['flash5'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_05',
            label = 'M4 Light 5',
            item = 'markomods-flash5',
        },
        ['flash6'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_06',
            label = 'M4 Light 6',
            item = 'markomods-flash6',
        },
        ['flash7'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_07',
            label = 'M4 Light 7',
            item = 'markomods-flash7',
        },
        ['flash8'] = {
            component = 'COMPONENT_MARKOMODSM4_FLASH_08',
            label = 'M4 Light 8',
            item = 'markomods-flash8',
        },       
    },
    ['WEAPON_pm4'] = {
        ['mag1'] = {
            component = 'COMPONENT_MARKOMODS_PM4_MAG_1',
            label = 'Mag 1',
            item = 'pm4-mag1',
        },
        ['muzzle1'] = {
            component = 'COMPONENT_MARKOMODS_PM4_MUZZLE_1',
            label = 'Muzzle 1',
            item = 'pm4-muzzle1',
        },
        ['scope1'] = {
            component = 'COMPONENT_MARKOMODS_PM4_SCOPE_1',
            label = 'Scope 1',
            item = 'pm4-scope1',
        },
        ['stock1'] = {
            component = 'COMPONENT_MARKOMODS_PM4_STOCK_1',
            label = 'Stock 1',
            item = 'pm4-stock1',
        },
    },
}

local function getConfigWeaponAttachments(weapon)
    return WeaponAttachments[weapon]
end

exports('getConfigWeaponAttachments', getConfigWeaponAttachments)
