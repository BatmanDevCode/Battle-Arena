


//________________  Author : [GR]GEORGE F ___________ 10.06.18 _____________

/*
________________ GF Status Bar Script ________________ 
________________ Originally created for Ravage ________________

https://forums.bohemia.net/forums/topic/217240-gf-status-bar-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

include this in your init_unitLocal :

[] execVM "GF_Status_Bar\GF_Status_Bar.sqf";
*/


waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

[] spawn
{
	_uid = getPlayerUID player;

	while {true} do
	{
	
	sleep 0.01;
	
	_rscLayer = "RscStatusBar_Vanilla" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["RscStatusBar_Vanilla","PLAIN",1,false];
	

	if(isNull ((uiNamespace getVariable "RscStatusBar_Vanilla")displayCtrl 55554)) then
	{
	diag_log "statusbar is null create";
	disableSerialization;
	_rscLayer = "RscStatusBar_Vanilla" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["RscStatusBar_Vanilla","PLAIN",1,false];

	};
			
			
_unit = _this select 0;

//________________ IMPORTANT ! edit your selection for MP or SP score ________________
_Kills = score player; //Returns the person's score in MP. 
//_count_dead = format ["%1 ",count allDeadMen];//Returns the person's score in SP. 

_health = round ((1 - (damage player)) * 100);

_FirstAidKit = {"FirstAidKit" == _x} count (items player);
_Mags = {_x in getArray (configFile >> "CFGWeapons" >> (currentWeapon player) >> "magazines")}count (magazines player);
//Match current mag
{_x == currentMagazine player}count (magazines player);

_serverFPS = round diag_fps;

_Altidude = round((getPosASL player) select 2);
_dir = round (getDir (vehicle player));
_Bearing = _dir;
_grid = mapGridPosition player; _xx = (format[_grid]) select  [0,3];
_Time= format ["%1", ([dayTime, "HH:MM:SS"] call BIS_fnc_timeToString)];


switch true do {
case(((_dir >= 355) && (_dir <=359)) || ((_dir >= 0) && (_dir <= 5))) : {_Bearing = "N";}; //Bearing North
case((_dir > 5) && (_dir < 85)) : {_Bearing = "NE";}; 		//Bearing North-East
case((_dir >= 85) && (_dir <= 95)) : {_Bearing = "E";}; 	//Bearing East
case((_dir > 95) && (_dir < 175)) : {_Bearing = "SE";}; 	//Bearing South-East
case((_dir >= 175) && (_dir <= 185)) : {_Bearing = "S";}; 	//Bearing South
case((_dir > 185) && (_dir < 265)) : {_Bearing = "SW";};	//Bearing South-West
case((_dir >= 265) && (_dir <= 275)) : {_Bearing = "W";}; 	//Bearing West
case((_dir > 275) && (_dir < 355)) : {_Bearing = "NW";};	//Bearing North-West
};	
	
//________________ Color Gradient ________________
//Additional color codes can be found here:  http://html-color-codes.com/
_colour_Default 	= parseText "#FBFCFE"; 
_colour90 			= parseText "#F5E6EC"; 
_colour80 			= parseText "#F0D1DB"; 
_colour70 			= parseText "#EBBBC9"; 
_colour60 			= parseText "#E6A6B8"; 
_colour50 			= parseText "#E191A7"; 
_colour40 			= parseText "#DB7B95"; 
_colour30 			= parseText "#D66684"; 
_colour20 			= parseText "#D15072"; 
_colour10 			= parseText "#CC3B61"; 
_colour0 			= parseText "#C72650"; 
_colourDead 		= parseText "#000000";


//________________ Changing Colour based on health  ________________
_colour_Health = _colour_Default;
if(_health >= 100) then{_colour_Health = _colour_Default;};
if((_health >= 90) && (_health < 100)) then {_colour_Health =  _colour90;};
if((_health >= 80) && (_health < 90)) then {_colour_Health =  _colour80;};
if((_health >= 70) && (_health < 80)) then {_colour_Health =  _colour70;};
if((_health >= 60) && (_health < 70)) then {_colour_Health =  _colour60;};
if((_health >= 50) && (_health < 60)) then {_colour_Health =  _colour50;};
if((_health >= 40) && (_health < 50)) then {_colour_Health =  _colour40;};
if((_health >= 30) && (_health < 40)) then {_colour_Health =  _colour30;};
if((_health >= 20) && (_health < 30)) then {_colour_Health =  _colour20;};
if((_health >= 10) && (_health < 20)) then {_colour_Health =  _colour10;};
if((_health >= 1) && (_health < 10)) then {_colour_Health =  _colour0;};
if(_health < 1) then{_colour_Health =  _colourDead;};


//________________ FPS Colour ________________
_colour_Blue		= parseText "#0033FF";
_colour_Blue_light	= parseText "#3399FF";
_colour_Green		= parseText "#339933";
_colour_Yellow		= parseText "#FFFF33";
_colour_Red			= parseText "#FF3333";


//________________ Changing Colour based on FPS ________________
_colour_Fps = _colour_Default;
switch true do {
case(_serverFPS >= 60) : {_colour_Fps = _colour_Blue;};
case((_serverFPS >= 45) && (_serverFPS < 60)) : {_colour_Fps = _colour_Blue_light;};
case((_serverFPS >= 30) && (_serverFPS < 45)) : {_colour_Fps = _colour_Green;};
case((_serverFPS >= 15) && (_serverFPS < 30)) : {_colour_Fps = _colour_Yellow;};
case((_serverFPS >= 1) && (_serverFPS < 15)) : {_colour_Fps = _colour_Red;};
case(_serverFPS < 1) : {_colour_Fps = _colourDead;};
};			
	
						
//________________ display information ________________
/*
You can delete the Line that you dont want. The numbers at the end of the lines , are defined  below
At the end of the lines , are the spaces between the next number and logo

IMPORTANT ! as mentioned above , edit your selection for MP or SP score
________________ Switch your Selection below ________________
_Kills = score player; //Returns the person's score in MP. 
_count_dead = format ["%1 ",count allDeadMen];//Returns the person's score in SP. 
*/


((uiNamespace getVariable "RscStatusBar_Vanilla")displayCtrl 55554) ctrlSetStructuredText
parseText format
	["
<t shadow='1' shadowColor='#000000' color='%2'>%5<img size='1.5' 	image='GF_Status_Bar\images\Players.paa' />		  </t>	
<t shadow='1' shadowColor='#000000' color='%3'>%6%1<img size='1.5' 	image='GF_Status_Bar\images\Health.paa' />		</t>
<t shadow='1' shadowColor='#000000'	color='%2'>%7%8<img size='1.5' 	image='GF_Status_Bar\images\Compass.paa' />		</t>
<t shadow='1' shadowColor='#000000' color='%2'>%9<img size='1.5' 	image='GF_Status_Bar\images\Kills.paa' />		</t>
<t shadow='1' shadowColor='#000000' color='%2'>%10<img size='1.5' 	image='GF_Status_Bar\images\FirstAidKit.paa' />		</t>
<t shadow='1' shadowColor='#000000' color='%2'>%11<img size='1.5' 	image='GF_Status_Bar\images\Mags.paa' />		</t>								
<t shadow='1' shadowColor='#000000' color='%2'>%12<t color='#FFFF33'>ALT		</t>
<t shadow='1' shadowColor='#000000' color='%2'>%13<t color='#FFFF33'>GRID		</t>
<t shadow='1' shadowColor='#000000' color='%2'>%14<t color='#FFFF33'>TIME		</t>
<t shadow='1' shadowColor='#000000' color='%4'>%15<img size='1.5' 	image='GF_Status_Bar\images\FPS.paa' />
</t>",
		"%",					//1
		_colour_Default,		//2
		_colour_Health,			//3
		_colour_Fps,	 		//4
		count playableUnits,	//5
		_health,				//6
		_Bearing,				//7
		_dir,					//8
		_Kills,					//9
		_FirstAidKit,			//10
		_Mags,					//11
		_Altidude,				//12
		_grid,					//13
		_Time,					//14
		_serverFPS				//15
		];
	};
};