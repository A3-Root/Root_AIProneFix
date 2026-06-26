#include "..\script_component.hpp"
/*
 * Author: Root
 * Applies or removes stance allowances on the unit owner.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance <STRING>
 * 2: Allow stance <BOOLEAN>
 * 3: One time allowance <BOOLEAN>
 * 4: Duration in seconds, 0 for no timer <NUMBER>
 *
 * Return Value:
 * Allowance was changed <BOOLEAN>
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    ["_stance", "", [""]],
    ["_allow", true, [false]],
    ["_oneTime", false, [false]],
    ["_duration", 0, [0]]
];

private _mode = [_stance] call FUNC(normalizeStance);
if (isNull _unit || {!local _unit} || {_mode == ""}) exitWith {false};

private _variable = [QGVAR(allowedStances), QGVAR(oneTimeStances)] select _oneTime;
private _stances = _unit getVariable [_variable, []];

if (_allow) then {
    _stances pushBackUnique _mode;
} else {
    private _index = _stances find _mode;
    if (_index != -1) then {
        _stances deleteAt _index;
    };
};

_unit setVariable [_variable, _stances, false];

if (_allow && {_duration > 0}) then {
    [
        {
            params ["_unit", "_mode", "_oneTime"];
            [_unit, _mode, false, _oneTime, 0] call FUNC(setStanceAllowanceLocal);
        },
        [_unit, _mode, _oneTime],
        _duration
    ] call CBA_fnc_waitAndExecute;
};

true
