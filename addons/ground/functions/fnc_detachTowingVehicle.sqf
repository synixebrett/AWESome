#include "script_component.hpp"

private _car = _this select 0;

private _eventID = _car getVariable ["orbis_towingEvent", 0];
private _plane = _car getVariable ["orbis_towingTarget", objNull];
removeMissionEventHandler ["EachFrame", _eventID];

private _towBar = _car getVariable ["orbis_towBarObject", objNull];
_plane allowDamage true;
_car enableCollisionWith _plane;
_towBar enableCollisionWith _plane;
if !(local _plane) then {
	[_plane, true] remoteExec ["allowDamage", _plane];
	[_car, _plane] remoteExec ["enableCollisionWith", _plane];
	[_towBar, _plane] remoteExec ["enableCollisionWith", _plane];
};

_car setVariable ["orbis_towingEvent", nil];
_car setVariable ["orbis_isTowingPlane", false];
_car setVariable ["orbis_towingTarget", nil];

_car setVariable ["orbis_offsetOldArray", nil];
_car setVariable ["orbis_posBarOld", nil];
_car setVariable ["orbis_towingPosRelCar", nil];
_car setVariable ["orbis_towingPosRelPlane", nil];
_car setVariable ["orbis_towingRotateCenter", nil];
_car setVariable ["orbis_towingTimeOld", nil];
_car setVariable ["orbis_towingFrameOld", nil];

player setVariable ["orbis_towVehicle", nil];
