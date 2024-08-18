-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 4.6 WHERE name = 'Pizza Hut';

-- Session 2
BEGIN;
UPDATE pizzeria SET rating = 4.1 WHERE name = 'Pizza Hut';

-- Session 1
UPDATE pizzeria SET rating = 4.1 WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 4.6 WHERE name = 'Pizza Hut';

-- Session 1 / Session 2
ROLLBACK;