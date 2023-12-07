reverse_list(In, Out) :-
    reverse_list(In, [], Out).

reverse_list([], Acc, Acc).         % base case
reverse_list([X|XS], Acc, Out) :-   % recursive case
    reverse_list(XS, [X|Acc], Out).

main() :-
    read(InputList),
    reverse_list(InputList, OutputList),
    write(OutputList).
