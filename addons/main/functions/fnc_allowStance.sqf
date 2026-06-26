#include "..\script_component.hpp"
/*
 * Author: Root
 * Allows a blocked stance for a unit through the unit owner.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance <STRING>
 * 2: One time allowance <BOOLEAN>
 * 3: Duration in seconds, 0 for no timer <NUMBER>
 *
 * Return Value:
 * Request was sent <BOOLEAN>
 *
 * Public: Yes
 */

params [
    ["_unit", objNull, [objNull]],
    ["_stance", "DOWN", [""]],
    ["_oneTime", true, [false]],
    ["_duration", 0, [0]]
];

if (isNull _unit) exitWith {false};

[QGVAR(setStanceAllowance), [_unit, _stance, true, _oneTime, _duration], _unit] call CBA_fnc_targetEvent;

true
