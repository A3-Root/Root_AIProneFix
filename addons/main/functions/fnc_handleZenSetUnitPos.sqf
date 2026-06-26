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

private _stance = [_mode] call FUNC(normalizeStance);

if (_stance == "DOWN") exitWith {
    [_unit, _stance, true, false, 0] call FUNC(setStanceAllowanceLocal);
};

[_unit, "DOWN", false, false, 0] call FUNC(setStanceAllowanceLocal);

[
    {
        params ["_unit"];
        [_unit, false] call FUNC(correctUnit);
    },
    [_unit],
    0
] call CBA_fnc_waitAndExecute;
