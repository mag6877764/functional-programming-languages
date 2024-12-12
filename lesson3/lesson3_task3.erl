
-module(lesson3_task3).
-export([split/2]).

split(BinText, Delimiter) ->
    binary:split(BinText, Delimiter).
