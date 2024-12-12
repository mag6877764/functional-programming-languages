-module(lesson2_task12).
-export([decode_modified/1]).

decode_modified([]) -> [];
decode_modified([{Count, Elem} | Rest]) -> lists:duplicate(Count, Elem) ++ decode_modified(Rest);
decode_modified([Elem | Rest]) -> [Elem | decode_modified(Rest)].