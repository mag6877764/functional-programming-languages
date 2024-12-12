-module(lesson2_task06).
-export([is_palindrome/1]).

is_palindrome(List) -> List == lists:reverse(List).