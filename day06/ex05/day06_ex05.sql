COMMENT ON TABLE person_discounts IS 'Таблица содержит информацию о персональных скидках для клиентов, применяемых в пиццериях. Каждый клиент может иметь скидку в определённой пиццерии на основе количества заказов.';

-- Комментарий к столбцам
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи скидки. Генерируется автоматически.';

COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, для которого применяется скидка. Ссылается на таблицу person.';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, где применяется скидка. Ссылается на таблицу pizzeria.';

COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки, применяемый к заказам клиента в указанной пиццерии. Значение по умолчанию 0%. Должно быть в пределах от 0 до 100%.';
