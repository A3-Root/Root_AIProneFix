[h1]Roots AI Prone Fix[/h1]
A very simple and quick mod to control which stances the AI may use unless explicitly changed by Zeus (ZEN) or script handlers. Only needs to be loaded on machines where AI is local (so only for Zeus and in some cases the server).

Requires CBA and ZEN. Tested to work with LAMBS_Danger.fsm.

[h2]CBA Setting[/h2]
[code]Root AI Prone Fix > AI Stances > Blocked AI stances[/code]

[h3]Available combinations:[/h3][list]
    [*] None
    [*] Prone
    [*] Kneel
    [*] Kneel + Prone
    [*] Stand
    [*] Stand + Prone
    [*] Stand + Kneel
    [*] Stand + Kneel + Prone[/list]
Default: [b]Prone[/b]

If every stance is selected, standing is kept as the fallback stance.
[hr][/hr]

[h2]Script API[/h2]
Allow a blocked stance for one transition:
[code][_unit, "DOWN"] call root_aipronefix_main_fnc_allowStance;
[/code]
Allow a blocked stance until cleared:
[code][_unit, "DOWN", false] call root_aipronefix_main_fnc_allowStance;
[/code]
Allow a blocked stance for a duration:
[code][_unit, "DOWN", false, 10] call root_aipronefix_main_fnc_allowStance;
[/code]
Clear allowances:
[code][_unit, "DOWN"] call root_aipronefix_main_fnc_clearStanceAllowances;
[_unit] call root_aipronefix_main_fnc_clearStanceAllowances;[/code]
Equivalent CBA target events:
[code]["root_aipronefix_main_setStanceAllowance", [_unit, "DOWN", true, true, 0], _unit] call CBA_fnc_targetEvent;
["root_aipronefix_main_clearStanceAllowances", [_unit, "DOWN"], _unit] call CBA_fnc_targetEvent;[/code]
[hr][/hr]

[h2]Credits[/h2]
[b]Root (xMidnightSnowx)[/b]

[hr][/hr]
[h2]License[/h2]
[b]APL-SA:[/b] Arma Public License - Share Alike

[url=https://www.bohemia.net/community/licenses/arma-public-license-share-alike]Read Full License[/url]

[b]TL;DR - What am I allowed to do?[/b]
✅ [b]Attribution Required[/b] - Credit original authors (y0014984, Wasserstoff, JulesVerner) and current maintainer (Root)
✅ [b]Share Alike[/b] - Derivative works must use same APL-SA license
✅ [b]Redistribute publicly[/b] with clear credit and link to this workshop page
❌ [b]Non-Commercial[/b] - No commercial use
❌ [b]Arma Only[/b] - No porting to other games

[hr][/hr]
[h2]Links[/h2]

[url=https://github.com/A3-Root/Root_AIProneFix][img]https://i.imgur.com/lPLHihO.gif[/img][/url]
[url=https://discord.gg/77th-jsoc-official][img]https://i.imgur.com/8B7UcQ2.gif[/img][/url]

[hr][/hr]

