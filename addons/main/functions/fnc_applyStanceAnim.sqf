#include "..\script_component.hpp"
/*
 * Author: Root
 * Plays the animation of a stance mode matching the unit's current weapon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Stance mode (UP, MIDDLE, DOWN) <STRING>
 * 2: Instant switch <BOOLEAN>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_mode", "UP", [""]], ["_instant", false, [false]]];

private _stance = switch (_mode) do {
    case "DOWN": {"AmovPpneMstp"};
    case "MIDDLE": {"AmovPknlMstp"};
    default {"AmovPercMstp"};
};

private _weapon = currentWeapon _unit;
private _suffix = switch (true) do {
    case (_weapon isEqualTo ""): {"SnonWnonDnon"};
    case (_weapon isEqualTo handgunWeapon _unit): {"SrasWpstDnon"};
    case (_weapon isEqualTo secondaryWeapon _unit): {"SrasWlnrDnon"};
    default {"SrasWrflDnon"};
};

private _animation = format ["%1%2", _stance, _suffix];

if (_instant) then {
    _unit switchMove _animation;
} else {
    _unit playMoveNow _animation;
};
