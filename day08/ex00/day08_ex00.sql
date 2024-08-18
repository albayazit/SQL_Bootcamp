-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
-- Рейтинг обновлен в транзакции, но еще не подтвержден

-- Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; -- Проверка, что изменения не видны

-- Session 1
COMMIT;

-- Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';