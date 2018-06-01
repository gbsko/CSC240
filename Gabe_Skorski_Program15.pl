% Gabe Skorski Program#15 The Quest - Finite State Game

% assign state that will start the program

start_state(home).

% define edges of the finite state diagram

next_state(home, a, study).
next_state(home, b, netflix).
next_state(home, c, get_food).

next_state(netflix, a, study).
next_state(netflix, b, netflix).
next_state(netflix, c, get_food).

next_state(get_food, a, study).
next_state(get_food, b, netflix).
next_state(get_food, c, bar).

next_state(bar, a, study).
next_state(bar, b, netflix).
next_state(bar, c, overslept).

% code to be executed at the beginning

display_intro :-
	write('It is that time of the year again, the end of the semester. You are'), nl,
	write('at home, contemplating what to do. The semester has worn you down, '),nl,
	write('and while you do not feel like being productive and would rather do'),nl,
	write('something fun instead, you have got to study up for Professor Simms'),nl,
	write('CSC final exam that just happens to be tomorrow. Your choices here will'),nl,
	write('impact not only your exam score, but your social life as well.'),nl,
	write('Choose wisely...'),nl,nl.




initialize :-
	asserta(stored_answer(moves,0)),
	asserta(stored_answer(friends, 0)),
	asserta(stored_answer(score, 0)).

% code to be executed at the end
goodbye :-
	write('Lets see how well you did...'),nl,
	stored_answer(moves, Count),
	write('You made this many choices: '),
	write( Count ), nl,
	stored_answer(friends, Amount),
	write('You have this many friends: '),
	write( Amount ), nl,
	stored_answer(score, Missed),
	write('And you missed this many points on the exam: '),
	write( Missed ), nl,
	write('Have a nice day!'), nl.

% code to be executed upon reaching each state

show_state(home) :-
	write('You are at home staring at your closed notebook, thinking whether'), nl,
	write('or not to have a little fun before getting started studying. On'),nl,
	write('the other hand you have been bingeing that awesome new show on Netflix'),nl,
	write('and one episode really could not hurt. Also you did get that text from'),nl,
	write('a new acquaintance asking to grab a bite to eat, and you are feeling a bit'),nl,
	write('peckish.'),nl,
	write('What do you want to do?'), nl,
	write('(a) Might as well not procrastinate and get to studying.'), nl,
	write('(b) Lets put that monthly Netflix subscription to use.'), nl,
	write('(c) Cannot study on an empty stomach, get food first.'), nl,
	write('(q) QUIT'), nl.

show_state(netflix) :-
	write('Wow what a great episode! And there is still plenty more left in this'), nl,
	write('season as well! But the books are beckoning and look at the time, when was'),nl,
	write('the last time you ate anything? You could go grab a bite with a friend.'),nl,
	write('What do you want to do?'), nl,
	write('(a) Okay, now it is time to study.'), nl,
	write('(b) Just one more episode.'), nl,
	write('(c) Gotta satisfy the hunger, go get food.'), nl,
	write('(q) QUIT'), nl.

show_state(get_food) :-
		write('Yay! Going out to eat with friends is always a great time! It is starting to'), nl,
	write('get later in the day though, and your buddy suggests going out for drinks'),nl,
	write('on Mill Avenue and meeting up with some new friends. While it would be nice '),nl,
	write('to grow your network, it would also be nice to do well on the exam. Then again'),nl,
	write('you are still bored so maybe head home for some Netflix before studying.'),nl,
	write('What do you want to do?'), nl,
	write('(a) Lets brush up for the exam.'), nl,
	write('(b) Yeah, one more episode and then study.'), nl,
	write('(c) Being a recluse is no fun, I will hit the bar.'), nl,
	write('(q) QUIT'), nl.

show_state(bar) :-
	write('Wow that was awesome! What an excellent group of people, these are friends for'), nl,
	write('life. However if you want to get anything done today it is best to stop early.'),nl,
	write('After all, you will have to pay for an Uber home if you drink any more. But there'),nl,
	write('are more people coming, the party is just getting started, and who knows, at this'),nl,
	write('rate maybe you will find the love of your life! Is it not a fair price to pay to'),nl,
	write('get a low score on your exam for true and everlasting love? Who knows, but someone'),nl,
	write('keeps bringing up your favorite show and dang it would be great to also go home'),nl,
	write('and log a few more episodes before hitting the books.'),nl,
	write('What do you want to do?'), nl,
	write('(a) Time to put my foot down, I need to study.'), nl,
	write('(b) I want to see how this season ends now, lets watch Netflix.'), nl,
	write('(c) Lets roll the dice and keep drinking, this might be the best night ever.'), nl,
	write('(q) QUIT'), nl.

% final states, display no menu, automatically quit

show_state(study) :-
	write('Wise choice. You really should not be cramming this last minute but'),nl,
	write('it definitely will not hurt either. Now where is that darn check sheet'),nl,
	write('with all the topics covered. Ah! There it is. Time to put the nose to the'),nl,
	write('grindstone.'),nl.

show_state(overslept) :-
	write('CATASTROPHE. No fully grown mammal on planet Earth should ever attempt to drink'), nl,
	write('so much alcohol. It does not help that you tried to go and show off to who'),nl,
	write('you thought was the love of your life. That is just the alcohol talking! There'),nl,
	write('were no sparks there to begin with! How embarrassing, you have also gone and'),nl,
	write('made a fool of yourself in front of your friends and said some things you probably'),nl,
	write('should not have. They will not talk to you anymore and have told others what you have'),nl,
	write('been saying about them as well. This does not look good. The sun is already up and'),nl,
	write('after your $50 Uber ride home you are just getting to bed and did not study a single'),nl,
	write('thing for the exam thats in 5 hours...'),nl.

get_choice(overslept, q).
get_choice(study, q).

% code to be executed for each choice of action from each state

show_transition(home, a) :-
	write('Okay lets hit the books.'), nl.

show_transition(home, b) :-
	write('Time to continue bingeing that show.'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 5,
	asserta(stored_answer(score,NewMissed)).

show_transition(home, c) :-
	write('Time to eat!'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 10,
	asserta(stored_answer(score,NewMissed)),
	stored_answer(friends, Amount),
	retract(stored_answer(friends,_)),
	NewAmount is Amount + 1,
	asserta(stored_answer(friends,NewAmount)).


show_transition(netflix, a) :-
	write('Okay lets hit the books.'), nl.

show_transition(netflix, b) :-
	write('I guess one more episode would not hurt.'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 5,
	asserta(stored_answer(score,NewMissed)).

show_transition(netflix, c) :-
	write('Time to satisfy the hunger...'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 10,
	asserta(stored_answer(score,NewMissed)),
	stored_answer(friends, Amount),
	retract(stored_answer(friends,_)),
	NewAmount is Amount + 1,
	asserta(stored_answer(friends,NewAmount)).


show_transition(get_food, a) :-
	write('Okay lets hit the books.'), nl.

show_transition(get_food, b) :-
	write('Time to continue bingeing that show.'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 5,
	asserta(stored_answer(score,NewMissed)).

show_transition(get_food, c) :-
	write('I guess a drink would not hurt...'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 20,
	asserta(stored_answer(score,NewMissed)),
	stored_answer(friends, Amount),
	retract(stored_answer(friends,_)),
	NewAmount is Amount + 2,
	asserta(stored_answer(friends,NewAmount)).


show_transition(bar, a) :-
	write('Okay lets FINALLY hit the books.'), nl.

show_transition(bar, b) :-
	write('Time to continue bingeing that show.'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 5,
	asserta(stored_answer(score,NewMissed)).

show_transition(bar, c) :-
	write('You have overdone yourself!'), nl,
	stored_answer(score, Missed),
	retract(stored_answer(score,_)),
	NewMissed is Missed - 50,
	asserta(stored_answer(score,NewMissed)),
	stored_answer(friends, Amount),
	retract(stored_answer(friends,_)),
	NewAmount is Amount - 10,
	asserta(stored_answer(friends,NewAmount)).


show_transition(home, fail):-
	write('a, b , c, or q'), nl.
show_transition(netflix, fail):-
	write('a, b , c, or q'), nl.
show_transition(get_food, fail):-
	write('a, b , c, or q'), nl.
show_transition(bar, fail):-
	write('a, b , c, or q'), nl.



% basic finite state machine engine

go :-
	intro,
	start_state(X),
	show_state(X),
	get_choice(X,Y),
	go_to_next_state(X,Y).

intro :-
	display_intro,
	clear_stored_answers,
	initialize.

go_to_next_state(_,q) :-
	goodbye,!.

go_to_next_state(S1,Cin) :-
	next_state(S1,Cin,S2),
	show_transition(S1,Cin),
	show_state(S2),
	stored_answer(moves,K),
	OneMoreMove is K + 1,
	retract(stored_answer(moves,_)),
	asserta(stored_answer(moves,OneMoreMove)),
	get_choice(S2,Cnew),
	go_to_next_state(S2,Cnew).

go_to_next_state(S1,Cin) :-
	\+ next_state(S1,Cin,_),
	show_transition(S1,fail),
	get_choice(S1,Cnew),
	go_to_next_state(S1,Cnew).

get_choice(_,C) :-
    write('Next entry (letter followed by a period)? '),
    read(C).

% case knowledge base - user responses

:- dynamic(stored_answer/2).

% procedure to get rid of previous responses
% without abolishing the dynamic declaration

clear_stored_answers :- retract(stored_answer(_,_)),fail.
clear_stored_answers.

