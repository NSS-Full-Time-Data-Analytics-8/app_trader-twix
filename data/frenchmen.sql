select *
from winter_games
where year = '2014-01-01' and gold =1
and country_id = 67

select sum(nobel_prize_winners) as sum_nobel, country_id
from country_stats
group by country_id
order by sum_nobel DESC

select id, country
from countries

select id, name
from athletes
where id = 36512