player RemoveAction Haloj;
hint "Press RIGHT SHIFT To Cutaway from your Parachute";

// Get the destination.
_dest = (_this select 3) select 0;

// Get a random direction
_dir = random 359;

// Move the person 15 meters away from the destination (in the direction of _dir)
player SetPos [(getMarkerPos _dest select 0)-10*sin(_dir),(getMarkerPos _dest select 1)-10*cos(_dir),+3000];

