




"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [1];
"dynamicBlur" ppEffectCommit 1;






_Cone = "#particlesource" createVehicleLocal getpos nukestartpos;
_Cone setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 0], 0, 1.275, 1, 0, [40,80,100], [[0.25, 0.25, 0.25, 0], [0.25, 0.25, 0.25, 0.5], 
				[0.25, 0.25, 0.25, 0.5], [0.25, 0.25, 0.25, 0.05], [0.25, 0.25, 0.25, 0]], [0.25], 0.1, 1, "", "", nukestartpos];
_Cone setParticleRandom [2, [1, 1, 30], [1, 1, 30], 0, 0, [0, 0, 0, 0.1], 0, 0];
_Cone setParticleCircle [10, [-10, -10, 20]];
_Cone setDropInterval 0.005;

_top = "#particlesource" createVehicleLocal getpos nukestartpos;
_top setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16, 3, 48, 0], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 52], 0, 1.7, 1, 0, [60,80,100], [[1, 1, 1, -10],[1, 1, 1, -7],[1, 1, 1, -4],[1, 1, 1, -0.5],[1, 1, 1, 0]], [0.05], 1, 1, "", "", nukestartpos];
_top setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top setDropInterval 0.002;

_top2 = "#particlesource" createVehicleLocal getpos nukestartpos;
_top2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16, 3, 112, 0], "", "Billboard", 1, 20, [0, 0, 100],
				[0, 0, 25], 0, 1.7, 1, 0, [100,80,100], [[1, 1, 1, 0.5],[1, 1, 1, 0]], [0.07], 1, 1, "", "", nukestartpos];
_top2 setParticleRandom [0, [75, 75, 15], [17, 17, 10], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_top2 setDropInterval 0.001;

_smoke = "#particlesource" createVehicleLocal getpos nukestartpos;
_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16, 7, 48, 1], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 60], 0, 1.7, 1, 0, [40,15,100], 
				[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", nukestartpos];
_smoke setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_smoke setDropInterval 0.002;

_Wave = "#particlesource" createVehicleLocal getpos nukestartpos;
_Wave setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
				[0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1,0.5], 0.1, 1, "", "", nukestartpos];
_Wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_Wave setParticleCircle [50, [-80, -80, 2.5]];
_Wave setDropInterval 0.0002;


_light = "#lightpoint" createVehicleLocal [((getpos nukestartpos select 0)),(getpos nukestartpos select 1),((getpos nukestartpos select 2)+500)];
_light setLightAmbient[1500, 1200, 1000];
_light setLightColor[1500, 1200, 1000];
_light setLightBrightness 100000.0;




if (player distance nukestartpos < 1000) then {player say "nuke1s"};

if (player distance nukestartpos > 1000) then {player say "nuke1s"};



[] exec "snuke\damage.sqs";

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [0.8, 3.2, 0, [0.5, 0.5, 0.5, 0], [0.0, 0.0, 0.6, 2],[0.3, 0.3, 0.3, 0.1]];"colorCorrections" ppEffectCommit 0.4;
 
"dynamicBlur" ppEffectAdjust [0.5];
"dynamicBlur" ppEffectCommit 3;



0 setOvercast 0;
sleep 0.1;

_xHandle = []spawn
{
	Sleep 2;
	"colorCorrections" ppEffectAdjust [1.0, 0.5, 0, [0.5, 0.5, 0.5, 0], [1.0, 1.0, 0.8, 0.4],[0.3, 0.3, 0.3, 0.1]];
	"colorCorrections" ppEffectCommit 4;
};


"dynamicBlur" ppEffectAdjust [2];
"dynamicBlur" ppEffectCommit 1;

"dynamicBlur" ppEffectAdjust [0.5];
"dynamicBlur" ppEffectCommit 4;

_light setLightBrightness 100000.0;
sleep 0.5;

_Wave setDropInterval 0.001;
deletevehicle _top;
deletevehicle _top2;


sleep 0.5;

_i = 0;
while {_i < 100} do
{
	_light setLightBrightness 100.0 - _i;
	_i = _i + 1;
	sleep 0.1;
};
deleteVehicle _light;

"colorCorrections" ppEffectAdjust[1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]]; "colorCorrections"ppEffectCommit 11; "colorCorrections" ppEffectEnable TRUE;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 1;


sleep 2;

_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 45], 0, 1.7, 1, 0, [40,25,80], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", nukestartpos];

_Cone setDropInterval 0.01;
_smoke setDropInterval 0.006;
_Wave setDropInterval 0.001;

sleep 2;

_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 30], 0, 1.7, 1, 0, [40,25,80], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", nukestartpos];
_smoke setDropInterval 0.012;
_Cone setDropInterval 0.02;
_Wave setDropInterval 0.01;

sleep 15;

"colorCorrections" ppEffectAdjust[ 1, 1, 0, [0, 0, 0, 0.5],[1.2, 0.05, -0.12, 0.5],[0.2, 0.59, 0.11, 0]]; "colorCorrections"ppEffectCommit 10; "colorCorrections" ppEffectEnable TRUE;

sleep 10;
deleteVehicle _Wave;
deleteVehicle _cone;
deleteVehicle _smoke;



