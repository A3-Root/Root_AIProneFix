#include "..\script_component.hpp"
/*
 * Author: Root
 * Restores a managed AI unit to the enforced standing posture.
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
if (_unit getVariable [QGVAR(allowProne), false]) exitWith {false};

if (_resetAnimation) then {
    _unit switchMove "";
};

_unit setUnitPos "UP";
_unit setUnitPosWeak "UP";

true
