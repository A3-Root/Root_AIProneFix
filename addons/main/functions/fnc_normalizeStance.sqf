#include "..\script_component.hpp"
/*
 * Author: Root
 * Converts stance names to setUnitPos modes.
 *
 * Arguments:
 * 0: Stance <STRING>
 *
 * Return Value:
 * Normalized stance mode <STRING>
 *
 * Public: No
 */

params [["_stance", "", [""]]];

switch (toUpperANSI _stance) do {
    case "STAND";
    case "UP": {"UP"};
    case "CROUCH";
    case "KNEEL";
    case "MIDDLE": {"MIDDLE"};
    case "PRONE";
    case "DOWN": {"DOWN"};
    default {""};
}
