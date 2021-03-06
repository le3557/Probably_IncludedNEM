-- ProbablyEngine Rotation Packager
-- Custom Protection Paladin Rotation
-- Created on Dec 23rd 2013 10:07 am
ProbablyEngine.rotation.register_custom(66, "NEM Solo-PvP", 
{
-- PVP Trink Insignia of the Alliance
	-- Insignia of the Alliance
	{"#29593", "player.state.fear"},					
	{"#29593", "player.state.incapacitate"},
	{"#29593", "player.state.disorient"},

-- Racials start
-- PVP Gnome
	-- Escape Artist
	{"20589", "player.state.snare"},						
	{"20589", "player.state.root"},						

-- PVP Human Racial
	-- Every Man for Himself
	{"59752", "player.state.fear"},						
	{"59752", "player.state.incapacitate"},
	{"59752", "player.state.disorient"},

-- PVP Dwarf Racial
	-- Stoneform cures Poison, Disease and Bleed
	{"20594","player.dispellable(20594)"}, -- untested
	
-- PVP Undead Racial
	-- Will of the Forsaken
	{"7744", "player.state.charm"},						
	{"7744", "player.state.fear"},						
	{"7744", "player.state.sleep"},						

-- OTHER Racials
	-- Blood Elf Arcane Torrent by name each class has own spellID
	{"Arcane Torrent","target.range <= 8"}, --untested
	-- Troll Berserking on CD
	{"26297"}, 
	-- Orc Blood Fury onCD by name multiple spellIDs
	{"Blood Fury"},
	-- Draenei Gift of the Naaru **included for copy/paste**
	{"Gift of the Naaru","player.health <= 80"},
	-- Pandaren Quaking Palm SAP **included for copy/paste**
	{"107079","modifier.interrupts"},
	-- Goblin Rocket Barrage **included for copy/paste**
	-- {"69041"},
	-- Goblin Rocket Jump **included for copy/paste**
	-- {"69070"},
	-- Night Elf Shadowmeld **included for copy/paste**
	-- {"58984"},
	-- Tauren War Stomp **included for copy/paste**
	{"20549","target.range <= 8"}, --untested
-- Racials end	

    -- Seals
    { "Seal of Righteousness", 
		{	"modifier.multitarget",
			"player.seal != 2",
			"spell(20154).exists"
		}
	},

    -- Dynamic Multitarget Seals
    -- Heal after Censure
    { "Seal of Insight", {
            "target.debuff(Censure).count = 5",
            "target.debuff(Censure).duration > 5",
            "player.seal != 3",
            "!modifier.multitarget"
    }},
    -- Refresh Censure
    { "Seal of Truth", {
            "target.debuff(Censure).duration <= 5",
            "player.seal != 1",
            "!modifier.multitarget"
    }},
    -- Apply Censure
    { "Seal of Truth", {
            "target.debuff(Censure).count < 5",
            "player.seal != 1",
            "!modifier.multitarget"
    }},

    -- Taunts
    { "Reckoning", "modifier.taunt" },

    -- Interrupts
    { "Rebuke", "modifier.interrupts" },
    { "Avenger's Shield", "modifier.interrupts" },

	-- Damage Reduction & Healing
    { "Sacred Shield", "!player.buff(Sacred shield)" }, 	-- T3 Talent
    { "Hand of Purity" },  									-- T4 Talent
    { "Shield of the Righteous", "player.holypower = 5" },
    { "Shield of the Righteous", 							-- 84 or lower
		{	"player.holypower = 3",
			"player.health >= 50",
			"!player.spell(Boundless Conviction).exists"
		}
	},
    { "Shield of the Righteous", "modifier.shift" },
    { "Word of Glory", "modifier.alt" },
    { "Word of Glory", 
		{	"player.holypower >= 3",
			"player.health <= 75",
		}
	},
    { "Word of Glory","player.health <= 50"},
    { "Eternal Flame", 										-- T3 Talent
		{	"!player.buff(Eternal Flame)",
			"player.holypower >= 3"
		}, 	
	},
    { "Eternal Flame", 										-- T3 Talent
		{	"!player.buff(Eternal Flame)",
			"player.health <= 50"
		}, 	
	},

    -- Survival
    { "Ardent Defender", "player.health < 15" },
    { "Divine Protection", "player.health < 35" },
    { "Guardian of Ancient Kings", "player.health < 50" },

    --Cooldowns
    { "Holy Avenger", "modifier.cooldowns" },  -- T5 Talent


    -- DPS Rotation
    { "Hammer of the Righteous", "modifier.enemies >= 3" },
    { "Crusader Strike" },
    { "Judgment" },
    { "Consecration", 
		{	"target.range <= 5",
			"modifier.enemies >= 3"
		}
	},
    { "Avenger's Shield", "player.buff(Grand Crusader)" },	
    -- T6 Talents
    { "Holy Prism" },
    { "Light's Hammer" , "modifier.shift", "ground" },
    { "Execution Sentence" },
    { "Holy Wrath" },
    { "Hammer of Wrath" },
    { "Consecration", "target.range <= 5" },
},
	{
	-- OOC Buffing
	--Blessing of Might 19740 lvl 81
		{ "Blessing of Might", 
			{	"!player.buff(Blessing of Might)",
				"!player.buff(Grace of Air)",
				"!player.buff(Roar of Courage)",
				"!player.buff(Spirit Beast Blessing)",
				"toggle.BoM"
			}
		},
	--Blessing of Kings 20217 lvl 30
		{"Blessing of Kings", 
			{	"!player.buff(Blessing of Kings)",
				"!player.buff(Legacy of the Emperor)",
				"!player.buff(Mark of the Wild)",
				"!player.buff(Embrace of the Shale Spider)",
				"!player.buff(Blessing of Forgotten Kings)",
				"!toggle.BoM"
			}
		},
		{"Blessing of Kings", 
			{	"!player.buff(Blessing of Kings)",
				"!player.buff(Legacy of the Emperor)",
				"!player.buff(Mark of the Wild)",
				"!player.buff(Embrace of the Shale Spider)",
				"!player.buff(Blessing of Forgotten Kings)",
				"@player.spell(Blessing of Kings).exists"
			}
		},
	}, 
function()
ProbablyEngine.toggle.create('BoM', 'Interface\\Icons\\spell_holy_greaterblessingofkings', 'Blessing of Might OOC', 'Blessing of Might on, BoK off')
end)
