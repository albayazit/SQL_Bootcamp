WITH Orders AS (
    SELECT 
        p.name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM 
        person_order po
    JOIN 
        menu m ON po.menu_id = m.id
    JOIN 
        pizzeria p ON m.pizzeria_id = p.id
    GROUP BY 
        p.name
    ORDER BY 
        count DESC
    LIMIT 3
),
Visits AS (
    SELECT 
        p.name,
        COUNT(*) AS count,
        'visit' AS action_type
    FROM 
        person_visits pv
    JOIN 
        pizzeria p ON pv.pizzeria_id = p.id
    GROUP BY 
        p.name
    ORDER BY 
        count DESC
    LIMIT 3
)
SELECT * FROM Orders
UNION ALL
SELECT * FROM Visits
ORDER BY 
    action_type ASC,
    count DESC;
    