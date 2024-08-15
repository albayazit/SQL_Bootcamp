CREATE VIEW v_symmetric_union AS
SELECT person_id
FROM (
    SELECT person_id
    FROM person_visits
    WHERE visit_date <= '2022-01-02'
    AND person_id NOT IN (
        SELECT person_id
        FROM person_visits
        WHERE visit_date <= '2022-01-06'
    )
    
    UNION
    
    SELECT person_id
    FROM person_visits
    WHERE visit_date <= '2022-01-06'
    AND person_id NOT IN (
        SELECT person_id
        FROM person_visits
        WHERE visit_date <= '2022-01-02'
    )
) AS symmetric_diff
ORDER BY person_id;

-- SELECT * FROM v_symmetric_union