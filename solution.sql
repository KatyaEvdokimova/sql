1.Сколько медалей выиграл Jesse Owens в 1936?

select count(*) from olimpic_medals where athlete = 'OWENS, Jesse' and edition = 1936

ОТВЕТ:4

2.Какая страна выиграла большинство золотых медалей мужчинами в бадминтоне?

select noc as gold_medals from olimpic_medals
where medal = 'Gold' and sport = 'Badminton' and gender = 'Men'
limit 1

ОТВЕТ: KOR

3.Какие три страны выйграли большинство медалей в последние годы (с 1984 по 2008)?

select noc, count(*) as medal_count from olimpic_medals
where edition >= 1984 and edition <= 2008
group by noc
order by medal_count desc
limit 3

ОТВЕТ:
USA	1837
AUS	762
GER	691
4.Покажите мужчин золотых медалистов по 100m. Выведите результаты по убыванию года выйгрыша. Покажите город в котором проходила олимпиала, год, имя атлета и страну за которую он выступал.

select city,edition,athlete,noc from olimpic_medals 
where medal='Gold' and event_gender='M' and event='100m'
order by edition desc

ОТВЕТ:файл 1.PNG

5.Как много медалей было выйграно мужчинами и женщинами в истории олимпиады. Как много золотых, серебрянных и бронзовых медалей было выйграно каждым полом?

Для золотых медалей у мужчин:
select gender, count(*) as all_of_gold_medals from olimpic_medals 
where medal='Gold' and gender='Men' 
group by gender

Для серебряных медалей у мужчин:
select gender, count(*) as all_of_silver_medals from olimpic_medals 
where medal='Silver' and gender='Men' 
group by gender

Для бронзовых медалей у мужчин:
select gender, count(*) as all_of_bronze_medals from olimpic_medals 
where medal='Bronze' and gender='Men' 
group by gender

Для золотых медалей у женщин:
select gender, count(*) as all_of_gold_medals from olimpic_medals 
where medal='Gold' and gender='Woman' 
group by gender

Для серебряных медалей у женщин:
select gender, count(*) as all_of_silver_medals from olimpic_medals 
where medal='Silver' and gender='Woman' 
group by gender

Для бронзовых медалей у женщин:
select gender, count(*) as all_of_bronze_medals from olimpic_medals 
where medal='Bronze' and gender='Woman' 
group by gender

ОТВЕТ: У мужчин 7365 золотых, 7181 серебряных и 7175 бронзовых медалей. У женщин 2482 золотых, 2496 серебряных и 2514 бронзовых

6.Выведите общее кол-во медалей для каждой олимпиады.

select city, edition, count(*) as all_of_medals from olimpic_medals 
group by city, edition
order by edition desc

ОТВЕТ: файл 2.PNG

7.Создайте список показывающий число всех медалей выйгранных каждой страной в течение всей истории олимпийских игр. Для каждой страны, необходимо показать год первой и последней заработанной медали.

select noc, min(edition) as first_history, max(edition) as last_history, 
count(*) from olimpic_medals 
group by noc
order by noc asc

ОТВЕТ: файл 3.PNG, 4.PNG,5.PNG,6.PNG,7.PNG


8.Атлеты выйгравшие медали в Beijing на дистанции 100m или 200m.

select athlete from olimpic_medals 
where city='Beijing' and (event='100m' or event='200m')

ОТВЕТ: файл 8.PNG

9.Найдите кол-во золотых медалей выйгранных США мужчинами и женщинами в атлетике на каждой олимпиаде.

select city, edition, 
(select count(*) from olimpic_medals where gender = 'Men') as all_of_men_medals,
(select count(*) from olimpic_medals where gender = 'Women' ) as all_of_women_medals from olimpic_medals
where noc = 'USA' and sport = 'Athletics'
group by city, edition
order by edition desc

ОТВЕТ: файл 9.PNG

10.Найдите 5 атлетов которые выйграли большинство золотых медалей.

select athlete, count(*) as all_of_medals from olimpic_medals
where medal = 'Gold' 
group by athlete
order by all_of_medals desc
limit 5


ОТВЕТ:
PHELPS, Michael	14
LATYNINA, Larisa	9
NURMI, Paavo	9
SPITZ, Mark	9
LEWIS, Carl	9

11.Покажите суммарное количество медалей выйгранных странами в последних олимпийских играх.

select noc, count(*) as all_of_medals from olimpic_medals
where edition = '2008' 
group by noc
order by all_of_medals desc

ОТВЕТ: файлы 10.PNG,11.PNG,12.PNG

12.Постройте таблицу в которой по годам всех олимпиад покажите топовых атлетов США(1 атлет на год) по общему количеству медалей. Включите дисциплину атлета.

select distinct on(edition) 
edition, athlete, discipline, count(*) as all_of_medals from olimpic_medals
where noc = 'USA'
group by edition, athlete, discipline
order by edition desc, all_of_medals desc

ОТВЕТ: файл 13.PNG
