#include "..\script_component.hpp"
/*
 * Author: Root
 * Tracks explicit Zeus stance changes sent through ZEN.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance mode <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_mode", "AUTO", [""]]];

if (isNull _unit || {!local _unit} || {isPlayer _unit}) exitWith {};

if (toUpperANSI _mode == "DOWN") exitWith {
    _unit setVariable [QGVAR(allowProne), true, false];
};

_unit setVariable [QGVAR(allowProne), nil, false];

[
    {
        params ["_unit"];
        [_unit, false] call FUNC(correctUnit);
    },
    [_unit],
    0
] call CBA_fnc_waitAndExecute;
