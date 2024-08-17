CREATE TABLE person_discounts (
    id SERIAL PRIMARY KEY, -- первичный ключ, SERIAL - тип данных для идентификаторов
    person_id INTEGER NOT NULL,
    pizzeria_id INTEGER NOT NULL,
    discount NUMERIC(5, 2) NOT NULL, -- Позволяет хранить дрбные числа с двумя знаками после запятой и до 5 цифр
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id), -- Внешний ключ person_id, связанный с person(id)
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id) -- Внешний ключ pizzeria_id, связанный с pizzeria(id)
);

-- SELECT * FROM person_discounts