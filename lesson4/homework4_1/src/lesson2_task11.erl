-module(lesson2_task11).
-export([encode_modified/1]).

encode_modified(List) ->
    Packed = lesson2_task09:pack(List),
    encode_modified_packed(Packed).

encode_modified_packed([]) -> [];
encode_modified_packed([[H]] = Group) -> [H | encode_modified_packed(tl(Group))];
encode_modified_packed([[H|T]|Rest]) -> [{length([H|T]), H} | encode_modified_packed(Rest)].