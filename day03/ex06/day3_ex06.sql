WITH PizzaPrices AS (
    SELECT
        m.pizza_name,
        pz.name AS pizzeria_name,
        m.price
    FROM
        menu AS m
    JOIN
        pizzeria AS pz ON m.pizzeria_id = pz.id
),
MatchingPizzas AS (
    SELECT
        p1.pizza_name,
        p1.pizzeria_name AS pizzeria_name_1,
        p2.pizzeria_name AS pizzeria_name_2,
        p1.price
    FROM
        PizzaPrices AS p1
    JOIN
        PizzaPrices AS p2 ON p1.pizza_name = p2.pizza_name
                        AND p1.price = p2.price
                        AND p1.pizzeria_name < p2.pizzeria_name
)
SELECT
    pizza_name,
    pizzeria_name_1,
    pizzeria_name_2,
    price
FROM
    MatchingPizzas
ORDER BY
    pizza_name;