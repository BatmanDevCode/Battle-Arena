	
	waitUntil {!isnull player && alive player};


    player enableStamina false;
    player addEventHandler ["Respawn",{
	
		params ["_player"];
	
			_player setCustomAimCoef 0.34;
			_player setUnitRecoilCoefficient 0.50;
			_player enablestamina false;
			_player execVM "scripts\rearm.sqf";
			
			[_courpse] spawn {
			
				params ["_deadbody", "_droppedGear"];
				_droppedGear = nearestObjects [_deadbody, ["WeaponHolder", "WeaponHolderSimulated", "GroundWeaponHolder"], 10];
				sleep 10;
				{deleteVehicle _x} forEach _droppedGear + _deadbody;
			
			
			};
	}];
	
	player exec "scripts\rearm.sqf";
	[] execVM "scripts\briefing.sqf";
	[] execVM "GF_Earplugs\GF_Earplugs.sqf";
	[] execVM "GF_Status_Bar\GF_Status_Bar.sqf";
	
	tawvd_maxRange = 5000;
	LT_distance = -5;
	sleep 3;
moduleName_keyDownEHId = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 54) then {_nul = [] execVM 'Para\reserve.sqf'};"] 