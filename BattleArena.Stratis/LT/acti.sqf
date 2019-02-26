_Unit=_this Select 0;

_Unit RemoveAction uav;
_Unit RemoveAction static;
_Unit RemoveAction virtual;
_Unit RemoveAction arsenal;

WeapM = _unit addAction [("<t color='#ff0000'>" + "WeaponsMenu" + "</t>"), "smenu\Weaponmenu.sqf",[],-96,false,false,"","player ==_target"];



[] spawn LT_fnc_LTmenu;