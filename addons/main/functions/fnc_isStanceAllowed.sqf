#include "..\script_component.hpp"
/*
 * Author: Root
 * Checks whether a unit has an explicit allowance for a stance.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance <STRING>
 *
 * Return Value:
 * Stance is explicitly allowed <BOOLEAN>
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_stance", "", [""]]];

private _mode = [_stance] call FUNC(normalizeStance);
if (_mode == "") exitWith {false};

private _allowedStances = _unit getVariable [QGVAR(allowedStances), []];
if (_mode in _allowedStances) exitWith {true};

private _activeOneTimeStances = _unit getVariable [QGVAR(activeOneTimeStances), []];
if (_mode in _activeOneTimeStances) exitWith {true};

private _oneTimeStances = _unit getVariable [QGVAR(oneTimeStances), []];
if !(_mode in _oneTimeStances) exitWith {false};

_oneTimeStances deleteAt (_oneTimeStances find _mode);
_unit setVariable [QGVAR(oneTimeStances), _oneTimeStances, false];

_activeOneTimeStances pushBackUnique _mode;
_unit setVariable [QGVAR(activeOneTimeStances), _activeOneTimeStances, false];

true
