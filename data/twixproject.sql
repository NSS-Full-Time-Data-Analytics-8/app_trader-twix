WITH combined_apps AS (SELECT DISTINCT (name),
					  size_bytes,
					  category,
					  app_store_apps.price AS app_price,
					  app_store_apps.rating AS app_rating,
					  app_store_apps.primary_genre AS genre,
					  play_store_apps.price AS play_price,
					  play_store_apps.rating AS play_rating
					  FROM app_store_apps
					  Inner Join play_store_apps
					  USING (name))
					
SELECT DISTINCT name,
	   ROUND((((((24*(app_rating + play_rating)/2))+12)*4000)-25000),0) AS profit,
	   ROUND((app_rating + play_rating)/2,2) AS combined_rating,
       app_price,
	   play_price,
	   genre
FROM combined_apps
WHERE app_price = '0' AND play_price = '0'
ORDER BY profit DESC
LIMIT 12