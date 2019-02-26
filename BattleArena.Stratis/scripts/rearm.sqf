private "_unit";

_unit = _this;
_unit addrating 100000;

Vmenu = _unit addAction [("<t color='#FF9900'>" + "VehicleMenu" + "</t>"), "smenu\createveh.sqf",nil,0,false,false,"","player ==_target"];
WeapM = _unit addAction [("<t color='#ff0000'>" + "WeaponsMenu" + "</t>"), "smenu\Weaponmenu.sqf",nil,0,false,false,"","player ==_target"];
Haloj = _unit addAction [("<t color='#31B404'>" + "SkyDive" + "</t>"), "teleport.sqf",["HaloJump"]];


