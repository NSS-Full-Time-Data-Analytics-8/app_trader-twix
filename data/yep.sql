WITH combine_apps AS (SELECT DISTINCT (name),
					  size_bytes,
					  category,
					  app_store_apps.price AS app_price,
					  app_store_apps.rating AS app_rating,
					  app_store_apps.primary_genre AS app_p_genre,
					  app_store_apps.review_count AS app_review,
					  play_store_apps.price AS play_price,
					  play_store_apps.rating AS play_rating,
					  play_store_apps.genres AS play_genres,
					  play_store_apps.review_count AS play_review
					  FROM app_store_apps
					  Inner Join play_store_apps
					  USING (name))
					 
SELECT (app_rating + play_rating)/2 AS combine_rating,
       app_price,
	   app_p_genre,
	   play_price,
	   name
FROM combine_apps
WHERE app_price = '0' AND play_price = 0
ORDER BY combine_rating DESC;

WITH combine_apps AS (SELECT DISTINCT (name),
					  size_bytes,
					  category,
					  app_store_apps.price AS app_price,
					  app_store_apps.rating AS app_rating,
					  app_store_apps.primary_genre AS genre,
					  app_store_apps.review_count AS app_review,
					  play_store_apps.price AS play_price,
					  play_store_apps.rating AS play_rating,
					  play_store_apps.genres AS play_genres,
					  play_store_apps.review_count AS play_review
					  FROM app_store_apps
					  Inner Join play_store_apps
					  USING (name))
					 
SELECT DISTINCT name, 
	   ROUND((app_rating + play_rating)/2,2) AS combined_rating,
       app_price,
	   play_price,
	   genre
FROM combine_apps
ORDER BY combined_rating DESC;

SELECT DISTINCT name, install_count 
FROM play_store_apps
WHERE install_count <> '0+' and install_count <> '0'
ORDER BY install_count 