-module(lesson2_test).
-include_lib("eunit/include/eunit.hrl").

%% Тести для першого завдання: Витягти з рядка перше слово
test_first_word() ->
    BinText = <<"Some text">>,
    ?assertEqual(<<"Some">>, lesson2_task1:first_word(BinText)).

%% Тести для другого завдання: Розділити рядок на слова
test_words() ->
    BinText = <<"Text with four words">>,
    Expected = [<<"Text">>, <<"with">>, <<"four">>, <<"words">>],
    ?assertEqual(Expected, lesson2_task2:words(BinText)).

%% Тести для третього завдання: Розділити рядок на частини за роздільником
test_split() ->
    BinText = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>,
    Expected = [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>],
    ?assertEqual(Expected, lesson2_task3:split(BinText, "-:-")).

%% Тести для четвертого завдання: Парсинг JSON (proplist)
test_decode_proplist() ->
    Json = <<"{'squadName': 'Super hero squad', 'members': [{'name': 'Molecule Man'}]}">>,
    Expected = [{<<"squadName">>, <<"Super hero squad">>},
                {<<"members">>, [{<<"name">>, <<"Molecule Man">>}]}],
    ?assertEqual(Expected, lesson2_task4:decode(Json, proplist)).

%% Тести для п'ятого завдання: Парсинг JSON (map)
test_decode_map() ->
    Json = <<"{'squadName': 'Super hero squad', 'members': [{'name': 'Molecule Man'}]}">>,
    Expected = #{
        <<"squadName">> => <<"Super hero squad">>,
        <<"members">> => [
            #{<<"name">> => <<"Molecule Man">>}
        ]
    },
    ?assertEqual(Expected, lesson2_task4:decode(Json, map)).

%% Тести для шостого завдання: Робота з бінарними даними
test_binary_data() ->
    BinText = <<255, 0, 255, 0>>,
    Expected = <<255, 0, 255, 0>>,
    ?assertEqual(Expected, lesson2_task6:process_binary(BinText)).

%% Тести для сьомого завдання: Робота з бітами
test_bits() ->
    BinData = <<0:8/unit:8, 1:8/unit:8>>,
    ?assertEqual(<<0:8/unit:8, 1:8/unit:8>>, lesson2_task7:process_bits(BinData)).

%% Тести для восьмого завдання: Робота з рядками в UTF-8
test_utf8_string() ->
    BinText = <<"Привіт, світ!">>,
    Expected = <<"Привіт, світ!">>,
    ?assertEqual(Expected, lesson2_task8:process_utf8(BinText)).

%% Тести для дев'ятого завдання: Витягти всі числа з тексту
test_extract_numbers() ->
    Text = <<"There are 12 apples and 3 oranges">>,
    Expected = [12, 3],
    ?assertEqual(Expected, lesson2_task9:extract_numbers(Text)).

%% Тести для десятого завдання: Заміна символів
test_replace_characters() ->
    Text = <<"hello world">>,
    Expected = <<"he11o wor1d">>,
    ?assertEqual(Expected, lesson2_task10:replace_chars(Text)).

%% Тести для одинадцятого завдання: Пошук слова
test_find_word() ->
    BinText = <<"The quick brown fox">>,
    ?assertEqual(true, lesson2_task11:find_word(BinText, <<"fox">>)),
    ?assertEqual(false, lesson2_task11:find_word(BinText, <<"dog">>)).

%% Тести для дванадцятого завдання: Рахуємо кількість кожного символу
test_char_count() ->
    Text = <<"abbccc">>,
    Expected = #{<<"a">> => 1, <<"b">> => 2, <<"c">> => 3},
    ?assertEqual(Expected, lesson2_task12:count_chars(Text)).

%% Тести для тринадцятого завдання: Перевернути рядок
test_reverse_string() ->
    Text = <<"hello">>,
    Expected = <<"olleh">>,
    ?assertEqual(Expected, lesson2_task13:reverse_string(Text)).

%% Тести для чотирнадцятого завдання: Перевірка на паліндром
test_is_palindrome() ->
    ?assertEqual(true, lesson2_task14:is_palindrome(<<"level">>)),
    ?assertEqual(false, lesson2_task14:is_palindrome(<<"world">>)).

%% Тести для п'ятнадцятого завдання: Привести до верхнього регістру
test_upper_case() ->
    Text = <<"hello world">>,
    Expected = <<"HELLO WORLD">>,
    ?assertEqual(Expected, lesson2_task15:to_upper_case(Text)).
