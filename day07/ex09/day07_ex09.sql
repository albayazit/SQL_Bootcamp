SELECT
    address,
    ROUND(MAX(age::NUMERIC) - (MIN(age::NUMERIC) / MAX(age::NUMERIC)), 2) AS formula,
    ROUND(AVG(age::NUMERIC), 2) AS average,
    (SELECT
        CASE WHEN (MAX(age::NUMERIC) - (MIN(age::NUMERIC) / MAX(age::NUMERIC))) > AVG(age::NUMERIC)
                 THEN
                     true
                 ELSE
                    false
             END) AS comparison
FROM person
GROUP BY address
ORDER BY address;