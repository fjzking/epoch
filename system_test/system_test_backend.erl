%%% -*- erlang-indent-level: 4 -*-
%%%-------------------------------------------------------------------
%%% @copyright (C) 2017, Aeternity Anstalt
%%%-------------------------------------------------------------------
-module(system_test_backend).


%=== EXPORTS ===================================================================

%% API exports
-export([prepare_node/2]).
-export([setup_node/3]).


%=== GENERIC API FUNCTIONS =====================================================

prepare_node(#{backend := docker} = NodeSpec, TestCtx) ->
    case system_test_backend_docker:prepare_node(NodeSpec, TestCtx) of
        {ok, NodeState, NewTestCtx} ->
            %% We should probably only do that if the key does not exists
            {ok, NodeState#{backend => docker}, NewTestCtx};
        Error -> Error
    end.

setup_node(#{backend := docker} = NodeState, NodeStates, TestCtx) ->
    system_test_backend_docker:setup_node(NodeState, NodeStates, TestCtx).
