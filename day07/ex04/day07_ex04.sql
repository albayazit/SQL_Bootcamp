SELECT 
    p.name,
    COUNT(pv.id) AS count_of_visits
FROM 
    person_visits pv
JOIN 
    person p ON pv.person_id = p.id
GROUP BY 
    p.name
HAVING -- фильтрация групп, созданных через GROUP BY 
    COUNT(pv.id) > 3
ORDER BY 
    count_of_visits DESC, 
    p.name ASC;
