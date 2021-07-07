-module(calc).

%% API
-export([es        /1]).
-export([eval_str  /1]).
-export([parse     /1]).
-export([generate  /1]).
-export([eval      /1]).
-export([schema_map/3]).

%%
%% API
%%
es(Str) ->
    eval_str(Str).
eval_str(Str) when is_list(Str) ->
    eval(parse(Str)).
    
parse(Str) ->
    schema_map(parse, Str, {tokens, expr}).

generate(AST) ->
    schema_map(generate, AST, {tokens, expr}).


%%First step
eval([E1, '+', E2]) -> 
    io:fwrite(" SOMA \n"),
    eval(E1) + eval(E2);
eval([E1, '-', E2]) ->
    io:fwrite(" SUBTRAÇÃO \n"),
    eval(E1) - eval(E2);
eval([E1, '*', E2]) -> 
    io:fwrite(" MULTIPLICAÇÃO \n"),
    eval(E1) * eval(E2);
eval([E1, '/', E2]) -> 
    io:fwrite(" DIVISÃO \n"),
    eval(E1) / eval(E2);
eval(['(', E, ')']) -> eval(E);
eval(['+', E]) -> +eval(E);
eval(['-', E]) -> -eval(E);
eval(N) when is_number(N) -> N.%%Evaluate N

%%
%% local
%%
schema_map(D=parse, V, {tokens, T}) ->
    {R, []} = schema_map(D, tokenize(V), T),
    R;
schema_map(D=generate, V, {tokens, T}) ->
    stringify(schema_map(D, {V, []}, T));

schema_map(D, V, expr) ->
    schema_map(D, V, {variant, [
        [term, '+', expr],
        [term, '-', expr],
         term
    ]});
schema_map(D, V, term) ->
    schema_map(D, V, {variant, [
        [factor0, '*', term],
        [factor0, '/', term],
         factor0
    ]});
schema_map(D, V, factor) ->
    schema_map(D, V, {variant, [
         number,
        ['+', factor],
        ['-', factor],
        ['(', expr, ')']
    ]});
schema_map(parse   , [H|T]   , number) when is_number(H) -> {H, T} ;
schema_map(generate, {V, Acc}, number) when is_number(V) -> [V|Acc];
%% base
schema_map(D, V, {variant, [T|OT]}) ->
    try          schema_map(D, V, T)
    catch _:_ -> schema_map(D, V, {variant, OT})
    end;
schema_map(D=parse, V, S) when is_list(S) ->
    lists:mapfoldl(
        fun(SE, Acc) ->
            schema_map(D, Acc, SE)
        end,
    V, S);
schema_map(D=generate, {V, Acc}, S) when is_list(V), is_list(S), length(V) =:= length(S) ->
    lists:foldl(
        fun({VE, SE}, Acc1) ->
            schema_map(D, {VE, Acc1}, SE)
        end,
    Acc, lists:zip(V, S));
schema_map(parse   , [H|T]   , Token) when H =:= Token -> {H, T} ;
schema_map(generate, {V, Acc}, Token) when V =:= Token -> [V|Acc];
%% others
schema_map(D, V, T) ->
    erlang:throw({badarg, D, V, T}).

-define(IS_DIGIT(C), $0 =< C, C =< $9).
%%Tokenizers para remover espaços em branco e dividir a expressão em termos
tokenize(V) ->
    lists:reverse(tokenize([], V)).
tokenize(R, []) ->
    R;
tokenize(R, [H|T]) when H =:= $\s ->
    tokenize(R, T);
tokenize(R, V=[H|_]) when ?IS_DIGIT(H) ->
    {Token, T} = read_number(V, [], false),
    tokenize([Token|R], T);
tokenize(R, [H|T]) when H =:= $+; H =:= $-; H =:= $*; H =:= $/; H =:= $(; H =:= $); H =:= $! ->
    tokenize([list_to_atom([H])|R], T);%%vai mudar os caracteres de strin/int/etc para atom
tokenize(_, [H|_]) ->
    erlang:throw({bag_symbol, [H]}).

read_number([H|T], Acc, IsFloat) when ?IS_DIGIT(H) ->
    read_number(T, [H|Acc], IsFloat);
read_number([H|T], Acc, false) when H =:= $. ->
    read_number(T, [H|Acc], true);
read_number(V, Acc, true) ->
    {list_to_float(lists:reverse(Acc)), V};
read_number(V, Acc, false) ->
    {list_to_integer(lists:reverse(Acc)), V}.

stringify(V) ->
    binary_to_list(iolist_to_binary(stringify([], V))).
stringify(R, []) ->
    R;
stringify(R, [H|T]) when is_integer(H) ->
    stringify([integer_to_list(H)|R], T);
stringify(R, [H|T]) when is_float(H) ->
    stringify([io_lib:fwrite("~p", [H])|R], T);
stringify(R, [H|T]) when H =:= '+'; H =:= '-'; H =:= '*'; H =:= '/'; H =:= '('; H =:= ')'; H =:= '!' ->
    stringify([atom_to_list(H)|R], T);
stringify(_, [H|_]) ->
    erlang:throw({bad_token, H}).
