DROP TABLE IF EXISTS city_paths;

CREATE TABLE city_paths (
    point1 VARCHAR,
    point2 VARCHAR,
    cost INT
);

INSERT INTO city_paths (point1, point2, cost) VALUES
('a', 'b', 10), ('b', 'a', 10),
('a', 'c', 15), ('c', 'a', 15),
('a', 'd', 20), ('d', 'a', 20),
('b', 'c', 35), ('c', 'b', 35),
('b', 'd', 25), ('d', 'b', 25),
('c', 'd', 30), ('d', 'c', 30);

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
    
    UNION -- Рекурсивная часть
    
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
)
SELECT
    total_cost + cp.cost AS total_cost,
    CONCAT('{', path, ',a}') AS tour
FROM 
    tours
JOIN 
    city_paths AS cp ON tours.current_city = cp.point1
WHERE 
    cp.point2 = 'a'
    AND tours.city_count = 4
    AND total_cost + cp.cost = (SELECT MIN(total_cost + cp2.cost)
                                  FROM tours AS t
                                  JOIN city_paths AS cp2 ON t.current_city = cp2.point1
                                  WHERE cp2.point2 = 'a'
                                  AND t.city_count = 4)
ORDER BY 
    total_cost, tour;
