breadth_first( Start, Goal):- 
	Start \== Goal,
	bfs( Goal, [[Start]]).

consed(A,B,[B|A]).

bfs(Goal, [Visited|Rest]) :-                     % take one from front
    Visited = [Start|_],            
    findall(X,
        (connected2(X,Start,Goal),not(member(X,Visited))), 
        [T|Extend]),
	reverse(Visited,Reversed),
	write(Reversed),nl,
	not(member(Goal,[T|Extend])),
    maplist( consed(Visited), [T|Extend], VisitedExtended),      % make many
    append(Rest, VisitedExtended, UpdatedQueue),       % put them at the end
    bfs( Goal, UpdatedQueue ).

	
connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 +2, B is Y1 +1,
	not(isGoal((A,B),Goal)),
    checkCell((A,B)).

connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 +1, B is Y1 +2,
	not(isGoal((A,B),Goal)),
    checkCell((A,B)).

connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 +2, B is Y1 -1,
	not(isGoal((A,B),Goal)),
    checkCell((A,B)).

connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 +1, B is Y1 -2,
	not(isGoal((A,B),Goal)),
    checkCell((A,B)).

connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 -2, B is Y1 +1,
	not(isGoal((A,B),Goal)),
    checkCell((A,B)).

connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 -1, B is Y1 +2,
	not(isGoal((A,B),Goal)),
    checkCell((A,B)).	
	
connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 -2, B is Y1 -1,
	not(isGoal((A,B),Goal)), 
    checkCell((A,B)).

connected2((A,B),(X1,Y1),Goal) :- 
    A is X1 -1, B is Y1 -2,
	not(isGoal((A,B),Goal)), 
    checkCell((A,B)).

isGoal((A,B),(G1,G2)) :- 
	A == G1, 
	B == G2, 
	write('Goal reached!'), nl,
	write((G1,G2)),
	false.


checkCell((A,B)) :- checkCell1(A), checkCell1(B).
checkCell1(X) :- 1 =< X, X =< 8.

% mat kohen exe statistics(runtime,X).