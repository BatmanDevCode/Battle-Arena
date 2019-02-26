player RemoveAction Haloj;

private ["_vmenu", "_unit", "_upos"];

_vmenu = _this select 0;
_unit = _this select 1;
_upos = getPos _unit;

choppa = _Unit addAction [("<t color='#FF9900'>" + "Air" + "</t>"),"smenu\enter.sqs",[],0,false,false,"","player ==_target"];
tank = _Unit addAction [("<t color='#FF9900'>" + "Armored Vehicle" + "</t>"),"smenu\armored.sqs",[],0,false,false,"","player ==_target"];
plane = _Unit addAction [("<t color='#FF9900'>" + "Vehicle" + "</t>"),"smenu\plane.sqs",[],0,false,false,"","player ==_target"];
boat = _unit addAction [("<t color='#FF9900'>" + "Boat" + "</t>"),"smenu\Boat.sqs",[],0,false,false,"","player ==_target"];
(_this select 0) removeAction (_this select 2);
