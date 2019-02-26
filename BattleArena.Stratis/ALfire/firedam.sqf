// by ALIAS
// damage inflicted by fire
// obsolete but you can still use it if you want. Now damage is inflicted using setParticleFire

	_d = 0.25;
	
	while {fireexpunere} do {
		enableCamShake true;
		addCamShake [5, 1, 17];
		_d=_d+0.5;
		player setdammage _d;
		sleep 2.5+random 1;	
		enableCamShake false;
	};
	
