player RemoveAction Haloj;

private ["_vmenu", "_unit", "_upos"];

_vmenu = _this select 0;
_unit = _this Select 1;
_upos = getPos _unit;

uav = _Unit addAction [("<t color='#ff0000'>" + "Armed UAV" + "</t>"),"smenu\auav.sqs",[],0,false,false,"","player ==_target"];
static = _Unit addAction [("<t color='#ff0000'>" + "Static Weapon" + "</t>"),"smenu\mortar.sqs",[],0,false,false,"","player ==_target"];
virtual = _Unit addAction["<t color='#ff0000'>Virtual Ammobox</t>", "ATLAS\VAS\open.sqf",[],0,false,false,"","player ==_target"];
arsenal = _Unit addAction["<t color='#ff0000'>Virtual Arsenal</t>", "LT\acti.sqf",[],0,false,false,"","player ==_target"];

//arsenal = _Unit addAction ["<t color='#9B00C1'>Virtual Arsenal</t>", { [] spawn LT_fnc_LTmenu;}, [], 0, false]; 
(_this select 0) removeAction (_this select 2);