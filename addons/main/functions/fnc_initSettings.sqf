#include "..\script_component.hpp"
/*
 * Author: Root
 * Registers mission settings for AI stance enforcement.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

[
    QGVAR(blockedStances),
    "LIST",
    [
        "Blocked AI stances",
        "Select which AI stances are corrected unless explicitly allowed by this addon."
    ],
    ["Root AI Prone Fix", "AI Stances"],
    [
        [0, 1, 2, 3, 4, 5, 6, 7],
        [
            "None",
            "Prone",
            "Kneel",
            "Kneel + Prone",
            "Stand",
            "Stand + Prone",
            "Stand + Kneel",
            "Stand + Kneel + Prone"
        ],
        1
    ],
    true
] call CBA_fnc_addSetting;
