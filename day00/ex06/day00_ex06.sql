SELECT
	(SELECT name FROM person WHERE person.id = o.person_id)
AS NAME,
	CASE
		WHEN (SELECT name FROM person WHERE person.id = o.person_id) = 'Denis' THEN true ELSE false END AS check_name
FROM person_order o
WHERE (o.menu_id = 13 OR o.menu_id = 14 OR o.menu_id = 18)
	AND o.order_date = '2022-01-07'
ORDER BY NAME ASC;