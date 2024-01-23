---------------------------------------------------------------------------------------------------------------------
--	����� �������
--	�����:  ������� ������  (Stohe)
--	update: ����� ��������� (Chugai)
-- nv 100808 removed rnd and prior (only rnd was used by xr_sounds.script, itself not used)
-- nv 100808 removed some unused references, added rmk_type to sound tables
-- nv 121025 minor tweaks to Yurik robbery, enemy, idle camp chatter
----------------------------------------------------------------------------------------------------------------------
-- keep these the same as in xr_sound.script
local const rmk_chatter   = 0 -- one second
local const rmk_react     = 1 -- one to two
local const rmk_muse      = 2 -- three to five
local const rmk_once      = 3 -- three to five, played only once
local const rmk_greet     = 4 -- requires min/max
local const rmk_sporadic  = 5 -- requires min/max
local const rmk_priority  = 6 -- requires min/max

nstl = 64

snd_ini = ini_file("misc\\script_sound.ltx")

theme = {}
ph_snd_themes = {}
ph_snd_themes["music"] = {  "characters_voice\\scenario\\megafon\\megafon_music_1",
	                        "characters_voice\\scenario\\megafon\\megafon_music_2",
	                        "characters_voice\\scenario\\megafon\\megafon_music_3"
	                        }
ph_snd_themes["humor"] = {  "characters_voice\\scenario\\escape\\comandir_megafon_1",
							"characters_voice\\scenario\\escape\\comandir_megafon_2",
							"characters_voice\\scenario\\escape\\comandir_megafon_3",
							"characters_voice\\scenario\\escape\\comandir_megafon_4",
							"characters_voice\\scenario\\escape\\comandir_megafon_5",
							"characters_voice\\scenario\\escape\\comandir_megafon_6",
							"characters_voice\\scenario\\escape\\comandir_megafon_7",
							"characters_voice\\scenario\\escape\\comandir_megafon_8",
							"characters_voice\\scenario\\escape\\comandir_megafon_9",
							"characters_voice\\scenario\\escape\\comandir_megafon_10",
							"characters_voice\\scenario\\escape\\comandir_megafon_11",
							"characters_voice\\scenario\\escape\\comandir_megafon_12",
							"characters_voice\\scenario\\escape\\comandir_megafon_13",
							"characters_voice\\scenario\\escape\\comandir_megafon_14",
							"characters_voice\\scenario\\escape\\comandir_megafon_15",
							"characters_voice\\scenario\\escape\\comandir_megafon_16",
							"characters_voice\\scenario\\escape\\comandir_megafon_17"
	                        }
ph_snd_themes["epic"] = { "characters_voice\\scenario\\escape\\megafon_1",
							"characters_voice\\scenario\\escape\\megafon_2",
							"characters_voice\\scenario\\escape\\megafon_3",
							"characters_voice\\scenario\\escape\\megafon_4"
	                        }
ph_snd_themes["alarm1"] = { "characters_voice\\scenario\\megafon\\megafon_alarm_1",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_10",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_11",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_12",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_13"
	                        }
ph_snd_themes["alarm2"] = { "characters_voice\\scenario\\megafon\\megafon_alarm_2",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_3",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_4",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_5",
	                        "characters_voice\\scenario\\megafon\\megafon_alarm_6"
	                      }
ph_snd_themes["siren"] =  { "ambient\\siren2" }
ph_snd_themes["bomb"] = {"detectors\\bomb_timer"}
ph_snd_themes["detector"] = {"detectors\\da-2_beep1"}


ph_snd_themes["radio_music"] = {"characters_voice\\scenario\\bar\\radio_music\\radio_music_1"}

ph_snd_themes["dolg_speech"]		= {[[characters_voice\scenario\bar\barman_megafon\megaphone_barman_1]],
									   [[characters_voice\scenario\bar\barman_megafon\megaphone_barman_2]],
									   [[characters_voice\scenario\bar\dolg_megafon\mega_duty_propaganda_1]],
									   [[characters_voice\scenario\bar\dolg_megafon\mega_duty_propaganda_2]],
									   [[characters_voice\scenario\bar\dolg_megafon\mega_duty_propaganda_3]],
									   [[characters_voice\scenario\bar\dolg_megafon\mega_duty_propaganda_4]],
									   [[characters_voice\scenario\bar\dolg_megafon\mega_duty_propaganda_5]],
									   [[characters_voice\scenario\megafon\megafon_music_1]],
									   [[characters_voice\scenario\megafon\megafon_music_2]],
									   [[characters_voice\scenario\megafon\megafon_music_3]]}
ph_snd_themes["dolg_alarm"]			= {[[characters_voice\scenario\bar\dolg_megafon\megaphone_duty_alarm]]}
ph_snd_themes["dolg_megafon_1_hit"] = {[[characters_voice\scenario\bar\dolg_megafon\duty_gunfire_mega_1]]}
ph_snd_themes["dolg_megafon_2_hit"] = {[[characters_voice\scenario\bar\dolg_megafon\duty_gunfire_mega_2]]}
ph_snd_themes["dolg_megafon_kill"]	= {[[characters_voice\scenario\bar\dolg_megafon\duty_gunfire_mega_3]]}
ph_snd_themes["arena_introduce_pseudodog"]	= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_pseudodog]]}
ph_snd_themes["arena_introduce_snork"]		= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_snork]]}
ph_snd_themes["arena_introduce_bloodsucker"]= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_bloodsucker]]}
ph_snd_themes["arena_introduce_burer"]		= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_burer]]}
ph_snd_themes["arena_introduce_savage"]		= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_zver]]}
ph_snd_themes["arena_actor_afraid"]			= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_coward]]}
ph_snd_themes["arena_fight_begin"]			= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_start]]}
ph_snd_themes["arena_fight_victory"]		= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_win_1]]}
ph_snd_themes["arena_fight_victory_notime"]	= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_win_2]]}
ph_snd_themes["arena_fight_lose"]			= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_out_of_time_win]]}
ph_snd_themes["arena_fight_death"]			= {[[characters_voice\scenario\bar\arena_megafon\mega_arena_dead]]}

ph_snd_themes["bar_start_megafon"]		= {[[characters_voice\scenario\bar\barman_megafon\megaphone_barman_1]],
									   [[characters_voice\scenario\bar\barman_megafon\megaphone_barman_2]],
									   [[characters_voice\scenario\bar\dolg_megafon\mega_duty_propaganda_1]],
									   [[characters_voice\scenario\bar\dolg_megafon\mega_duty_propaganda_2]]}

ph_snd_themes["mon_monolith_damaged"]			= {[[characters_voice\scenario\sarcofag\monolith_damaged]]}
ph_snd_themes["mon_monolith_heavy_damaged"]		= {[[characters_voice\scenario\sarcofag\monolith_heavy_damaged]]}
ph_snd_themes["mon_monolith_alarm"]				= {[[characters_voice\scenario\sarcofag\monolith_alarm]]}
ph_snd_themes["mon_monolith_recharged"]			= {[[characters_voice\scenario\sarcofag\monolith_recharged]]}

-- Monolith voice in Russian
ph_snd_themes["sar_monolith_call"]			= {[[characters_voice\scenario\sarcofag\monolith_call_1]],
												[[characters_voice\scenario\sarcofag\monolith_call_2]],
												[[characters_voice\scenario\sarcofag\monolith_call_3]],
												[[characters_voice\scenario\sarcofag\monolith_call_4]],
												[[characters_voice\scenario\sarcofag\monolith_call_5]],
												[[characters_voice\scenario\sarcofag\monolith_call_6]],
												[[characters_voice\scenario\sarcofag\monolith_call_7]]}

ph_snd_themes["gar_seryi_shooting"]	= {[[characters_voice\scenario\garbage\distance_shooting]]}
ph_snd_themes["gar_seryi_shooting_2"]	= {[[characters_voice\scenario\bandits\bandit_replic_2]]}
-- ph_snd_themes["aes_battle1"] = {"ambient\\battle_1"}
-- ph_snd_themes["aes_battle2"] = {"ambient\\battle_2"}
ph_snd_themes["aes_battle1"] = {"ambient\\battle_1"}
ph_snd_themes["aes_battle2"] = {"ambient\\battle_2"}
ph_snd_themes["gar_bandits_seryi"] =   {[[characters_voice\scenario\garbage\grey_bandit_1]],
										[[characters_voice\scenario\garbage\grey_bandit_2]],
										[[characters_voice\scenario\garbage\grey_bandit_3]],
										[[characters_voice\scenario\garbage\grey_bandit_4]],
										[[characters_voice\scenario\garbage\grey_bandit_5]]}
ph_snd_themes["radar_drone"] = {"ambient\\radar_1"}
ph_snd_themes["radar_thunder"] = {"ambient\\radar_2"}
ph_snd_themes["radar_sparks"] = {"ambient\\radarsparks_1"}
ph_snd_themes["aes_teleport"] = {"anomaly\\teleport_incoming"}

ph_snd_themes["yan_antenna"] = {{"characters_voice\\scenario\\yantar\\psy_voices_1"}} --' ������

ph_snd_themes["radar_meh_on"] = {"ambient\\cooling_run"}
ph_snd_themes["radar_meh_off"] = {"ambient\\cooling_stop"}
ph_snd_themes["radar_meh_loud_on"] = {"ambient\\cooling_run_loud"}
ph_snd_themes["radar_meh_loud_off"] = {"ambient\\cooling_stop_loud"}
ph_snd_themes["system_message_1"]	= {[[characters_voice\scenario\yantar\system_message_1]]}
ph_snd_themes["system_message_2"]	= {[[characters_voice\scenario\yantar\system_message_2]]}
ph_snd_themes["system_message_3"]	= {[[characters_voice\scenario\yantar\system_message_3]]}
ph_snd_themes["system_message_4"]	= {[[characters_voice\scenario\yantar\system_message_4]]}
ph_snd_themes["system_message_5"]	= {[[characters_voice\scenario\yantar\system_message_5]]}
ph_snd_themes["agro_test"]	= {[[weapons\grenade1]]}
ph_snd_themes["bar_arena_public"]	= {"characters_voice\\scenario\\bar\\arena_public\\new_arena_public_1",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_1",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_2",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_3",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_4",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_5",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_6",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_7",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_8",
	                        "characters_voice\\scenario\\bar\\arena_public\\new_arena_public_9"
	                        }
ph_snd_themes["bar_arena_public_death"]	= {"ambient\\arena\\crowd_wave_1",
	                        "ambient\\arena\\crowd_wave_2",
	                        "ambient\\arena\\crowd_wave_3"
	                        }
ph_snd_themes["bar_arena_fight_1"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_1_ready"}
ph_snd_themes["bar_arena_fight_1_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_1_finish"}
ph_snd_themes["bar_arena_fight_2"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_2_ready"}
ph_snd_themes["bar_arena_fight_2_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_2_finish"}
ph_snd_themes["bar_arena_fight_3"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_3_ready"}
ph_snd_themes["bar_arena_fight_3_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_3_finish"}
ph_snd_themes["bar_arena_fight_4"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_4_ready"}
ph_snd_themes["bar_arena_fight_4_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_4_finish"}
ph_snd_themes["bar_arena_fight_5"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_5_ready"}
ph_snd_themes["bar_arena_fight_5_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_5_finish"}
ph_snd_themes["bar_arena_fight_6"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_6_ready"}
ph_snd_themes["bar_arena_fight_6_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_6_finish"}
ph_snd_themes["bar_arena_fight_7"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_7_ready"}
ph_snd_themes["bar_arena_fight_7_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_7_finish"}
ph_snd_themes["bar_arena_fight_8"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_8_ready"}
ph_snd_themes["bar_arena_fight_8_end"]	= {"characters_voice\\scenario\\bar\\arena_sound\\bar_fight_8_finish"}

ph_snd_themes["x18_sound_1"] = {"ambient\\x18\\x18_hit_8"}
ph_snd_themes["x18_sound_2"] = {"ambient\\x18\\x18_metal_2"}
ph_snd_themes["x18_sound_3"] = {"ambient\\x18\\x18_metal_3"}
ph_snd_themes["x18_sound_4"] = {"ambient\\x18\\x18_metal_4"}
ph_snd_themes["x18_sound_5"] = {"ambient\\x18\\x18_metal_5"}
ph_snd_themes["x18_sound_6"] = {"ambient\\x18\\x18_creak_2"}
ph_snd_themes["x18_sound_7"] = {"ambient\\x18\\x18_creak_1"}
ph_snd_themes["x18_sound_8"] = {"ambient\\x18\\x18_hit_7"}
ph_snd_themes["x18_sound_9"] = {"ambient\\x18\\x18_footsteps_2"}
ph_snd_themes["x18_sound_10"] = {"ambient\\x18\\x18_move_4"}
ph_snd_themes["x18_sound_11"] = {"ambient\\x18\\x18_footsteps"}
ph_snd_themes["x18_sound_12"] = {"ambient\\x18\\x18_move_3"}

ph_snd_themes["x16_engine1_run"] = {"ambient\\x16\\x16_engine1_run"}
ph_snd_themes["x16_engine1_stop"] = {"ambient\\x16\\x16_engine1_stop"}

ph_snd_themes["x16_engine2_run"] = {"ambient\\x16\\x16_engine2_run"}
ph_snd_themes["x16_engine2_stop"] = {"ambient\\x16\\x16_engine2_stop"}

ph_snd_themes["x16_hum_2"] = {"ambient\\x16\\x16_hum_2"}
ph_snd_themes["x16_switch_1"] = {"ambient\\x16\\switch_1"}
ph_snd_themes["x16_switch_2"] = {"ambient\\x16\\switch_2"}

ph_snd_themes["x18_firedoor"] = {"anomaly\\fireball_idle"}
ph_snd_themes["mon_poltergeist"] = {"anomaly\\anomaly_gravy_hit1"}

ph_snd_themes["psy_voices"] = {{[[characters_voice\scenario\yantar\psy_voices_1]]}} --' ������

ph_snd_themes["heli_explosion"] = {[[weapons\heli_explosion]]}

ph_snd_themes["trader_door_open_start"]		= {[[device\door_start]]}
ph_snd_themes["trader_door_close_start"]	= {[[device\door_closing]]}
ph_snd_themes["trader_door_close_stop"]		= {[[device\door_stop]]}
ph_snd_themes["trader_door_locked"]			= {[[device\door_locked]]}
ph_snd_themes["trader_door_unlock"]			= {[[device\door_servomotor]]}
ph_snd_themes["wood_small_open"]			= {[[device\wood_small_open]]}
ph_snd_themes["wood_small_close_start"]		= {[[device\wood_small_close_start]]}
ph_snd_themes["wood_small_close_stop"]		= {[[device\wood_small_close_stop]]}
ph_snd_themes["wood_large_open"]			= {[[device\wood_large_open]]}
ph_snd_themes["wood_large_close_start"]		= {[[device\wood_large_close_start]]}
ph_snd_themes["wood_large_close_stop"]		= {[[device\wood_large_close_stop]]}
ph_snd_themes["metal_small_open"]			= {[[device\metal_small_open]]}
ph_snd_themes["metal_small_close_start"]	= {[[device\metal_small_close_start]]}
ph_snd_themes["metal_small_close_stop"]		= {[[device\metal_small_close_stop]]}


-----------------------------------------------------------------------------------------------------------------------------------
--	Theme  functions
-----------------------------------------------------------------------------------------------------------------------------------
function weather_class(avail_types, npc)
	-- local type = "weather_good"
	-- if level.rain_factor() < 0.07 then
		-- type = "weather_good"
	-- else
		-- type = "weather_bad"
	-- end
	-- return type
	if level.rain_factor() < 0.07 then
		return "weather_good"
	end
	return "weather_bad"
end

function combat_class(avail_types, npc)
	if npc:best_enemy() ~= nil or
	   npc:best_danger() ~= nil
	then
		return ""
	end
	return "state"
end

-------------------------------------------------------------------------
-- ����� ���������
-------------------------------------------------------------------------
local sounds_base = stalker_ids.sound_script + 10000

function id()
	sounds_base = sounds_base + 1
	return sounds_base - 1
end

-- these sound themes have corresponding *_rnd, *_seq and/or *_single entries in config\misc\script_sound.ltx
-- if you add/remove any, make sure the rnd_id/into_id support is kept in sync.  (Some have both types.)

theme = {
	-- ������
	weather = {	exec = sound_theme.weather_class,
				types = {weather_bad	= {rmk_type = rmk_sporadic, min_snd=25, max_snd=60, rnd_id = id(), max_ids = {}},
						 weather_good	= {rmk_type = rmk_sporadic, min_snd=25, max_snd=60, rnd_id = id(), max_ids = {}} }},

	-- ��������� ����
	state = {	exec = sound_theme.combat_class,
				types = {state	= {rmk_type = rmk_sporadic, min_snd=25, max_snd=60, rnd_id=id(), max_ids={}, rnd = 75}} },

	sleep				= {rmk_type = rmk_sporadic, min_snd = 10, max_snd = 15, rnd_id = id(), max_ids = {}, rnd = 75},

	-- ������� � ������
	help				= {rmk_type = rmk_muse, rnd_id = id(), into_id = id(), max_ids = {}},
	help_see			= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 10, rnd_id = id(), into_id = id(), max_ids = {}},
	-- help_see_tutor		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	help_heavy			= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 10, rnd_id = id(), max_ids = {}},
	help_thanx			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	wounded_psy			= {rmk_type = rmk_muse, rnd_id = id(), into_id = id(), max_ids = {}},
	wounded_psy_shoot	= {rmk_type = rmk_muse, into_id = id(), max_ids = {}},

	-- �����
	hail				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},

	-- ��������
	wait				= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},

	-- speech
    speech				= {rmk_type = rmk_once, rnd_id = id(), into_id = id(), max_ids = {}},
	-- only used for krot (Mole) -- cheesy duplicate of Shaggy whine
    speech1				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},

	-- ������
	threat_weap			= {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
	threat_back			= {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
	threat_stop			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},

	-- �������
--	reac_hear				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	reac_see				= {rmk_type = rmk_react, rnd_id = id(), max_ids = {}},
--	reac_crps_monstr		= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
--	reac_crps_enemy			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
--	reac_crps_neutral		= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
--	reac_crps_friend		= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	-- reac_nothing			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	-- this one is only referenced in a disabled section in bind_stalker.script
	-- reac_box				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	reac_music				= {rmk_type = rmk_react, rnd_id = id(), max_ids = {}},
	reac_joke				= {rmk_type = rmk_react, rnd_id = id(), max_ids = {}},

	-- ��������
	talk_hello				= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	talk_hello_friend		= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	talk_bye				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	talk_accept				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	talk_reject				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	talk_abuse				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},

	-- ������� �� ������
	use_yes_fight			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_yes_sleep			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_yes_kamp			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_yes_default			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_no_fight			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_no_sleep			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_no_weapon			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_no_default			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	use_abuse				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},

	-- ���
	-- fight_attack			= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	fight_attack			= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},
	zombied_fight_attack	= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 10, rnd_id = id(), max_ids = {}},
	fight_search			= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},
	-- fight_enemy				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	fight_enemy				= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 20, rnd_id = id(), max_ids = {}},

	-- ��������
	trade_yes				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	trade_no				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},

	-- ���� �� ������ ��������
	intro_music				= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},
	harmonica				= {rmk_type = rmk_react, rnd_id = id(), max_ids = {}}, -- normally 3 to 5

	-- ���� �� ������
	guitar					= {rmk_type = rmk_react, rnd_id = id(), max_ids = {}}, -- normally 3 to 5

	-- �����, ���������
	intro_joke				= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},
	joke					= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},

	-- �������
	story_01				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= {	[2] = {theme = "story_reac_cool_info", min = 1, max = 1},
								[3] = {theme = "story_reac_continue", min = 2, max = 3},
								[5] = {theme = "story_reac_laughter", type = "all"}}},
	story_02				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= {	[2] = {theme = "story_reac_yes", min = 1, max = 2},
								[3] = {theme = "story_reac_continue", min = 1, max = 1},
								[4] = {theme = "story_reac_action_right", min = 1, max = 1},
								[5] = {theme = "story_reac_cool_teller", min = 1, max = 1},
								[6] = {theme = "story_reac_continue", min = 1, max = 1},
								[7] = {theme = "story_reac_belief_story, story_reac_final_happy, story_reac_yes", min = 2, max = 4}}},
	story_03				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= {	[1] = {theme = "story_reac_continue", min = 1, max = 1},
								[2] = {theme = "story_reac_final_tragic", min = 1, max = 1},
								[3] = {theme = "story_reac_belief_story", min = 2, max = 3}}},
	story_04				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= {	[1] = {theme = "story_reac_continue", min = 1, max = 1},
								[2] = {theme = "story_reac_final_tragic", min = 1, max = 1},
								[3] = {theme = "story_reac_belief_story", min = 2, max = 3}}},
	story_05				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= {	[1] = {theme = "story_reac_advice_sceptic, story_reac_advice_support", min = 1, max = 1}}},
	story_06				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= {	[2] = {theme = "story_reac_continue", min = 1, max = 1},
								[3] = {theme = "story_reac_cool_teller", min = 1, max = 1},
								[4] = {theme = "story_reac_action_right", min = 1, max = 1},
								[5] = {theme = "story_reac_yes", min = 1, max = 1},
								[6] = {theme = "story_reac_disbelief_teller, story_reac_belief_story", min = 2, max = 3},
								[7] = {theme = "story_reac_cool_teller", min = 1, max = 1},
								[8] = {theme = "story_reac_wonder", min = 1, max = 1},
								[9] = {theme = "story_reac_disbelief_story, story_reac_belief_story, story_reac_yes", min = 2, max = 4}}},

	legend_01				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= { [1] = {theme = "story_reac_doubt", min = 1, max = 1},
								[2] = {theme = "story_reac_wonder, story_reac_disbelief_story", min = 1, max = 1},
								[3] = {theme = "story_reac_yes", min = 2, max = 3},
								[4] = {theme = "story_reac_yes, story_reac_belief_story", min = 2, max = 4}}},
	legend_02				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= { [1] = {theme = "story_reac_doubt", min = 1, max = 1},
								[2] = {theme = "story_reac_disbelief_story", min = 1, max = 1},
								[3] = {theme = "story_reac_wonder", min = 1, max = 1},
								[4] = {theme = "story_reac_laughter", min = 1, max = 1},
								[5] = {theme = "story_reac_yes, story_reac_belief_story", min = 2, max = 4}}},
	legend_03				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= { [1] = {theme = "story_reac_cool_info", min = 1, max = 1},
								[2] = {theme = "story_reac_yes, story_reac_doubt", min = 2, max = 4}}},
	legend_04				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= { [1] = {theme = "story_reac_fear", min = 1, max = 1},
								[2] = {theme = "story_reac_yes, story_reac_belief_story", min = 2, max = 4}}},

	legend_05				= {rmk_type = rmk_once, into_id = id(), max_ids = {},
					depence	= { [1] = {theme = "story_reac_yes", min = 2, max = 3},
								[2] = {theme = "story_reac_doubt", min = 1, max = 1},
								[3] = {theme = "story_reac_disbelief_story, story_reac_belief_story", min = 2, max = 4}}},

	story_reac_action_right		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_action_wrong		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_advice_sceptic	= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_advice_support	= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_belief_story		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_continue			= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_cool_info		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_cool_teller		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_disbelief		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_disbelief_story	= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_disbelief_teller	= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_doubt			= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_fear				= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_final_happy		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_final_tragic		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_laughter			= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_old_story		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_uncertain		= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_wonder			= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
	story_reac_yes				= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},

	-- ���������� ����
	-- Escape
	esc_tolik_help				= {rmk_type = rmk_sporadic, min_snd = 7, max_snd = 10, rnd_id = id(), max_ids = {}},
	-- esc_guard_camp				= {rmk_type = rmk_sporadic, min_snd = 7, max_snd = 10, rnd_id = id(), max_ids = {}},
	esc_factory_raid			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_factory_attack			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_factory_victory			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_factory_go				= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	-- esc_fox_alert				= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_tolik_to_wolf			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_tolik_to_lager			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_tolik_thanks			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	-- esc_wolf_thanks				= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_wolf_say_thanks			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_lager_killer			= {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
	esc_fanat_dialog			= {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
	esc_fanat_ready				= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	-- esc_direction_fire			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_bridge_soldiers			= {rmk_type = rmk_sporadic, min_snd = 15, max_snd = 30, rnd_id = id(), max_ids = {}},
	esc_bandit_shustryi			= {rmk_type = rmk_sporadic, min_snd = 25, max_snd = 45, rnd_id = id(), max_ids = {}},
	esc_shustryi_help			= {rmk_type = rmk_sporadic, min_snd = 20, max_snd = 35, rnd_id = id(), max_ids = {}},
	esc_wolf_radio				= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	-- directly played
	-- esc_wolf_radio_1			= {rmk_type = rmk_once, rnd_id = id(), into_id = id(), max_ids = {}},
	esc_petruha_raport			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_petruha_raport_radio	= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_petruha_call			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_fox_thanks				= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	esc_shustryi_thanks			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},

	-- Garbage DramMoment
	gar_dm_bandit_backoff1		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	gar_dm_bandit_backoff2		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	gar_dm_bandit_demand		= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},
	gar_dm_newbie_no_money		= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	gar_dm_newbie_help_me		= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},
	gar_dm_newbie_thank_you		= {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},

	gar_hellcar_alarm			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	gar_hellcar_ambush			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	gar_bandits_seryi			= {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
	-- gar_grey_grey				= {rmk_type = rmk_once, rnd_id = id(), into_id = id(), max_ids = {}},
	gar_seryi_see_actor			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	gar_dolg_blokpost			= {rmk_type = rmk_greet, min_snd = 10, max_snd = 25, into_id = id(), max_ids = {}},
	gar_direction_fire			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	gar_hellcar_to_battle		= {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	-- see xr_effects.script, etc.
	-- gar_hellcar_victory			= {rmk_type = rmk_once, into_id = id(), max_ids = {}},

	-- DarkValley
	val_prisoner_captive_help_me    = {rmk_type = rmk_sporadic, min_snd = 6, max_snd = 20, rnd_id = id(), max_ids = {}},
	val_prisoner_captive_come_here  = {rmk_type = rmk_sporadic, min_snd = 15, max_snd = 30, rnd_id = id(), max_ids = {}},
	val_prisoner_captive_open       = {rmk_type = rmk_priority, min_snd = 10, max_snd = 20, rnd_id = id(), max_ids = {}},
	val_prisoner_captive_thanx      = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_rob_leader_call             = {rmk_type = rmk_greet, min_snd = 10, max_snd = 20, into_id = id(), max_ids = {}},
	val_rob_leader_jeer             = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_rob_guard_jeer              = {rmk_type = rmk_greet, min_snd = 6, max_snd = 10, rnd_id = id(), max_ids = {}},
	--val_gate_soldiers               = {min_snd = 3, max_snd = 5, rnd_id = id(), into_id = id(), max_ids = {}},
	--val_chase_soldiers              = {min_snd = 3, max_snd = 5, rnd_id = id(), into_id = id(), max_ids = {}},
	--val_opendoor_soldier            = {min_snd = 3, max_snd = 5, rnd_id = id(), into_id = id(), max_ids = {}},
	-- escort Russian is probably not spoken
	val_escort_guards               = {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
	val_escort_captive_phrase1      = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_captive_phrase2      = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_captive_phrase3      = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_phrase1         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_phrase2         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_phrase3         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_phrase4         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_phrase5         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_phrase6         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_phrase7         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_dead                 = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_nap1_go_home         = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	val_escort_phrase_invite        = {rmk_type = rmk_once, into_id = id(), max_ids = {}},

	-- Pripyat
	pri_followers_leader_phrase1_1  = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	pri_followers_leader_phrase1_2  = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	pri_followers_leader_phrase1_3  = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	pri_followers_final_phrase1     = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	pri_followers_final_phrase2     = {rmk_type = rmk_greet, min_snd = 6, max_snd = 15, rnd_id = id(), max_ids = {}},

	-- DeadCity
	-- nv 100808 - these are not used in vanilla
	-- cit_doctor_start_dlg            = {min_snd = 3, max_snd = 5, into_id = id(), max_ids = {}},
	-- cit_doctor_end_dlg              = {min_snd = 3, max_snd = 5, into_id = id(), max_ids = {}},
	-- cit_jail_guard_sneer            = {min_snd = 3, max_snd = 5, rnd_id = id(), max_ids = {}},
	-- cit_base_guard                  = {min_snd = 3, max_snd = 5, into_id = id(), max_ids = {}},
	-- cit_base_guard_talk_to_actor2   = {min_snd = 3, max_snd = 5, into_id = id(), max_ids = {}},
	-- cit_jail_guard_sleep            = {min_snd = 3, max_snd = 5, into_id = id(), max_ids = {}},

	-- Agroprom
	-- probably not used
	agr_factory_soldiers		= {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
	-- desertir
	agr_dont_shoot			= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 20, rnd_id = id(), max_ids = {}},
	agr_desertir_spam		= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 20, rnd_id = id(), max_ids = {}},
	agr_stalker_help_1		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	agr_stalker_help_2		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	agr_stalker_help_3		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    agr_stalker_help_4		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    agr_krot_thanks_2		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	agr_krot_fear			= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	agr_doctor_1			= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
-- Radar

	-- Bar Rostok Duty Guards
	-- unused Russian speech
	-- bar_dolg_base_guard_backoff		= {rmk_type = rmk_greet, min_snd = 3, max_snd = 5, rnd_id = id(), max_ids = {}},
	-- bar_dolg_base_guard_no_talk		= {rmk_type = rmk_greet, min_snd = 3, max_snd = 5, rnd_id = id(), max_ids = {}},
	bar_bar_osvedomitel_hello		= {rmk_type = rmk_sporadic, min_snd = 30, max_snd = 150, rnd_id = id(), max_ids = {}, rnd = 50},
	bar_bar_barmen_hello			= {rmk_type = rmk_greet, min_snd = 2, max_snd = 15, rnd_id = id(), max_ids = {}},
	-- bar_bar_barmen_hello_room		= {rmk_type = rmk_greet, min_snd = 10, max_snd = 15, rnd_id = id(), max_ids = {}},
	bar_dolg_leader_hello			= {rmk_type = rmk_greet, min_snd = 100, max_snd = 150, rnd_id = id(), max_ids = {}, rnd = 50},

	-- Bar dolg guard
	bar_dolg_guard_stop				= {rmk_type = rmk_greet, min_snd = 15, max_snd = 20, rnd_id = id(), max_ids = {}},
	bar_guard_prohodi				= {rmk_type = rmk_greet, min_snd = 70, max_snd = 200, into_id = id(), max_ids = {}},
	bar_dolg_guard_busy				= {rmk_type = rmk_greet, min_snd = 7, max_snd = 20, rnd_id = id(), max_ids = {}},

	-- Bar dolg hangar bridge
	bar_dolg_hangar_bridge_hello	= {rmk_type = rmk_greet, min_snd = 160, max_snd = 250, rnd_id = id(), max_ids = {}},

	bar_guard_enter					= {rmk_type = rmk_greet, min_snd = 6, max_snd = 10, into_id = id(), max_ids = {}},
	bar_guard_stop					= {rmk_type = rmk_greet, min_snd = 6, max_snd = 15, rnd_id = id(), max_ids = {}},

	-- Bar dolg Petrenko
	bar_dolg_petrenko_hello			= {rmk_type = rmk_sporadic, min_snd = 30, max_snd = 150, rnd_id = id(), max_ids = {}, rnd = 50},

	-- Bar psyh
	-- bar_psycho uses Russian speech, bar_barman_psycho audio not found
	-- bar_psycho_pain					= {rmk_type = rmk_sporadic, min_snd = 30, max_snd = 50, rnd_id = id(), into_id = id(), max_ids = {}},
	-- bar_psycho_goodluck				= {rmk_type = rmk_sporadic, min_snd = 30, max_snd = 50, rnd_id = id(), into_id = id(), max_ids = {}},
	-- bar_barman_psycho				= {min_snd = 30, max_snd = 50, rnd_id = id(), into_id = id(), max_ids = {}},
	bar_arena_public				= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 10, rnd_id = id(), max_ids = {}, rnd = 80},

	-- Rostok volkodav
	rostok_volkodav_talk_1				= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_volkodav_talk_2				= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_volkodav_assistant_talk_1	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_volkodav_assistant_talk_2	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_volkodav_assistant_talk_3	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},

	-- Rostok kruglov
	rostok_kruglov_help_1               = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_kruglov_help_2               = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_kruglov_help_3               = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_kruglov_help_4               = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_kruglov_help_5               = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	rostok_kruglov_help_6               = {rmk_type = rmk_once, rnd_id = id(), max_ids = {}},
    rostok_kruglov_torrid               = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	kruglov_stop_enemy_1                = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	kruglov_stop_enemy_2                = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},

	--yantar sounds
	yantar_professor_idle				= {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 20, rnd_id = id(), max_ids = {}},
	yantar_professor_to_kruglov_1		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_professor_to_kruglov_2		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_kruglov_to_professor_1		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_kruglov_to_professor_2		= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_kruglov_to_actor				= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	-- nv 10808 - referenced in yan_klyk.ltx and yan_ghost.ltx but not used; see xr_effects.yan_dream_voices()
	-- yantar_dream_talk_1					= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	-- yantar_dream_talk_2					= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	-- yantar_dream_talk_3					= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_professor_talk_1				= {rmk_type = rmk_greet, min_snd = 10, max_snd = 100, rnd_id = id(), max_ids = {}},
	-- yantar_professor_radiation_quest_1	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_professor_radiation_quest_2	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_1	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_2	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_3	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_4	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_5	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_6	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_7	= {rmk_type = rmk_chatter, rnd_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_8	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_9	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    yantar_kruglov_radiation_quest_10	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- yantar_professor_brain_quest_bad_1	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- yantar_professor_brain_quest_bad_2	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- yantar_professor_brain_quest_good_1	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- yantar_professor_brain_quest_good_2	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- yantar_professor_brain_quest_good_3	= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_probe_1						= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_probe_2						= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
	yantar_probe_3						= {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},

	-- test_mega_remark					= {rmk_type = rmk_chatter, rnd_id = id(), into_id = id(), max_ids = {}},


    -- Brainlab sounds -- not used; ph_sound used instead

    -- brainlab_system_message_1           = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- brainlab_system_message_2           = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- brainlab_system_message_3           = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- brainlab_system_message_4           = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},
    -- brainlab_system_message_5           = {rmk_type = rmk_chatter, into_id = id(), max_ids = {}},

    -- Military sounds
    mil_max_thanx                  = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_max_before_collect         = {rmk_type = rmk_greet, min_snd = 30, max_snd = 50, into_id = id(), max_ids = {}},
    mil_kolyan                     = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_max_to_kolyan              = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_max_to_tolyan              = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_laugh1             = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_laugh2             = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_laugh3             = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_laugh4             = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_laugh5             = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_phrase1            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_phrase2            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_phrase3            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_phrase4            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_phrase5            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_phrase6            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_collect_phrase7            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_crazy                      = {rmk_type = rmk_sporadic, min_snd = 5, max_snd = 20, rnd_id = id(), max_ids = {}},
    mil_dolg_about_sniper          = {rmk_type = rmk_sporadic, min_snd = 30, max_snd = 50, rnd_id = id(), max_ids = {}},
    mil_dolg_go_attack             = {rmk_type = rmk_sporadic, min_snd = 30, max_snd = 50, into_id = id(), max_ids = {}},
    mil_freedom_patrol             = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_dolg_after_kill1           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_dolg_after_kill2           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_dolg_after_kill3           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
	-- these are not currently used - if enabled, see corresponding script_sound.ltx entries
    -- mil_freedom_zoneguard          = {rmk_type = rmk_greet, min_snd = 30, max_snd = 50, into_id = id(), max_ids = {}},
    -- mil_freedom_patrol_base        = {rmk_type = rmk_greet, min_snd = 3, max_snd = 5, into_id = id(), max_ids = {}},
    -- mil_max_khutor_attack          = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_guard_to_max               = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    -- mil_lukash_to_guard            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_lukash_to_actor            = {rmk_type = rmk_greet, min_snd = 30, max_snd = 50, into_id = id(), max_ids = {}},
    -- mil_paul_frost                 = {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
    -- mil_dolg_killer                = {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
    mil_dolg_scull                 = {rmk_type = rmk_greet, min_snd = 30, max_snd = 50, into_id = id(), max_ids = {}},
    mil_max_to_actor               = {rmk_type = rmk_greet, min_snd = 30, max_snd = 50, into_id = id(), max_ids = {}},
    -- game uses numbered versions of mil_collect_phrase above
	-- mil_collect_phrases            = {min_snd = 3, max_snd = 5, into_id = id(), max_ids = {}},
    mil_pavlik_to_ara              = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_ara_to_pavlik              = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_ara_ambush                 = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_hunter1                    = {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
    mil_hunter2                    = {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
    mil_hunter3                    = {rmk_type = rmk_muse, into_id = id(), max_ids = {}},
    mil_dolg_getready              = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_dolg_lukash_done           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_ambush1            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_ambush2            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_ambush3            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_ambush4            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_ambush5            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_ambush6            = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_victory1           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_victory2           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_victory3           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_victory4           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_freedom_victory5           = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_dolg_before_attack1        = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_dolg_before_attack2        = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_dolg_fight                 = {rmk_type = rmk_muse, rnd_id = id(), max_ids = {}},
    mil_dolg_silent                = {rmk_type = rmk_once, into_id = id(), max_ids = {}},
    mil_cherep_hi                  = {rmk_type = rmk_greet, min_snd = 15, max_snd = 30, into_id = id(), max_ids = {}}
}

--' � ����� ��� ������ �������� �������� � �������������!!!
actor_theme = {
	level_border_detector = {min_snd = 10, max_snd = 100,
							 sounds = {xr_sound.get_safe_sound_object([[detectors\geiger_1]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_1]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_1]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_1]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_2]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_2]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_4]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_5]]),
									   xr_sound.get_safe_sound_object([[detectors\geiger_6]]) }}
}

function select_sound_from_ltx(obj, section, ltx)
--	1. �������� �� story_id
	local c = obj:story_id()
	if ltx:line_exist(section, utils.to_str(c)) then
		return ltx:r_string(section, utils.to_str(c))
	end

--	2. �������� �� npc_profile
	c = obj:profile_name()
	if ltx:line_exist(section, c) then
		return ltx:r_string(section, c)
	end

--	3. �������� �� character_community
	c = obj:character_community()
	if ltx:line_exist(section, c) then
		return ltx:r_string(section, c)
	end

--	4. �������� ������� --match "stalker" even if not char_community
	if ltx:line_exist(section, "stalker") then
		return ltx:r_string(section, "stalker")
	else
		return nil
	end
end

-----------------------------------------------------------------------------------------------------------------------------------
local character_prefix = ""
local default_prefix = "characters_voice\\"
function check_prefix(s)
	local flag = string.sub(s, 1, 1)
	return flag, string.sub(s, 3)
end

function load_sound(obj)
	-- local k,v = 0,0

	-- �������� ������ �� ������ ������ ltx
	function load_sound_from_ltx(obj, name, tbl)
		tbl.max_ids[obj:id()] = {}
		if tbl.rnd_id and snd_ini:section_exist(name.."_rnd") then
			local s = select_sound_from_ltx(obj, name.."_rnd", snd_ini)
			if s then
				local flag, path = check_prefix(s)
				if flag == "0" then
					character_prefix = obj:sound_prefix()
					obj:sound_prefix(default_prefix)
				end

				--printf("NPC[%s] flag[%s] prefix[%s] path[%s]", obj:name(), flag, obj:sound_prefix(), path)
				tbl.max_ids[obj:id()].rnd_max = obj:add_sound(path, nstl, snd_type.talk, 2, 1, tbl.rnd_id)

				if flag == "0" then
					obj:sound_prefix(character_prefix)
				end
			end
		end
		if tbl.into_id then
			if snd_ini:section_exist(name.."_seq") then
				local s = select_sound_from_ltx(obj, name.."_seq", snd_ini)
				if s then
					local flag, path = check_prefix(s)
					if flag == "0" then
						character_prefix = obj:sound_prefix()
						obj:sound_prefix(default_prefix)
					end

					--printf("NPC[%s] flag[%s] prefix[%s] path[%s]", obj:name(), flag, obj:sound_prefix(), path)
					local max_count = obj:add_sound(path, nstl, snd_type.talk, 2, 1, tbl.into_id)
					tbl.max_ids[obj:id()].into_max = max_count
					-- dbglog("name=%s, path=%s, max_count=%s",name,path,tostring(max_count))
					if max_count > 1 then tbl.max_ids[obj:id()].into_cycled = true end

					if flag == "0" then
						obj:sound_prefix(character_prefix)
					end
				end
			end
			if snd_ini:section_exist(name.."_single") then
				local s = select_sound_from_ltx(obj, name.."_single", snd_ini)
				if s then
					local flag, path = check_prefix(s)
					if flag == "0" then
						character_prefix = obj:sound_prefix()
						obj:sound_prefix(default_prefix)
					end

					--printf("NPC[%s] flag[%s] prefix[%s] path[%s]", obj:name(), flag, obj:sound_prefix(), path)
					tbl.max_ids[obj:id()].into_max = obj:add_sound(path, nstl, snd_type.talk, 2, 1, tbl.into_id)
					tbl.max_ids[obj:id()].into_cycled = false

					if flag == "0" then
						obj:sound_prefix(character_prefix)
					end
				end
			end
		end
	end

	function load_theme_sound(npc, tbl)
		for k,v in pairs(tbl) do
			if v.types == nil then
				load_sound_from_ltx(npc, k, v)
			else
				load_theme_sound(npc, v.types)
			end
		end
	end

	load_theme_sound(obj, theme)

	-- ������ ��������� � db.sound
	db.sound[obj:id()] = {}

----	printf("All sounds loaded for %s, section %s", obj:name(), obj:section())
---	print_table(theme)
end
-- dbglog("sound_theme.script is valid")