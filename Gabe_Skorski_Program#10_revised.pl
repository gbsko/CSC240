%gabe_skorski_geneology_knowledge_base_program#10
%source_https://en.wikipedia.org/wiki/English_monarchs%27_family_tree#House_of_Plantagenet

%male(<name>).
male(geoffrey_plantagenet).
male(geoffrey_count_of_nantes).
male(henry_ii).
male(william_x_of_poitou).
male(geoffrey_ii_duke_of_brittany).
male(william_ix_count_of_poitiers).
male(henry_duke_of_normandy).
male(richard_i_lionheart).
male(john_lackland).
male(william_ii_of_sicily).
male(arthur_i_duke_of_brittany).
male(bohemond_duke_of_apulia).
male(henry_iii).
male(richard_i_earl_of_cornwall).


%female(<name>).
female(matilda).
female(eleanor_of_aquitaine).
female(constance_duchess_of_brittany).
female(matilda_of_england).
female(eleanor_of_england).
female(joan_of_england).
female(isabella_of_angouleme).
female(eleanor_of_brittany).
female(matilda_of_brittany).
female(eleanor_of_england_ii).
female(joan_of_england_ii).
female(isabella_of_england).


%lifespan(<name>, <birth_year>, <death_year>).
lifespan(geoffrey_plantagenet, 1113, 1151).
lifespan(geoffrey_count_of_nantes, 1134, 1158).
lifespan(henry_ii, 1133, 1189).
lifespan(william_x_of_poitou, 1136, 1163).
lifespan(geoffrey_ii_duke_of_brittany, 1158, 1186).
lifespan(william_ix_count_of_poitiers, 1153, 1156).
lifespan(henry_duke_of_normandy, 1155, 1183).
lifespan(richard_i_lionheart, 1157, 1199).
lifespan(john_lackland, 1166, 1216).
lifespan(william_ii_of_sicily, 1155, 1189).
lifespan(arthur_i_duke_of_brittany, 1187, 1203).
lifespan(bohemond_duke_of_apulia, 1181, 1181).
lifespan(henry_iii, 1207, 1272).
lifespan(richard_i_earl_of_cornwall, 1209, 1272).
lifespan(matilda, 1102, 1167).
lifespan(eleanor_of_aquitaine, 1122, 1204).
lifespan(constance_duchess_of_brittany, 1161, 1201).
lifespan(matilda_of_england, 1156, 1189).
lifespan(eleanor_of_england, 1162, 1214).
lifespan(joan_of_england, 1165, 1199).
lifespan(isabella_of_angouleme, 1188, 1246).
lifespan(eleanor_of_brittany, 1184, 1241).
lifespan(matilda_of_brittany, 1185, 1188).
lifespan(eleanor_of_england_ii, 1215, 1275).
lifespan(joan_of_england_ii, 1210, 1238).
lifespan(isabella_of_england, 1214, 1241).


%parentOf(<parents_name>, <childs_name>).
parentOf(geoffrey_plantagenet, geoffrey_count_of_nantes).
parentOf(geoffrey_plantagenet, henry_ii).
parentOf(geoffrey_plantagenet, william_x_of_poitou).

parentOf(matilda, geoffrey_count_of_nantes).
parentOf(matilda, henry_ii).
parentOf(matilda, william_x_of_poitou).

parentOf(henry_ii, geoffrey_ii_duke_of_brittany).
parentOf(henry_ii, matilda_of_england).
parentOf(henry_ii, eleanor_of_england).
parentOf(henry_ii, joan_of_england).
parentOf(henry_ii, william_ix_count_of_poitiers).
parentOf(henry_ii, henry_duke_of_normandy).
parentOf(henry_ii, richard_i_lionheart).
parentOf(henry_ii, john_lackland).

parentOf(eleanor_of_aquitaine, geoffrey_ii_duke_of_brittany).
parentOf(eleanor_of_aquitaine, matilda_of_england).
parentOf(eleanor_of_aquitaine, eleanor_of_england).
parentOf(eleanor_of_aquitaine, joan_of_england).
parentOf(eleanor_of_aquitaine, william_ix_count_of_poitiers).
parentOf(eleanor_of_aquitaine, henry_duke_of_normandy).
parentOf(eleanor_of_aquitaine, richard_i_lionheart).
parentOf(eleanor_of_aquitaine, john_lackland).

parentOf(geoffrey_ii_duke_of_brittany, eleanor_of_brittany).
parentOf(geoffrey_ii_duke_of_brittany, matilda_of_brittany).
parentOf(geoffrey_ii_duke_of_brittany, arthur_i_duke_of_brittany).

parentOf(constance_duchess_of_brittany, eleanor_of_brittany).
parentOf(constance_duchess_of_brittany, matilda_of_brittany).
parentOf(constance_duchess_of_brittany, arthur_i_duke_of_brittany).

parentOf(william_ii_of_sicily, bohemond_duke_of_apulia).

parentOf(joan_of_england, bohemond_duke_of_apulia).

parentOf(john_lackland, henry_iii).
parentOf(john_lackland, eleanor_of_england_ii).
parentOf(john_lackland, richard_i_earl_of_cornwall).
parentOf(john_lackland, joan_of_england_ii).
parentOf(john_lackland, isabella_of_england).

parentOf(isabella_of_angouleme, henry_iii).
parentOf(isabella_of_angouleme, eleanor_of_england_ii).
parentOf(isabella_of_angouleme, richard_i_earl_of_cornwall).
parentOf(isabella_of_angouleme, joan_of_england_ii).
parentOf(isabella_of_angouleme, isabella_of_england).


%rulerOf(<rulers_name>, <countrys_name>, <year_began>, <year_ended>).
rulerOf(henry_ii, england, 1154, 1189).
rulerOf(richard_i_lionheart, england, 1189, 1199).
rulerOf(john_lackland, england, 1199, 1216).
rulerOf(henry_iii, england, 1216, 1272).
