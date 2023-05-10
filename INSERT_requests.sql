insert into musicalgenre (id, name)
values
(1, 'rock'),
(2, 'metal'),
(3, 'blues'),
(4, 'hip-hop'),
(5, 'punk'),
(6, 'pop');

insert into musicant (id, name)
values
(1, 'Sum41'),
(2, 'Avantasia'),
(3, 'Nightwish'),
(4, 'The Beatles'),
(5, 'Eminem');

insert into genremusicantlink (id, genreid, musicantid)
values
(1, 1, 1),
(2, 5, 1),
(3, 1, 2),
(4, 2, 2),
(5, 1, 3),
(6, 2, 3),
(7, 1, 4),
(8, 3, 4),
(9, 4, 5);

insert into album (id, name, issue_year)
values
(1, 'album1', 2015),
(2, 'album2', 2018),
(3, 'album3', 2019),
(4, 'album4', 2020),
(5, 'album5', 2021);

insert into musicantalbumlink (id, albumid, musicantid)
values
(1, 1, 1),
(2, 1, 5),
(3, 2, 2),
(4, 2, 3),
(5, 3, 4),
(6, 4, 1),
(7, 4, 2),
(8, 4, 3),
(9, 5, 5);

insert into songbook (id, name, issue_year)
values
(1, 'songbook1', 2012),
(2, 'songbook2', 2018),
(3, 'songbook3', 2020),
(4, 'songbook4', 2020),
(5, 'songbook5', 2022);

insert into tracks (id, name, duration, albumid)
values
(1, 'Check myself', 200, 2),
(2, 'My', 250, 1),
(3, 'Мой дом', 150, 1),
(4, 'Мойщик окон', 300, 2),
(5, 'Track1', 210, 3),
(6, 'Track 2', 150, 3),
(7, 'And my double check', 411, 4),
(8, 'Track 3', 311, 3),
(9, 'Track 4', 209, 4);

insert into songbooktracklink (id, trackid, songbookid)
values
(1, 1, 1),
(2, 1, 2),
(3, 5, 3),
(4, 6, 4),
(5, 2, 3),
(6, 4, 4),
(7, 7, 1),
(8, 2, 4),
(9, 1, 3);

