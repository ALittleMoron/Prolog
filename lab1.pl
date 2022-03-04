male(jack).
male(oliver).
male(ali).
male(james).
male(harry).

female(helen).
female(sophie).
female(jess).
female(lily).
female(ann).
female(kate).
female(linda).
female(vika).

parent(jack, jess).
parent(jack, lily).
parent(helen, jess).
parent(lily, helen).
parent(lily, ann).
parent(ann, kate).
parent(oliver, james).
parent(sophie, james).
parent(jess, simon).
parent(jess, linda).
parent(linda, vika).
parent(ali, simon).
parent(lily, harry).
parent(james, harry).


predecessor(X, Z) :- parent(X, Z), female(Z).
predecessor(X, Z) :- parent(X, Z), female(Z), predecessor(Z, Y), !.

:- initialization(main).
main :- 
    predecessor(X, Z),
        write('Предок - '), write(X), write(', Потомок - '), write(Z), nl,
    fail;
    write('Введите имя предка с потомками женского пола: '), read(Str),
    predecessor(Str, X),
        write('Предок - '), write(Str), write(', Потомок - '), write(X), nl,
    fail.
