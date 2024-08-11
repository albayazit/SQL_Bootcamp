WITH DateSeries AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS all_days
),
VisitedDates AS (
    SELECT DISTINCT visit_date
    FROM person_visits pv
    WHERE person_id = 1 OR person_id = 2
),
AllDays AS (
    SELECT ds.all_days, vd.visit_date
    FROM DateSeries ds
    LEFT JOIN VisitedDates vd ON vd.visit_date = ds.all_days
)
SELECT all_days::date
FROM AllDays
WHERE visit_date IS NULL
ORDER BY all_days;