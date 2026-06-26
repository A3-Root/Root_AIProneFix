#include "..\script_component.hpp"
/*
 * Author: Root
 * Clears explicit stance allowances for a unit through the unit owner.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance, empty string clears all <STRING>
 *
 * Return Value:
 * Request was sent <BOOLEAN>
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_stance", "", [""]]];

if (isNull _unit) exitWith {false};

[QGVAR(clearStanceAllowances), [_unit, _stance], _unit] call CBA_fnc_targetEvent;

true
