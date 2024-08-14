SELECT pz.name AS pizzeria_name
FROM person_visits AS pv
JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
JOIN person AS p ON pv.person_id = p.id
LEFT JOIN person_order AS po ON po.order_date = pv.visit_date
WHERE p.name = 'Andrey' AND po.person_id is NULL
ORDER BY pizzeria_name;