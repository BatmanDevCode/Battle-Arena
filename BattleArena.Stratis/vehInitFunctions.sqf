

TAG_FNC_setVehicleName = {

	params ["_veh", "_name"];
	
		missionNamespace setVariable [_name, _veh, true];
		[_veh, _name] remoteExecCall ["setVehicleVarName", 0, _name];
	
};

TAG_FNC_handleActions = {

params ["_veh"];
_veh setVariable ["dnt_remove_me",true,false];
	_veh addEventHandler ["GetIn",{
	
		params ["_veh", "_seat", "_player"];
			
			if (_seat isEqualTo "driver") then {
				

			     
//				_veh addAction ["<t color='#f80106'>EMERGENCY EJECT</t>", {
//				
//					[] spawn {
//						
//						moveout player;
//						sleep 1;
//						player action ["openParachute"];
//					};
//				
//				},nil,6,true,true,"","(damage _target) != 0",10,false];

				nuke = _veh addaction [("<t color='#e53700'>" + "RELEASE NUKE" + "</t>"),"scripts\NukeInit.sqs"];
				
			};
	}];
};

TAG_FNC_NukebomberInit = {

	params ["_veh"];

		_veh setFuel 0.1;  
		_veh setVariable ["dnt_remove_me",true,false];
		[_veh, "nukebomber"] call  TAG_FNC_setVehicleName;
		_veh remoteExec ["TAG_FNC_handleActions", 0, _veh];
		
};

TAG_FNC_TankInit = {

// -- Example code. You can work with the vehicle anyway you like here!! -- //
_veh = _this select 0;

};

TAG_FNC_HunterInit = {

// -- Example code. You can work with the vehicle anyway you like here!! -- //
_veh = _this select 0;

_veh setFuel 0.3;
_veh setVariable ["dnt_remove_me",true,false];
_veh addweapon "HMG_127";
_veh addmagazine "500Rnd_127x99_mag_Tracer_Red";
_veh addweapon "gatling_25mm";
_veh addmagazine "300Rnd_25mm_shells";


};

TAG_FNC_HunterHMGInit = {

_veh = _this select 0;

};

TAG_FNC_HunterGMGInit = {

_veh = _this select 0;
_veh setFuel 0.3;
_veh setVariable ["dnt_remove_me",true,false];
_veh addweapon "rockets_230mm_GAT";
_veh addmagazine "12Rnd_230mm_rockets";

};

TAG_FNC_slammerInit = {

_veh = _this select 0;


};

TAG_FNC_marshallInit = {

_veh = _this select 0;

_veh setFuel 0.5;
_veh setVariable ["dnt_remove_me",true,false];
_veh addweapon "HMG_127"; 
_veh addmagazine "500Rnd_127x99_mag_Tracer_Red";
_veh addweapon "gatling_25mm"; 
_veh addmagazine "300Rnd_25mm_shells";
_veh addweapon "CMFlareLauncher"; 
_veh addmagazine "300Rnd_CMFlare_Chaff_Magazine";
_veh addweapon "missiles_ASRAAM"; 
_veh addmagazine "4Rnd_AAA_missiles";
_veh addweapon "Bomb_04_Plane_CAS_01_F"; 
_veh addmagazine "4Rnd_Bomb_04_F";

};