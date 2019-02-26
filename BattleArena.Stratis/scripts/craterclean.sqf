_list = nearestObjects [(getMarkerPos "base"), ["CraterLong"], 1000];
{deleteVehicle _x} foreach _list;