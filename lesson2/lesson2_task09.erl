-module(lesson2_task09).
-export([pack/1]).

pack([]) -> [];
pack([H|T]) ->
    {Group, Rest} = span(H, T),
    [Group | pack(Rest)].

span(Elem, []) -> {[Elem], []};
span(Elem, [H|T]) when Elem == H ->
    {Group, Rest} = span(Elem, T),
    {[Elem | Group], Rest};
span(_, List) -> {[], List}.