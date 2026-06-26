#include "..\script_component.hpp"
/*
 * Author: Root
 * Monitors managed AI units and corrects prohibited prone states.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

GVAR(units) = GVAR(units) select {
    !isNull _x
    && {alive _x}
};

{
    if (
        [_x] call FUNC(isEligibleUnit)
        && {!(_x getVariable [QGVAR(allowProne), false])}
        && {
            stance _x == "PRONE"
            || {toUpperANSI (unitPos _x) == "DOWN"}
            || {(toLowerANSI (animationState _x)) find "ppne" != -1}
        }
    ) then {
        [_x, true] call FUNC(correctUnit);
    };
} forEach GVAR(units);
