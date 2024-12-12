-module(my_cache).
-export([create/1, insert/2, insert/3, lookup/2, delete_obsolete/1]).

-define(TIMEOUT, 600). %% Стандартний час зберігання - 600 секунд

%% Структура даних для кешу
-record(cache, {table = dict:new()}).

%% Створення таблиці кешу
create(TableName) ->
    process_flag(trap_exit, true),
    Table = #cache{table = dict:new()},
    put(TableName, Table),
    ok.

%% Вставка даних з обмеженням часу
insert(TableName, Key, Value) ->
    insert(TableName, Key, Value, ?TIMEOUT).

insert(TableName, Key, Value, Timeout) ->
    CurrentTime = calendar:local_time(),
    ExpiryTime = calendar:seconds_to_time(Timeout),
    Table = get(TableName),
    UpdatedTable = dict:store(Key, {Value, calendar:seconds_to_time(ExpiryTime)}, Table#cache.table),
    put(TableName, Table#cache{table = UpdatedTable}),
    ok.

%% Пошук даних в кеші
lookup(TableName, Key) ->
    Table = get(TableName),
    case dict:find(Key, Table#cache.table) of
        {ok, {Value, ExpiryTime}} ->
            %% Перевіряємо, чи не сплив час
            if calendar:local_time() > ExpiryTime -> undefined;
                true -> Value
            end;
        error -> undefined
    end.

%% Видалення застарілих записів
delete_obsolete(TableName) ->
    Table = get(TableName),
    Now = calendar:local_time(),
    UpdatedTable = dict:fold(fun(Key, {Value, ExpiryTime}, Acc) ->
                                  if ExpiryTime < Now -> dict:store(Key, {Value, ExpiryTime}, Acc);
                                     true -> Acc
                                  end
                              end, dict:new(), Table#cache.table),
    put(TableName, Table#cache{table = UpdatedTable}),
    ok.

%% Допоміжні функції для доступу до таблиць
get(TableName) ->
    case get(TableName) of
        undefined -> error;
        Table -> Table
    end.
