#include "..\script_component.hpp"
/*
 * Author: Root
 * Checks whether a unit should be managed by the posture controller.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Unit can be managed <BOOLEAN>
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]]];

!isNull _unit
&& {alive _unit}
&& {local _unit}
&& {!isPlayer _unit}
&& {isNull objectParent _unit}
&& {_unit isKindOf "CAManBase"}
