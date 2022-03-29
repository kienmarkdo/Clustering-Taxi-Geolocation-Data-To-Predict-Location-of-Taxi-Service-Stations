/*
Nom / Name             : Kien Do
Cours / Course         : CSI2520 - Paradigmes de programmation / Programming Paradigms
Professeur / Professor : Robert Laganière, uottawa.ca
Session / Semester     : Hiver 2022 / Winter 2022
Projet / Project       : Merging DBSCAN-Clustered Taxi Geolocation Partitions
*/

/* ==============  Import partition files  ============== */
import :-
    csv_read_file('partition65.csv', Data65, [functor(partition)]), maplist(assert, Data65),
    csv_read_file('partition74.csv', Data74, [functor(partition)]), maplist(assert, Data74),
    csv_read_file('partition75.csv', Data75, [functor(partition)]), maplist(assert, Data75),
    csv_read_file('partition76.csv', Data76, [functor(partition)]), maplist(assert, Data76),
    csv_read_file('partition84.csv', Data84, [functor(partition)]), maplist(assert, Data84),
    csv_read_file('partition85.csv', Data85, [functor(partition)]), maplist(assert, Data85),
    csv_read_file('partition86.csv', Data86, [functor(partition)]), maplist(assert, Data86)
    % listing(partition) % partition(PARTITION_ID, POINT_ID, X, Y, CLUSTER_ID)
.




% relabel/4
% relabels the points of cluster OldClusterID with label NewClusterID
% relabel(OldClusterID, NewClusterID, ClusterListIN, ClusterListOut)
relabel(_, _, [], []) :- !.
relabel(OldClusterID, NewClusterID, [[P, X, Y, OldClusterID]|T], Result) :-
    relabel(OldClusterID, NewClusterID, T, RR),
    insert([P, X, Y, NewClusterID], RR, Result),
    !
.

relabel(OldClusterID, NewClusterID, [[P, X, Y, NoChange]|T], Result) :-
    relabel(OldClusterID, NewClusterID, T, RR),
    insert([P, X, Y, NoChange], RR, Result),
    !
.
% relabel END

% insert/2
% insert item in front of a list
% insert(NewElement, List, NewList)
insert(A, L, [A|L]).

