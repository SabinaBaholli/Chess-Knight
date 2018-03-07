breadth_first( Start, Goal):- bfs( Goal, [[Start]]).

consed(A,B,[B|A]).

bfs(Goal, [Visited|Rest]) :-                     % take one from front
    Visited = [Start|_],            
    Start \== Goal,
    findall(X,
        (connected2(X,Start,_),not(member(X,Visited))), 
        [T|Extend]),
	write([Goal, Visited]),nl,
	not(member(Goal,[T|Extend])),
    maplist( consed(Visited), [T|Extend], VisitedExtended),      % make many
    append(Rest, VisitedExtended, UpdatedQueue),       % put them at the end
    bfs( Goal, UpdatedQueue ).

	
connected2((A,B),(X1,Y1),_) :- 
    A is X1 +2, B is Y1 +1,
    checkCell((A,B)).

connected2((A,B),(X1,Y1),_) :- 
    A is X1 +1, B is Y1 +2,
    checkCell((A,B)).

connected2((A,B),(X1,Y1),_) :- 
    A is X1 +2, B is Y1 -1,
    checkCell((A,B)).

connected2((A,B),(X1,Y1),_) :- 
    A is X1 +1, B is Y1 -2,
    checkCell((A,B)).

connected2((A,B),(X1,Y1),_) :- 
    A is X1 -2, B is Y1 +1,
    checkCell((A,B)).

connected2((A,B),(X1,Y1),_) :- 
    A is X1 -1, B is Y1 +2,
    checkCell((A,B)).	
	
connected2((A,B),(X1,Y1),_) :- 
    A is X1 -2, B is Y1 -1,
    checkCell((A,B)).

connected2((A,B),(X1,Y1),_) :- 
    A is X1 -1, B is Y1 -2,
    checkCell((A,B)).


checkCell((A,B)) :- checkCell1(A), checkCell1(B).
checkCell1(X) :- 1 =< X, X =< 8.

% mat kohen exe statistics(runtime,X).