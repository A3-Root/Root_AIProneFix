#include "..\script_component.hpp"
/*
 * Author: Root
 * Selects the nearest available stance mode for correction.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Stance mode <STRING>
 *
 * Public: No
 */

private _blocked = call FUNC(getBlockedStances);
private _index = ["UP", "MIDDLE", "DOWN"] findIf {!(_x in _blocked)};

if (_index == -1) exitWith {"UP"};

["UP", "MIDDLE", "DOWN"] select _index
