-module(homework6_cache).
-behaviour(gen_server).

%% API
-export([start_link/2, init/1, handle_call/3, handle_info/2, terminate/2]).

%% Встановлення початкових значень
-define(DEFAULT_TIMEOUT, 600).

%% Старт процесу
start_link(Name, TableName) ->
    gen_server:start_link({local, Name}, homework6_cache, [TableName]).

%% Ініціалізація процесу
init([TableName]) ->
    Table = ets:new(TableName, [set, named_table]),
    %% Викликаємо періодичне очищення
    send(self(), delete_obsolete),
    {ok, Table}.

%% Обробка викликів
handle_call({insert, Key, Value}, _From, Table) ->
    ets:insert(Table, {Key, {Value, undefined}}),
    {reply, ok, Table};

handle_call({insert, Key, Value, Timeout}, _From, Table) ->
    ExpiryTime = calendar:local_time() + Timeout,
    ets:insert(Table, {Key, {Value, ExpiryTime}}),
    {reply, ok, Table};

handle_call({lookup, Key}, _From, Table) ->
    case ets:lookup(Table, Key) of
        [{_, {Value, ExpiryTime}}] when ExpiryTime == undefined -> 
            {reply, Value, Table};
        [{_, {Value, ExpiryTime}}] when ExpiryTime > calendar:local_time() -> 
            {reply, Value, Table};
        _ -> 
            {reply, undefined, Table}
    end.

%% Обробка повідомлень
handle_info(delete_obsolete, Table) ->
    delete_obsolete(Table),
    %% Оновлюємо таблицю раз на 60 секунд
    send(self(), delete_obsolete),
    {noreply, Table};

terminate(_Reason, _State) ->
    ok.

%% Очищення застарілих даних
delete_obsolete(Table) ->
    Now = calendar:local_time(),
    ets:match_delete(Table, {{_, {'$1', '$2'}}, [{'<', Now, '$2'}]}).
