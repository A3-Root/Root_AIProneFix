#include "..\script_component.hpp"
/*
 * Author: Root
 * Initializes posture enforcement handlers.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

GVAR(units) = [];

["CAManBase", "InitPost", {
    params ["_unit"];
    [_unit] call FUNC(registerUnit);
}, true, [], true] call CBA_fnc_addClassEventHandler;

["zen_common_setUnitPos", FUNC(handleZenSetUnitPos)] call CBA_fnc_addEventHandler;
["lambs_main_doSwitchMove", FUNC(handleLambsSwitchMove)] call CBA_fnc_addEventHandler;
[QGVAR(setStanceAllowance), FUNC(setStanceAllowanceLocal)] call CBA_fnc_addEventHandler;
[QGVAR(clearStanceAllowances), {
    params [["_unit", objNull, [objNull]], ["_stance", "", [""]]];

    if (isNull _unit || {!local _unit}) exitWith {};

    private _mode = [_stance] call FUNC(normalizeStance);
    private _variables = [QGVAR(allowedStances), QGVAR(oneTimeStances), QGVAR(activeOneTimeStances)];

    {
        if (_mode == "") then {
            _unit setVariable [_x, [], false];
        } else {
            private _stances = _unit getVariable [_x, []];
            private _index = _stances find _mode;
            if (_index != -1) then {
                _stances deleteAt _index;
            };
            _unit setVariable [_x, _stances, false];
        };
    } forEach _variables;
}] call CBA_fnc_addEventHandler;

GVAR(monitorPFH) = [FUNC(monitorUnits), 0.25, []] call CBA_fnc_addPerFrameHandler;
