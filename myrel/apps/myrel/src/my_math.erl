%%%-------------------------------------------------------------------
%% @doc a simple math module to try out eunit
%% @end
%%%-------------------------------------------------------------------

-module(my_math).

-export([add/2
        ,negate/1
        ,mult/2]).

-ifdef(TEST).
-include_lib("proper/include/proper.hrl").
-endif.

%%====================================================================
%% API
%%====================================================================

-spec add(number(), number()) -> number().
add(A,B) ->
    A + B.

%%--------------------------------------------------------------------

-spec negate(number()) -> number().
negate(Number) ->
    -Number.

%%--------------------------------------------------------------------

-spec mult(number(), number()) -> number().
mult(A,B) ->
    A * B.

%%====================================================================
%% Internal functions
%%====================================================================


%%====================================================================
%% Unit tests
%%====================================================================


-ifdef(TEST).

-include_lib("eunit/include/eunit.hrl").

add_test() ->
    %% use assertEqual instead of pattern matching for better error messages
    ?assertEqual(5, add(3,2)),
    ?assertEqual(0, add(-1,1)).

negate_test() ->
    0 = negate(0),
    1 = negate(-1),
    -1 = negate(1).

mult_test() ->
    0 = mult(0, 1),
    42 = mult(6,7).

prop_add() ->
    ?FORALL(T, term(), T =:= binary_to_term(term_to_binary(T))),
    ?FORALL(A, integer(), A =:= add(A,0)).

%% executes the propEr properties inside an eunit test
proper_test_() ->
    {timeout, 30,
     fun() ->
             ?assertEqual([], proper:module(?MODULE)),
             ?assertEqual([], proper:check_specs(?MODULE))
     end}.

-endif.
