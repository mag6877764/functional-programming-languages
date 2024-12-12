
-module(lesson3_task1).
-export([first_word/1]).

first_word(BinText) ->
    case lists:prefix(<<" "> >, BinText) of
        true -> hd(binary:split(BinText, <<32>>));
        false -> BinText
    end.
