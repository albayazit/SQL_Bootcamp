-- person_id не NULL
ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_person_id
CHECK (person_id IS NOT NULL);

-- pizzeria_id не NULL
ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_pizzeria_id
CHECK (pizzeria_id IS NOT NULL);

-- Значение по умолчанию для discount и NOT NULL
ALTER TABLE person_discounts
ALTER COLUMN discount SET DEFAULT 0;

ALTER TABLE person_discounts
ALTER COLUMN discount SET NOT NULL;

-- discount от 0 до 100
ALTER TABLE person_discounts
ADD CONSTRAINT ch_range_discount
CHECK (discount >= 0 AND discount <= 100);
