# Root_AIProneFix
Controls which stances Arma 3 AI may use unless explicitly allowed by Zeus (ZEN) or script handlers.

## CBA Setting
`Root AI Prone Fix > AI Stances > Blocked AI stances`

Available combinations:
- None
- Prone
- Kneel
- Kneel + Prone
- Stand
- Stand + Prone
- Stand + Kneel
- Stand + Kneel + Prone

Default: `Prone`

If every stance is selected, standing is kept as the fallback stance.

## Script API
Allow a blocked stance for one transition:
```sqf
[_unit, "DOWN"] call root_aipronefix_main_fnc_allowStance;
```

Allow a blocked stance until cleared:
```sqf
[_unit, "DOWN", false] call root_aipronefix_main_fnc_allowStance;
```

Allow a blocked stance for a duration:
```sqf
[_unit, "DOWN", false, 10] call root_aipronefix_main_fnc_allowStance;
```

Clear allowances:
```sqf
[_unit, "DOWN"] call root_aipronefix_main_fnc_clearStanceAllowances;
[_unit] call root_aipronefix_main_fnc_clearStanceAllowances;
```

Equivalent CBA target events:
```sqf
["root_aipronefix_main_setStanceAllowance", [_unit, "DOWN", true, true, 0], _unit] call CBA_fnc_targetEvent;
["root_aipronefix_main_clearStanceAllowances", [_unit, "DOWN"], _unit] call CBA_fnc_targetEvent;
```

APL-SA License
