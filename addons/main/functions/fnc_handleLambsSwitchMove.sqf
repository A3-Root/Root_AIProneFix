#include "..\script_component.hpp"
/*
 * Author: Root
 * Corrects LAMBS prone and kneel animation requests for managed AI units.
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

private _name = toLowerANSI _animation;
private _blocked = (_name find "ppne" != -1 && {[_unit, "DOWN"] call FUNC(isStanceBlocked)})
    || {_name find "pknl" != -1 && {[_unit, "MIDDLE"] call FUNC(isStanceBlocked)}};
if (!_blocked) exitWith {};

[
    {
        params ["_unit"];
        [_unit, false] call FUNC(correctUnit);
    },
    [_unit],
    0
] call CBA_fnc_waitAndExecute;
