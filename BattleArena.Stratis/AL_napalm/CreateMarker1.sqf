
_player = _this select 0;
_id = _this select 2;

openMap true;

mapclick = false;

onMapSingleClick "
deleteMarkerLocal 'nap_1';
_marker= createMarkerLocal ['nap_1',[0,0,0]];
_marker setMarkerColorLocal 'ColorRed';
_marker setMarkerShapeLocal 'ELLIPSE';
_marker setMarkerBrushLocal 'Solid';
_marker setMarkerSizeLocal [10, 10];
'nap_1' setMarkerPos _pos;
mapclick = true;
openMap false;
true";

waitUntil{!visibleMap};



onMapSingleClick "";


execVM "AL_napalm\CreateMarker2.sqf";



