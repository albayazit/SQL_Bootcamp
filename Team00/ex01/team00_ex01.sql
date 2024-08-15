WITH RECURSIVE tours AS (
    SELECT -- Инициализация
        point1 AS path,
        point1 AS current_city,
        0 AS total_cost,
        1 AS city_count
    FROM 
        city_paths 
    WHERE 
        point1 = 'a'
    
    UNION ALL -- Рекурсивная часть
    
    SELECT 
        CONCAT(tours.path, ',', cp.point2) AS path,
        cp.point2 AS current_city,
        tours.total_cost + cp.cost AS total_cost,
        tours.city_count + 1 AS city_count
    FROM 
        tours
    JOIN 
        city_paths AS cp ON tours.current_city = cp.point1
    WHERE 
        POSITION(cp.point2 IN tours.path) = 0
),
min_max_cost AS 
(
    SELECT 
        MIN(total_cost + cp.cost) AS min_total_cost, 
        MAX(total_cost + cp.cost) AS max_total_cost
    FROM 
        tours
    JOIN 
        city_paths AS cp ON tours.current_city = cp.point1
    WHERE 
        cp.point2 = 'a' 
        AND tours.city_count = 4
)
SELECT DISTINCT
    total_cost + cp.cost AS total_cost,
    CONCAT('{', path, ',a}') AS tour
FROM 
    tours
JOIN 
    city_paths AS cp ON tours.current_city = cp.point1
JOIN 
    min_max_cost ON total_cost + cp.cost = min_max_cost.min_total_cost 
               OR total_cost + cp.cost = min_max_cost.max_total_cost
WHERE 
    cp.point2 = 'a'
    AND tours.city_count = 4
ORDER BY 
    total_cost, tour;
