
openMap true;

mapclick = false;

onMapSingleClick "
deleteMarkerLocal 'nap_2';
_marker= createMarkerLocal ['nap_2',[0,0,0]];
_marker setMarkerColorLocal 'ColorRed';
_marker setMarkerShapeLocal 'ELLIPSE';
_marker setMarkerBrushLocal 'Solid';
_marker setMarkerSizeLocal [10, 10];
'nap_2' setMarkerPos _pos;
mapclick = true;
openMap false;
true";

sleep 2;
naptrig1 = true;
sleep 25;
deleteMarkerLocal 'nap_2';
deleteMarkerLocal 'nap_1';

