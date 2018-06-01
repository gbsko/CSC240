% Gabe Skorski Program #13
% Music genre identifier expert system - main controls

go  :-
	intro,
	write( 'Answer all questions y for yes or n for no.'), nl,
	clear_stored_answers,
	try_all_possibilities.

try_all_possibilities :-
	may_be(D),
	explain(D),
	fail.

try_all_possibilities.

:- dynamic(stored_answer/2).

clear_stored_answers :- retract(stored_answer(_,_)),fail.
clear_stored_answers.

user_says(Q,A) :- stored_answer(Q,A).

user_says(Q,A) :-
	\+ stored_answer(Q,_),
	nl, nl,
	ask_question(Q),
	get_yes_or_no(Response),
	asserta(stored_answer(Q, Response)),
	Response = A.

% Prompt that obtains a yes or no answer

get_yes_or_no( Result ) :-
	get(Char),	% read a single character
	get0(_),	% consume the return after it
	interpret(Char,Result),
	!.		% cut - only one result

get_yes_or_no( Result ) :-
	nl,
	write('Type y or n'),
	get_yes_or_no( Result ).

interpret(89,yes).	%ASCII 89 = 'Y'
interpret(121,yes).	%ASCII 121 = 'y'
interpret(78,no).	%ASCII 78 = 'N'
interpret(110,no).	%ASCII 110 = 'n'




intro :-
	write('This program broadly categorizes a type of music as 1 of 8 common genres'), nl.


% possibilities


may_be(classical) :-
	user_says(amp,no),
	user_says(rhythm,no).

may_be(jazz) :-
	user_says(amp,no),
	user_says(rhythm,yes),
	user_says(swing,yes).

may_be(funk) :-
	user_says(amp,no),
	user_says(rhythm,yes),
	user_says(swing,no).

may_be(techno) :-
	user_says(amp,yes),
	user_says(synthesized,yes).

may_be(country) :-
	user_says(amp,yes),
	user_says(synthesized,no),
	user_says(southern,yes).

may_be(hip_hop) :-
	user_says(amp,yes),
	user_says(synthesized,no),
	user_says(southern,no),
	user_says(rhyme,yes).

may_be(rock) :-
	user_says(amp,yes),
	user_says(synthesized,no),
	user_says(southern,no),
	user_says(rhyme,no),
	user_says(guitar,yes).

may_be(pop) :-
	user_says(amp,yes),
	user_says(synthesized,no),
	user_says(southern,no),
	user_says(rhyme,no),
	user_says(guitar,no).


% Text of the questions

ask_question(amp) :-
	write('Do most of the instruments need to be amplified?'), nl.

ask_question(swing) :-
	write('Does the music swing?'), nl.

ask_question(synthesized) :-
	write('Does the music rely heavily on synthesized instruments?'), nl.

ask_question(southern) :-
	write('Does the music have a southern flair to it?'), nl.

ask_question(rhyme) :-
	write('Do the vocals rely heavily on rhyming patterns?'), nl.

ask_question(guitar) :-
	write('Does the music prominently feature electric guitars?'), nl.

ask_question(rhythm):-
	write('Does the music feature a rhythm section?'),nl.


% Explanations for the labels

explain(rock) :-
	write('Sounds like Rock music to me!'), nl.

explain(pop) :-
	write('Sounds like Pop music to me!'), nl.

explain(funk) :-
	write('Sounds like Funk music to me!'), nl.

explain(jazz) :-
	write('Sounds like Jazz music to me!'), nl.

explain(techno) :-
	write('Sounds like Techno music to me!'), nl.

explain(hip_hop) :-
	write('Sounds like Hip Hop music to me!'), nl.

explain(classical) :-
	write('Sounds like Classical music to me!'), nl.

explain(country) :-
	write('Sounds like Country music to me!'), nl.

