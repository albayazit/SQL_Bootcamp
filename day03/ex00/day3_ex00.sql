SELECT m.pizza_name,
       m.price,
       pz.name AS pizzeria_name,
       pv.visit_date
FROM person ps
JOIN person_visits pv ON ps.id = pv.person_id
JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE ps.name = 'Kate'
  AND m.price BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, pz.name;