WITH Orders AS (
    SELECT 
        p.id,
        p.name,
        COUNT(po.id) AS order_count
    FROM 
        pizzeria p
    LEFT JOIN 
        menu m ON p.id = m.pizzeria_id
    LEFT JOIN 
        person_order po ON m.id = po.menu_id
    GROUP BY 
        p.id, p.name
),
Visits AS (
    SELECT 
        p.id,
        p.name,
        COUNT(pv.id) AS visit_count
    FROM 
        pizzeria p
    LEFT JOIN 
        person_visits pv ON p.id = pv.pizzeria_id
    GROUP BY 
        p.id, p.name
)
SELECT 
    p.name,
    COALESCE(o.order_count, 0) + COALESCE(v.visit_count, 0) AS total_count
FROM 
    pizzeria p
LEFT JOIN 
    Orders o ON p.id = o.id
LEFT JOIN 
    Visits v ON p.id = v.id
ORDER BY 
    total_count DESC,
    p.name ASC;