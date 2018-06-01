%Gabe Skorski Program #12 - Prolog Rules

motherOf(Mother, Child):-female(Mother), parentOf(Mother,Child).

fatherOf(Father, Child):-male(Father), parentOf(Father,Child).

daughterOf(Daughter, Parent):- female(Daughter), parentOf(Parent,Daughter).

sonOf(Son, Parent):- male(Son), parentOf(Parent,Son).

brotherOf(Brother, Sibling):-
male(Brother), motherOf(Mother, Brother), fatherOf(Father, Brother),
motherOf(Mother, Sibling),fatherOf(Father, Sibling), \+ Brother = Sibling.

sisterOf(Sister, Sibling):-
female(Sister),motherOf(Mother, Sister), fatherOf(Father, Sister),
motherOf(Mother, Sibling),fatherOf(Father, Sibling),\+ Sister = Sibling.

siblingOf(Sibling1, Sibling2):-
motherOf(Mother, Sibling1),fatherOf(Father, Sibling1),motherOf(Mother, Sibling2),
fatherOf(Father, Sibling2),\+ Sibling1 = Sibling2.

auntOf(Aunt, Nibling):-
sisterOf(Aunt, Parent), parentOf(Parent,Nibling).

uncleOf(Uncle, Nibling):-
brotherOf(Uncle, Parent), parentOf(Parent,Nibling).

grandParentOf(Grandparent, Grandchild):-
parentOf(Grandparent,Parent),parentOf(Parent,Grandchild).

descendentOf(Ancestor, Descendent):-
    parentOf(Ancestor, Descendent);
    parentOf(Ancestor, Child),
    descendentOf(Child, Descendent).

ancestorOf(Descendent, Ancestor):-
    parentOf(Ancestor, Descendent);
    parentOf(Parent, Descendent),
    ancestorOf(Parent, Ancestor).

contemporaryOf(Person, Contemporary):-
    lifespan(Person, A,B),
    lifespan(Contemporary, C, D),
    A >= C,
    B =< D,
    \+ Person = Contemporary.

successorOf(Ruler, Next):-
    rulerOf(Ruler,_,_,B),
    rulerOf(Next,_,C,_),
    B = C.





