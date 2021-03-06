#include "script_component.hpp"

private _car = _this select 0;

if !(_car getVariable ["orbis_hasTowBarDeployed", false]) exitWith {};

private _towArray = [_car] call FUNC(getTowTarget);
private _plane = _towArray select 0;
private _towBarCenterPos = _towArray select 1;
private _attachPos = _towArray select 2;
private _rotateCenter = _towArray select 3;

if (isNull _plane) exitWith {};

private _towBar = _car getVariable ["orbis_towBarObject", objNull];

player setVariable ["orbis_towVehicle", _car];
_car setVariable ["orbis_isTowingPlane", true];
_car setVariable ["orbis_towingTarget", _plane];
_car setVariable ["orbis_towingOwner", owner _plane];

_car setVariable ["orbis_offsetOldArray", []];
_car setVariable ["orbis_posBarOld", AGLtoASL (_car modelToWorld _towBarCenterPos)];
_car setVariable ["orbis_towingPosRelCar", _towBarCenterPos];
_car setVariable ["orbis_towingPosRelPlane", _attachPos];
_car setVariable ["orbis_towingRotateCenter", _rotateCenter];
_car setVariable ["orbis_towingTimeOld", time];
_car setVariable ["orbis_towingFrameOld", diag_frameNo];

_plane allowDamage false;
_car disableCollisionWith _plane;
_towBar disableCollisionWith _plane;
if !(local _plane) then {
	[_plane, false] remoteExec ["allowDamage", _plane];
	[_car, _plane] remoteExec ["disableCollisionWith", _plane];
	[_towBar, _plane] remoteExec ["disableCollisionWith", _plane];
};

private _eventID = addMissionEventHandler ["EachFrame", {[] call FUNC(eachFrameHandlerTow)}];
_car setVariable ["orbis_towingEvent", _eventID];
