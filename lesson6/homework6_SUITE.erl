-module(homework6_SUITE).
-include_lib("common_test/include/ct.hrl").

%% Тести
-export([all/0]).

all() ->
    [
        ct:test_case("Test insert and lookup without timeout", ?MODULE:test_insert_lookup_no_timeout),
        ct:test_case("Test insert and lookup with timeout", ?MODULE:test_insert_lookup_with_timeout),
        ct:test_case("Test delete obsolete", ?MODULE:test_delete_obsolete)
    ].

%% Тест вставки та пошуку без таймауту
test_insert_lookup_no_timeout() ->
    %% Створення таблиці
    homework6:create(my_table),
    %% Вставка даних
    homework6:insert(my_table, key1, "value1"),
    %% Пошук даних
    Value = homework6:lookup(my_table, key1),
    ?assertEqual("value1", Value).

%% Тест вставки та пошуку з таймаутом
test_insert_lookup_with_timeout() ->
    %% Створення таблиці
    homework6:create(my_table),
    %% Вставка даних з таймаутом
    homework6:insert(my_table, key2, "value2", 5),
    %% Пошук даних до тайм-ауту
    ValueBeforeTimeout = homework6:lookup(my_table, key2),
    ?assertEqual("value2", ValueBeforeTimeout),
    %% Очікування більше часу, ніж таймаут
    timer:sleep(10),
    %% Пошук після тайм-ауту
    ValueAfterTimeout = homework6:lookup(my_table, key2),
    ?assertEqual(undefined, ValueAfterTimeout).

%% Тест очищення застарілих даних
test_delete_obsolete() ->
    %% Створення таблиці
    homework6:create(my_table),
    %% Вставка даних з таймаутом
    homework6:insert(my_table, key3, "value3", 1),
    %% Пошук після вставки
    ValueBeforeTimeout = homework6:lookup(my_table, key3),
    ?assertEqual("value3", ValueBeforeTimeout),
    %% Очікування більше часу, ніж таймаут
    timer:sleep(2),
    %% Пошук після очищення
    ValueAfterTimeout = homework6:lookup(my_table, key3),
    ?assertEqual(undefined, ValueAfterTimeout).
