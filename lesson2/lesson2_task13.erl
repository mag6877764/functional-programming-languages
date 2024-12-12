-module(lesson2_task13).
-export([decode/1]).

decode([]) -> [];
decode([{Count, Elem} | Rest]) -> lists:duplicate(Count, Elem) ++ decode(Rest).