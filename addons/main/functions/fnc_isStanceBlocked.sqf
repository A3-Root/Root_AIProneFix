#include "..\script_component.hpp"
/*
 * Author: Root
 * Checks whether a stance is blocked for a unit.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance <STRING>
 *
 * Return Value:
 * Stance is blocked <BOOLEAN>
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_stance", "", [""]]];

private _mode = [_stance] call FUNC(normalizeStance);
if (_mode == "") exitWith {false};

private _blockedStances = call FUNC(getBlockedStances);
if (count _blockedStances == 3 && {_mode == "UP"}) exitWith {false};
if !(_mode in _blockedStances) exitWith {false};

!([_unit, _mode] call FUNC(isStanceAllowed))
