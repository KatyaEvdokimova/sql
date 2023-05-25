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

![Image Alt](https://github.com/KatyaEvdokimova/sql/blob/main/1.PNG)



