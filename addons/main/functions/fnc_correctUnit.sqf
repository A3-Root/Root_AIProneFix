#include "..\script_component.hpp"
/*
 * Author: Root
 * Restores a managed AI unit to an allowed posture.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Reset animation <BOOLEAN>
 *
 * Return Value:
 * Unit was corrected <BOOLEAN>
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_resetAnimation", false, [false]]];

if !([_unit] call FUNC(isEligibleUnit)) exitWith {false};

private _mode = call FUNC(getCorrectionMode);

if (_resetAnimation) then {
    _unit switchMove "";
};

_unit setUnitPos _mode;
_unit setUnitPosWeak _mode;

true
