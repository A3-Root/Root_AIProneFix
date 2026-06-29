#include "..\script_component.hpp"
/*
 * Author: Root
 * Restores a managed AI unit to an allowed posture rule.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reset animation, kept for compatibility <BOOLEAN>
 *
 * Return Value:
 * Unit was corrected <BOOLEAN>
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_resetAnimation", false, [false]]];

if !([_unit] call FUNC(isEligibleUnit)) exitWith {false};

private _mode = call FUNC(getCorrectionMode);
private _isBlocked = [_unit, stance _unit] call FUNC(isStanceBlocked) || {[_unit, unitPos _unit] call FUNC(isStanceBlocked)};
if (!_isBlocked) exitWith {false};

private _lastCorrection = _unit getVariable [QGVAR(lastCorrection), -1];
if (CBA_missionTime - _lastCorrection < 0.75) exitWith {false};

_unit setUnitPos _mode;
_unit setVariable [QGVAR(lastCorrection), CBA_missionTime, false];

true
