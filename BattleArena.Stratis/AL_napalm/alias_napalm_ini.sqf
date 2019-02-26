// by ALIAS
// null = [] execVM "AL_napalm\alias_napalm_ini.sqf";
//[[[this],"AL_napalm\alias_napalm_ini.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
// [[[],"AL_napalm\bomber_nap.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;

if (!isServer) exitWith {};

_bombardier_x	= _this select 0;
_dire_x			= direction _bombardier_x;

//blows_a = [];publicVariable "blows_a";
ib = 0;
publicVariable "ib";

while {ib < number_of_bombs} do {
	private ["_nap_obj_princ"];
	
	// creaza obiect principale
	_nap_obj_princ = "Bomb_03_F" createvehicle ([getPosATL _bombardier_x select 0,getPosATL _bombardier_x select 1,(getPosATL _bombardier_x select 2)-5]);
	waituntil {!isnull _nap_obj_princ};
	
	[_nap_obj_princ,_bombardier_x,_dire_x] spawn {
	ib = ib+1; 	publicVariable "ib";
	//[str ib,"hint", true,true] call BIS_fnc_MP;

	_nap_obj	= _this select 0;
	_bombardier = _this select 1;
	_dire		= _this select 2;
	
	_dir_x = sin _dire;	
	_dir_y = cos _dire;	
	
//	_vel_b = velocity _bombardier;	_nap_obj setVelocity [(_vel_b select 0) + (sin _dire * 10), (_vel_b select 1) + (cos _dire * 10), -10];

	_alt_b = getposATL _nap_obj select 2;
//	_dir1 = -45;	_dir2 = 90;
	[_nap_obj, -125, 0] call BIS_fnc_setPitchBank;
	
	while {_alt_b>15} do {
			_alt_b = getposATL _nap_obj select 2;
			sleep 0.1;
	};
	
	_poz_blow = [getPos _nap_obj select 0, getPos _nap_obj select 1];
	deletevehicle _nap_obj;
	_nap_obj_b = "Land_HelipadEmpty_F" createVehicle [_poz_blow select 0,_poz_blow select 1,0];
	//blows_a pushBack getpos _nap_obj_b;	publicVariable "blows_a";
	
	[_poz_blow] spawn {
		_poz_destr = _this select 0;
		sleep 10;
		_nearobj = nearestObjects [_poz_destr, [], 50];
		{if !(_x isKindOf "Land_HelipadEmpty_F") then {_x setdamage 0};} foreach _nearobj;	
	};
	
	[[[_nap_obj_b,_dir_x,_dir_y],"AL_napalm\alias_napalm_effect.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
	

	[_nap_obj_b] spawn {
		_loc_bomb = _this select 0;
		_nr_bat = floor (6+random 20);
		
		while {_nr_bat>0} do {
			private ["_vit_z","_vit_x","_vit_y","_buc_nap","_li_exp"];
				
			_vit_z = 10+random 50;
			_vit_x = ([1,-1] call BIS_fnc_selectRandom)* floor (10+random 30);
			_vit_y = ([1,-1] call BIS_fnc_selectRandom)* floor (10+random 30);

			_buc_nap = createVehicle ["Land_Battery_F", getPosATL _loc_bomb, [], 20, "CAN_COLLIDE"];
			//ataseaza smoke la baterii
			[[[_buc_nap],"AL_napalm\alias_buc_nap.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
			_buc_nap setVelocity [_vit_x,_vit_y,_vit_z];
			[_buc_nap] spawn {_de_delete = _this select 0; sleep 6;	deleteVehicle _de_delete;};
			_nr_bat = _nr_bat-1;
		};
	};

	_nap_sec = "Land_HelipadEmpty_F" createVehicle [getPosATL _nap_obj_b select 0,(getPosATL _nap_obj_b select 1) + _dir_y*1.5,0];
	[[[_nap_sec,_dir_x,_dir_y],"AL_napalm\alias_napalm_effect_sec.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;

	// foc post nap
	//null = [_nap_sec,false,300,50,0.01,true,false] spawn compile preprocessFile "ALfire\fire.sqf";
	[[[_nap_sec,true,45,40,1,false,false],"ALfire\fire.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
	
	
	
	[_nap_obj_b] spawn { 
		_de_sters = _this select 0;
		sleep 30;
		deletevehicle _de_sters;
	};

};
	sleep bomb_drop_interval;
};