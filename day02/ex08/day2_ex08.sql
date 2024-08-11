SELECT per.name
FROM person_order AS po
JOIN menu AS m ON m.id = po.menu_id
JOIN person AS per ON per.id = po.person_id
WHERE 
    per.gender = 'male' AND
    (address = 'Moscow' OR address = 'Samara') AND 
    (m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
ORDER BY name DESC;