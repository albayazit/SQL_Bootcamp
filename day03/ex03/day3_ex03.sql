WITH visit_counts AS (
    SELECT 
        pz.name AS pizzeria_name,
        SUM(CASE WHEN ps.gender = 'female' THEN 1 ELSE 0 END) AS female_visits,
        SUM(CASE WHEN ps.gender = 'male' THEN 1 ELSE 0 END) AS male_visits
    FROM 
        person AS ps
    JOIN 
        person_visits AS pv ON ps.id = pv.person_id
    JOIN 
        pizzeria AS pz ON pv.pizzeria_id = pz.id
    GROUP BY 
        pz.name
)
SELECT 
    pizzeria_name
FROM 
    visit_counts
WHERE 
    female_visits > male_visits OR male_visits > female_visits
ORDER BY 
    pizzeria_name;