%Made for BioNetGen syntax highlighting with jed by Alex Ionkov

% Now create and initialize the syntax tables.
create_syntax_table ("bngl");
define_syntax ("#", "", '%', "bngl");
define_syntax ("([{", ")]}", '(', "bngl");
define_syntax ('"', '"', "bngl");
define_syntax ('\'', '\'', "bngl");
define_syntax ('\\', '\\', "bngl");
define_syntax ("0-9a-zA-Z_", 'w', "bngl");        % words
define_syntax ("-+0-9a-fA-F.xXL", '0', "bngl");   % Numbers
define_syntax (",;.?:", ',', "bngl");
define_syntax ("%-+/&*=<>|!~^", '+', "bngl");
set_syntax_flags ("bngl", 0x4|0x40);

#ifdef HAS_DFA_SYNTAX
%%% DFA_CACHE_BEGIN %%%
private define setup_dfa_callback (name)
{
   dfa_enable_highlight_cache("bnglmode.dfa", name);
   dfa_define_highlight_rule("#", "comment", name);
   dfa_define_highlight_rule("[A-Za-z_\\$][A-Za-z_0-9\\$]*", "Knormal", name);
   dfa_define_highlight_rule("[0-9]+(\\.[0-9]*)?([Ee][\\+\\-]?[0-9]*)?",
           "number", name);
   dfa_define_highlight_rule("0[xX][0-9A-Fa-f]*[LlUu]*", "number", name);
   dfa_define_highlight_rule("[0-9]+[LlUu]*", "number", name);
   dfa_define_highlight_rule("\"([^\"\\\\]|\\\\.)*\"", "string", name);
   dfa_define_highlight_rule("\"([^\"\\\\]|\\\\.)*\\\\?$", "string", name);
   dfa_define_highlight_rule("'([^'\\\\]|\\\\.)*'", "string", name);
   dfa_define_highlight_rule("'([^'\\\\]|\\\\.)*\\\\?$", "string", name);
   dfa_define_highlight_rule("[ \t]+", "normal", name);
   dfa_define_highlight_rule("[\\(\\[{}\\]\\),;\\.\\?:]", "delimiter", name);
   dfa_define_highlight_rule("[%\\-\\+/&\\*=<>\\|!~\\^]", "operator", name);
   dfa_build_highlight_table(name);
}
dfa_set_init_callback (&setup_dfa_callback, "bngl");
%%% DFA_CACHE_END %%%
#endif

% Type 0 keywords
() = define_keywords_n ("bngl", "gml", 3, 0);
() = define_keywords_n ("bngl", "modelrulest_endtypes", 5, 0);
() = define_keywords_n ("bngl", "methodsuffix", 6, 0);
() = define_keywords_n ("bngl", "n_stepsspecies", 7, 0);
() = define_keywords_n ("bngl", "moleculereactionsimulate", 8, 0);
() = define_keywords_n ("bngl", "interfacemoleculesfunctions", 9, 0);
() = define_keywords_n ("bngl", "parameters", 10, 0);
() = define_keywords_n ("bngl", "observables", 11, 0);

% Type 1 keywords
() = define_keywords_n("bngl", "end", 3, 1);
() = define_keywords_n("bngl", "begin", 5, 1);

%
% Hooks: \var{c_mode_hook}
%\seealso{c_set_style}
%!%-
define bngl_mode ()
{
   set_mode("bngl", 2);

   use_syntax_table ("bngl");
   run_mode_hooks("bngl_mode_hook");
}

provide ("bnglmode");
