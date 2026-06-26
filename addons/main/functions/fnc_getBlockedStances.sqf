#include "..\script_component.hpp"
/*
 * Author: Root
 * Returns the currently blocked stance modes.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Blocked stance modes <ARRAY>
 *
 * Public: No
 */

private _blocked = missionNamespace getVariable [QGVAR(blockedStances), 1];
private _stances = [];

if ((_blocked % 2) >= 1) then {
    _stances pushBack "DOWN";
};

if ((_blocked % 4) >= 2) then {
    _stances pushBack "MIDDLE";
};

if (_blocked >= 4) then {
    _stances pushBack "UP";
};

_stances
