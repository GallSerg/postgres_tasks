-- 2.1
select 
	name,
	duration
from tracks
order by duration desc 
limit 1


-- 2.2 
select 
	name,
	duration
from tracks
where duration >= 3.5 * 60


-- 2.3
select 
	name
from songbook
where issue_year between 2018 and 2020


-- 2.4
select 
	name
from musicant
where name not like '% %'


-- 2.5
select 
	name
from tracks
where lower(name) like 'мой' 
   or lower(name) like 'my' 
   or lower(name) like '% мой'
   or lower(name) like 'мой %'
   or lower(name) like '% my'
   or lower(name) like 'my %'
   or lower(name) like '% мой %'
   or lower(name) like '% my %'
   

-- 3.1
select 
	m.name as genre_name,
	count(*) as musicant_count 
from musicalgenre m
inner join genremusicantlink mg ON m.id = mg.genreid 
group by m.name; 


-- 3.2
select 
	count(*) as track_count
from album a 
inner join musicantalbumlink m on a.id = m.albumid 
where a.issue_year between 2019 and 2020


-- 3.3
select 
	a.name as album_name,
	avg(duration) as avg_duration
from album a 
inner join tracks t on t.albumid = a.id 
group by a.name


-- 3.4
select 
	mus.name
from musicant mus
where mus.name not in 
	(select 
		m.name
	from album a 
	inner join musicantalbumlink ma on a.id = ma.albumid 
	inner join musicant m on m.id = ma.musicantid 
	where a.issue_year = 2020);


-- 3.5
select 
	s.name
from songbook s 
inner join songbooktracklink st on st.songbookid = s.id 
inner join tracks t on t.id = st.trackid 
inner join musicantalbumlink ma on ma.albumid = t.albumid 
inner join musicant m on ma.musicantid = m.id 
where m.name = 'Nightwish'
group by s.name;


-- 4.1
with v_alb as (
select 
	a.name as album_name,
	g.name as genre_quantity
from album a 
inner join musicantalbumlink ma on ma.albumid = a.id 
inner join genremusicantlink mg on mg.musicantid = ma.musicantid 
inner join musicalgenre g on g.id = mg.genreid 
group by a.name, g.id
)
select 
	v.album_name,	
	count(v.genre_quantity) as genre_count
from v_alb v 
group by v.album_name
having count(v.genre_quantity) > 1;


-- 4.2
select 
	t.name
from tracks t 
where t.name not in 
	(select
	 tr.name
	 from tracks tr
	 inner join songbooktracklink st on st.trackid = t.id
	 group by tr.name);

	 
-- 4.3
select	 
	m.name
from musicant m 
inner join musicantalbumlink ma on ma.musicantid = m.id
inner join tracks t on t.albumid = ma.albumid 
where t.duration = (select min(t2.duration) 
					  from tracks t2);


-- 4.4
with v_tracks as (
select
	t.albumid,
	count(*) as tracks_count
from tracks t
group by t.albumid
)
select 
	a.name
from v_tracks v
inner join album a on a.id = v.albumid
where v.tracks_count = (select 
							min(tracks_count) 
						from v_tracks);


