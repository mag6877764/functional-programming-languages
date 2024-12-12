-module(lesson2_task15).
-export([replicate/2]).

replicate([], _) -> [];
replicate([H|T], N) -> replicate_elem(H, N) ++ replicate(T, N).

replicate_elem(_, 0) -> [];
replicate_elem(Elem, N) when N > 0 -> [Elem | replicate_elem(Elem, N - 1)].