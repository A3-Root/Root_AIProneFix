#include "..\script_component.hpp"
/*
 * Author: Root
 * Registers a unit for local posture enforcement.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Unit was registered <BOOLEAN>
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

if (isNull _unit || {!(_unit isKindOf "CAManBase")} || {isPlayer _unit}) exitWith {false};

if (isNil {_unit getVariable QGVAR(localEH)}) then {
    _unit setVariable [QGVAR(localEH), _unit addEventHandler ["Local", FUNC(handleUnitLocal)], false];
};

if (isNil {_unit getVariable QGVAR(animStateChangedEH)}) then {
    _unit setVariable [QGVAR(animStateChangedEH), _unit addEventHandler ["AnimStateChanged", FUNC(handleUnitAnimStateChanged)], false];
};

if !([_unit] call FUNC(isEligibleUnit)) exitWith {false};

GVAR(units) pushBackUnique _unit;

[_unit, false] call FUNC(correctUnit);
