-module(lesson3_test).
-include_lib("eunit/include/eunit.hrl").

first_word_test() ->
    BinText = <<"Some text">>,
    ?assertEqual(<<"Some">>, lesson3_task1:first_word(BinText)).

words_test() ->
    BinText = <<"Text with four words">>,
    ?assertEqual([<<"Text">>, <<"with">>, <<"four">>, <<"words">>], lesson3_task2:words(BinText)).
