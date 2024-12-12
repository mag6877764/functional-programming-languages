-module(homework6).
-behaviour(application).

%% API
-export([start/0, start/2, stop/1, create/1, insert/2, insert/3, lookup/2]).

%% Викликається при запуску додатку
start() ->
    application:start(homework6).

start(_Type, _Args) ->
    case supervisor:start_link({local, homework6_sup}, homework6_sup, []) of
        {ok, _Pid} -> ok;
        {error, _Reason} -> {error, failed_to_start_supervisor}
    end.

stop(_State) ->
    ok.

%% Створення таблиці
create(TableName) ->
    gen_server:start_link({local, TableName}, homework6_cache, [TableName]), 
    ok.

%% Вставка даних без обмеження часу
insert(TableName, Key, Value) ->
    gen_server:call(TableName, {insert, Key, Value}).

%% Вставка даних з обмеженням часу
insert(TableName, Key, Value, Timeout) ->
    gen_server:call(TableName, {insert, Key, Value, Timeout}).

%% Пошук даних
lookup(TableName, Key) ->
    gen_server:call(TableName, {lookup, Key}).
