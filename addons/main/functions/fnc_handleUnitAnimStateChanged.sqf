#include "..\script_component.hpp"
/*
 * Author: Root
 * Corrects prone animation states for managed AI units.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Animation <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_animation", "", [""]]];

if ((toLowerANSI _animation) find "ppne" == -1) exitWith {};
if !([_unit, "DOWN"] call FUNC(isStanceBlocked)) exitWith {};

[
    {
        params ["_unit"];
        [_unit, false] call FUNC(correctUnit);
    },
    [_unit],
    0
] call CBA_fnc_waitAndExecute;
