SELECT p.name
FROM person AS p
JOIN person_order AS po1 ON p.id = po1.person_id
JOIN menu AS m1 ON po1.menu_id = m1.id AND m1.pizza_name = 'pepperoni pizza'
JOIN person_order AS po2 ON p.id = po2.person_id
JOIN menu AS m2 ON po2.menu_id = m2.id AND m2.pizza_name = 'cheese pizza'
WHERE p.gender = 'female'
ORDER BY p.name;