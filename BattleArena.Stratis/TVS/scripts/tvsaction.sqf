_unit = vehicle (_this select 0);
_id = _this select 2;
_arg = _this select 3;
_unit removeaction _id;
_unit setVariable ["Nux_tvs_onf",_arg];
if (_arg == 1) then {_unit addAction ["<t color='#FFBD4C'>Guided Bombs OFF</t>", "TVS\scripts\tvsaction.sqf",0,8,false,true,"","(player == gunner _target) or ((player == driver _target) and not (isPlayer gunner _target))"];};
if (_arg == 0) then {_unit addAction ["<t color='#FFBD4C'>Guided Bombs ON</t>", "TVS\scripts\tvsaction.sqf",1,8,false,true,"","(player == gunner _target) or ((player == driver _target) and not (isPlayer gunner _target))"];};


