
-module(lesson3_task2).
-export([words/1]).

words(BinText) ->
    binary:split(BinText, <<32>>).
