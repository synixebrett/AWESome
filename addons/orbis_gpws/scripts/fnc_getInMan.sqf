#include "header_macros.hpp"

params ["_unit", "_position", "_vehicle", "_turret"];

DEV_CHAT("orbis_gpws: getInMan run");

// check if has GPWS enabled
private _GPWSenabled = _vehicle getVariable ["orbisGPWSenabled", 0];
if (_GPWSenabled isEqualType true) then {
	if !(_GPWSenabled) exitWith {};
} else {
	if !(getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "orbisGPWS_enabled") > 0) exitWith {
		_vehicle setVariable ["orbisGPWSenabled", false, true];
	};
};
_vehicle setVariable ["orbisGPWSenabled", true, true];

// GPWS initialization
private _modeCurrent = _vehicle getVariable ["orbisGPWSmode", ""];
if !(_modeCurrent in ["f16", "b747", "rita"]) then {
	private _defaultMode = missionNamespace getVariable ["orbis_gpws_personallDefault", ""];
	if !(_defaultMode isEqualTo "") exitWith {
		_vehicle setVariable ["orbisGPWSmode", _defaultMode, true];
	};

	if (getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "orbisGPWS_default") isEqualTo "f16") exitWith {
		_vehicle setVariable ["orbisGPWSmode", "f16", true];
	};

	_vehicle setVariable ["orbisGPWSmode", "off", true];
};
