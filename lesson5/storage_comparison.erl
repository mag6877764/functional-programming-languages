-module(storage_comparison).
-export([compare/0]).

compare() ->
    %% Тестування Map
    map_test(),
    %% Тестування Proplist
    proplist_test(),
    %% Тестування dict
    dict_test(),
    %% Тестування ETS
    ets_test(),
    %% Тестування DETS
    dets_test().

%% Тест для Map
map_test() ->
    StartTime = timer:tc(fun() -> test_map() end),
    io:format("Map test duration: ~p~n", [StartTime]).

test_map() ->
    Map = #{} , %% Пустий Map
    Map1 = Map#{key1 => "value1"},
    Map2 = Map1#{key2 => "value2"},
    Map3 = Map2#{key3 => "value3"},
    _ = maps:get(key1, Map3),
    _ = maps:get(key2, Map3),
    _ = maps:get(key3, Map3).

%% Тест для Proplist
proplist_test() ->
    StartTime = timer:tc(fun() -> test_proplist() end),
    io:format("Proplist test duration: ~p~n", [StartTime]).

test_proplist() ->
    Proplist = [],
    Proplist1 = [{key1, "value1"} | Proplist],
    Proplist2 = [{key2, "value2"} | Proplist1],
    Proplist3 = [{key3, "value3"} | Proplist2],
    _ = proplists:get_value(key1, Proplist3),
    _ = proplists:get_value(key2, Proplist3),
    _ = proplists:get_value(key3, Proplist3).

%% Тест для dict
dict_test() ->
    StartTime = timer:tc(fun() -> test_dict() end),
    io:format("Dict test duration: ~p~n", [StartTime]).

test_dict() ->
    Dict = dict:new(),
    Dict1 = dict:store(key1, "value1", Dict),
    Dict2 = dict:store(key2, "value2", Dict1),
    Dict3 = dict:store(key3, "value3", Dict2),
    _ = dict:find(key1, Dict3),
    _ = dict:find(key2, Dict3),
    _ = dict:find(key3, Dict3).

%% Тест для ETS
ets_test() ->
    StartTime = timer:tc(fun() -> test_ets() end),
    io:format("ETS test duration: ~p~n", [StartTime]).

test_ets() ->
    %% Створення таблиці ETS
    Table = ets:new(my_table, [set]),
    ets:insert(Table, {key1, "value1"}),
    ets:insert(Table, {key2, "value2"}),
    ets:insert(Table, {key3, "value3"}),
    _ = ets:lookup(Table, key1),
    _ = ets:lookup(Table, key2),
    _ = ets:lookup(Table, key3),
    ets:delete(Table).

%% Тест для DETS
dets_test() ->
    StartTime = timer:tc(fun() -> test_dets() end),
    io:format("DETS test duration: ~p~n", [StartTime]).

test_dets() ->
    %% Створення таблиці DETS
    {ok, Table} = dets:open_file(my_dets_table, [{file, "/tmp/my_dets_file.dets"}]),
    dets:insert(Table, {key1, "value1"}),
    dets:insert(Table, {key2, "value2"}),
    dets:insert(Table, {key3, "value3"}),
    _ = dets:lookup(Table, key1),
    _ = dets:lookup(Table, key2),
    _ = dets:lookup(Table, key3),
    dets:close(Table).
