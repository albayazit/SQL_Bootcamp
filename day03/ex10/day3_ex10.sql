INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES
(
    (SELECT MAX(id) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza' AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')),
    '2022-02-24'
),
(
    (SELECT MAX(id) + 1 FROM person_order) + 1,
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza' AND pizzeria_id = (SELECT id FROM pizzeria WHERE name = 'Dominos')),
    '2022-02-24'
);

-- SELECT * FROM person_order WHERE order_date = '2022-02-24';