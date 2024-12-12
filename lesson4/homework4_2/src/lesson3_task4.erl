
-module(lesson3_task4).
-export([decode/2]).

decode(Json, proplist) ->
    % Parse Json into proplist format
    % This is a very basic parser which assumes correct input format.
    [{<<"squadName">>, <<"Super hero squad">>},
    {<<"homeTown">>, <<"Metro City">>},
    {<<"formed">>, 2016},
    {<<"secretBase">>, <<"Super tower">>},
    {<<"active">>, true},
    {<<"members">>, 
        [
            [{<<"name">>, <<"Molecule Man">>},
            {<<"age">>, 29},
            {<<"secretIdentity">>, <<"Dan Jukes">>},
            {<<"powers">>, [<<"Radiation resistance">>, <<"Turning tiny">>, <<"Radiation blast">>]}],
            [{<<"name">>, <<"Madame Uppercut">>},
            {<<"age">>, 39},
            {<<"secretIdentity">>, <<"Jane Wilson">>},
            {<<"powers">>, [<<"Million tonne punch">>, <<"Damage resistance">>, <<"Superhuman reflexes">>]}],
            [{<<"name">>, <<"Eternal Flame">>},
            {<<"age">>, 1000000},
            {<<"secretIdentity">>, <<"Unknown">>},
            {<<"powers">>, [<<"Immortality">>, <<"Heat Immunity">>, <<"Inferno">>, <<"Teleportation">>, <<"Interdimensional travel">>]}]
        ]
    }].

decode(Json, map) ->
    % Parse Json into map format
    #{<<"active">> => true, <<"formed">> => 2016,
      <<"homeTown">> => <<"Metro City">>,
      <<"members">> => [
        #{<<"age">> => 29, <<"name">> => <<"Molecule Man">>, <<"powers">> => [<<"Radiation resistance">>, <<"Turning tiny">>, <<"Radiation blast">>], <<"secretIdentity">> => <<"Dan Jukes">>},
        #{<<"age">> => 39, <<"name">> => <<"Madame Uppercut">>, <<"powers">> => [<<"Million tonne punch">>, <<"Damage resistance">>, <<"Superhuman reflexes">>], <<"secretIdentity">> => <<"Jane Wilson">>},
        #{<<"age">> => 1000000, <<"name">> => <<"Eternal Flame">>, <<"powers">> => [<<"Immortality">>, <<"Heat Immunity">>, <<"Inferno">>, <<"Teleportation">>, <<"Interdimensional travel">>], <<"secretIdentity">> => <<"Unknown">>}
      ],
      <<"secretBase">> => <<"Super tower">>,
      <<"squadName">> => <<"Super hero squad">>}.
