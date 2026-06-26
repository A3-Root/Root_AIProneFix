#include "..\script_component.hpp"
/*
 * Author: Root
 * Registers a unit when it becomes local to the current machine.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Is local <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_isLocal", false, [false]]];

if (!_isLocal) exitWith {};

[_unit] call FUNC(registerUnit);
