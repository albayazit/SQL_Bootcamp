SELECT
    p.name AS name,
    m.pizza_name AS pizza_name,
    m.price AS price,
    TRUNC(m.price * (1 - COALESCE(pd.discount, 0) / 100)) AS discount_price, -- TRUNC - удаляет дробную часть
    pz.name AS pizzeria_name
FROM
    person_order AS po
JOIN
    menu AS m ON po.menu_id = m.id
JOIN
    pizzeria AS pz ON m.pizzeria_id = pz.id
JOIN
    person AS p ON po.person_id = p.id
LEFT JOIN
    person_discounts AS pd ON p.id = pd.person_id AND m.pizzeria_id = pd.pizzeria_id
ORDER BY
    p.name, m.pizza_name;