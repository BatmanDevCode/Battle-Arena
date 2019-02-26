
[] call compile preprocessFileLineNumbers "vehInitFunctions.sqf";
enableEnvironment false;


if (isServer) then {
	
fnc_cleanup = compileFinal preprocessFileLineNumbers "scripts\cleanup.sqf";

	[] spawn {

		while {true} do {
			sleep 2100;
			skiptime -(35/60);
		      0 setovercast 1;
		      0 setrain 0;
		      0 setfog 0;
		      0 setWindForce 0;
	};

};

	[] spawn {

		while {true} do {        
		
			[] call fnc_cleanup; 

		sleep 180;
		};
		
	};
};

execVM "VehicleAugmentation.sqf";
[] execVM "GF_Holster\GF_Holster.sqf";

KAI_fnc_killedInfo = {
_victimName = name (_this select 0);
_killerName = name (_this select 1);
_weaponName = getText (configFile >> "cfgWeapons" >> currentWeapon (_this select 1) >> "displayname");
hintSilent format ["%1 was killed by %2 with a %3", _victimName, _killerName, _weaponName];
};
{
_id = _x addMPEventHandler ["MPKilled", {
_nul = _this call KAI_fnc_killedInfo;
}];
} foreach allUnits;