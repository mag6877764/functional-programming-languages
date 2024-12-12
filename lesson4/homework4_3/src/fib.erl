-module(fib).

fib(N) when N == 0 -> 0;
fib(N) when N == 1 -> 1;
fib(N) -> fib(N, #{}) .

fib(0, Cache) -> 0;
fib(1, Cache) -> 1;
fib(N, Cache) ->
    case maps:get(N, Cache, undefined) of
        undefined ->
            Result = fib(N-1, Cache) + fib(N-2, Cache),
            fib(N-1, maps:put(N, Result, Cache));
        Result -> Result
    end.
