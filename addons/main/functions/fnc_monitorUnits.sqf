#include "..\script_component.hpp"
/*
 * Author: Root
 * Monitors managed AI units and corrects prohibited stance states.
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
    private _stance = stance _x;
    private _unitPos = unitPos _x;
    private _activeOneTimeStances = _x getVariable [QGVAR(activeOneTimeStances), []];

    if (_activeOneTimeStances isNotEqualTo []) then {
        private _currentMode = [_stance] call FUNC(normalizeStance);
        _activeOneTimeStances = _activeOneTimeStances select {_x == _currentMode};
        _x setVariable [QGVAR(activeOneTimeStances), _activeOneTimeStances, false];
    };

    if (
        [_x] call FUNC(isEligibleUnit)
        && {
            [_x, _stance] call FUNC(isStanceBlocked)
            || {[_x, _unitPos] call FUNC(isStanceBlocked)}
        }
    ) then {
        [_x, false] call FUNC(correctUnit);
    };
} forEach GVAR(units);
