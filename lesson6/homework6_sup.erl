-module(homework6_sup).
-behaviour(supervisor).

%% API
-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, homework6_sup}, homework6_sup, []).

init(_) ->
    {ok, {{one_for_one, 5, 10},
          [{homework6, {homework6, start_link, []}, permanent, 5000, worker, [homework6]}]}}.
