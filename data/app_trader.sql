WITH combined_apps AS (SELECT DISTINCT (name),
					  size_bytes,
					  category,
					  app_store_apps.price AS app_price,
					  app_store_apps.rating AS app_rating,
					  app_store_apps.primary_genre AS genre,
					  play_store_apps.rating AS play_rating
					  FROM app_store_apps
					  Inner Join play_store_apps
					  USING (name))
					 
SELECT DISTINCT name, 
	   ROUND((((((24*(app_rating + play_rating)/2))+12)*4000)-25000),0) AS profit,
	   ROUND((app_rating + play_rating)/2,2) AS combined_rating,
       app_price,
	   genre
FROM combined_apps
WHERE app_price = '0'
ORDER BY profit DESC;
--(((((24*(app_rating + play_rating)/2))+12)*4000)-25000)

SELECT DISTINCT name, install_count 
FROM play_store_apps
WHERE install_count <> '0+' and install_count <> '0'
ORDER BY install_count;
--zombie catchers, plants vs. zombies, candy crush saga, candy crush soda saga, seven minute workout challenge

select *
from app_store_apps
WHERE NAME ILIKE '%tuber%'
ORDER BY rating DESC;

select *
from app_store_apps
WHERE NAME ILIKE '%egg%'
ORDER BY rating DESC;

select name, review_count::integer
FROM app_store_apps
where review_count::integer > 100000
ORDER BY review_count DESC;

SELECT DISTINCT app.name, play.install_count, app.review_count AS app_review, play.review_count AS play_review
FROM app_store_apps AS app
LEFT JOIN play_store_apps AS play
ON app.name = play.name
WHERE play.install_count IS NOT NULL
ORDER BY play.install_count DESC;