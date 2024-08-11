SELECT piz.name AS pizzeria_name
FROM person_visits AS pv
JOIN person p ON p.id = pv.person_id
JOIN menu m ON m.pizzeria_id = pv.pizzeria_id
JOIN pizzeria piz ON piz.id = pv.pizzeria_id
WHERE p.name = 'Dmitriy' AND m.price < 800 AND pv.visit_date = '2022-01-08'
ORDER BY pizzeria_name;