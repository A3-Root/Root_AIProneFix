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

GVAR(monitorPFH) = [FUNC(monitorUnits), 0.25, []] call CBA_fnc_addPerFrameHandler;
