player setCustomAimCoef 0.34;
player setUnitRecoilCoefficient 0.50;
player enablestamina false;
_loadout = missionNamespace getVariable "last_loadout"; if (!isNil "_loadout") then {(_this select 0) setUnitLoadout _loadout;};