WITH pizzerias_by_women AS (
    SELECT 
        pz.name AS pizzeria_name
    FROM 
        person AS ps
    JOIN 
        person_order AS po ON ps.id = po.person_id
    JOIN 
        menu AS m ON po.menu_id = m.id
    JOIN 
        pizzeria AS pz ON m.pizzeria_id = pz.id
    WHERE 
        ps.gender = 'female'
    EXCEPT
    SELECT 
        pz.name
    FROM 
        person AS ps
    JOIN 
        person_order AS po ON ps.id = po.person_id
    JOIN 
        menu AS m ON po.menu_id = m.id
    JOIN 
        pizzeria AS pz ON m.pizzeria_id = pz.id
    WHERE 
        ps.gender = 'male'
), pizzerias_by_men AS (
    SELECT 
        pz.name AS pizzeria_name
    FROM 
        person AS ps
    JOIN 
        person_order AS po ON ps.id = po.person_id
    JOIN 
        menu AS m ON po.menu_id = m.id
    JOIN 
        pizzeria AS pz ON m.pizzeria_id = pz.id
    WHERE 
        ps.gender = 'male'
    EXCEPT
    SELECT 
        pz.name
    FROM 
        person AS ps
    JOIN 
        person_order AS po ON ps.id = po.person_id
    JOIN 
        menu AS m ON po.menu_id = m.id
    JOIN 
        pizzeria AS pz ON m.pizzeria_id = pz.id
    WHERE 
        ps.gender = 'female'
)
SELECT 
    pizzeria_name
FROM 
    pizzerias_by_women
UNION
SELECT 
    pizzeria_name
FROM 
    pizzerias_by_men
ORDER BY 
    pizzeria_name;