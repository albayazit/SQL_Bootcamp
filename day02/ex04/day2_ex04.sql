SELECT m.pizza_name,
    piz.name AS pizzeria_name,
    m.price
FROM 
    (SELECT * FROM menu m
    WHERE m.pizza_name = 'mushroom pizza' OR m.pizza_name = 'pepperoni pizza') m
JOIN pizzeria piz ON piz.id = m.pizzeria_id
ORDER BY m.pizza_name, pizzeria_name;
