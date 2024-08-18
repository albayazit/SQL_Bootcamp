SELECT 
    p.address,
    pi.name AS name,
    COUNT(po.id) AS count_of_orders
FROM 
    person p
JOIN 
    person_order po ON p.id = po.person_id
JOIN 
    menu m ON po.menu_id = m.id
JOIN 
    pizzeria pi ON m.pizzeria_id = pi.id
WHERE 
    p.address = (SELECT address FROM person WHERE id = po.person_id)
GROUP BY 
    p.address, pi.name
ORDER BY 
    p.address ASC,
    pi.name ASC;
    