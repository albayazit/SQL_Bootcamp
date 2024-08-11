SELECT 
    COALESCE(per.name, '-') AS person_name,
    pv.visit_date,
    COALESCE(piz.name, '-') AS pizzeria_name 
FROM 
    (SELECT *
        FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') pv
FULL JOIN pizzeria piz ON piz.id = pv.pizzeria_id
FULL JOIN person per ON per.id = pv.person_id
ORDER BY
    person_name,
    pizzeria_name,
    pv.visit_date;