-module(lesson2_task10).
-export([encode/1]).

encode(List) ->
    Packed = lesson2_task09:pack(List),
    encode_packed(Packed).

encode_packed([]) -> [];
encode_packed([[H|T]|Rest]) -> [{length([H|T]), H} | encode_packed(Rest)].