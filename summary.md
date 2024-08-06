# SQL BOOTCAMP

### SELECT
* SELECT - указывает на то, что мы хотим выбрать
* SELECT DISTINCT - выбирает уникальные значения
  
Внутренний запрос позволяет извлечь необходимые данные для внешнего запроса:
```
SELECT
	(SELECT name FROM person WHERE person.id = o.person_id)
AS NAME
```

**||** (или CONCAT) - оператор конкатенации строк. Используется для объединения значений столбцов и строковых литералов.
```
SELECT name || ' age:' || age || 
```
Для добавления ковычек необходимо экранирововать их: `''''`
### FROM
* FROM - указывает таблицу
Можно сокращать названия столбцов (через пробел новые имена):
```
FROM person_order o
```
### WHERE
* WHERE - указываются условия выбора
### ORDER
* ORDER BY - сортирует в алфавитном порядке
* ORDER BY ... DESC - сортирует в порядке убывания
* ORDER BY ... ASC - сортирует в порядке возростания
### CASE
* CASE WHEN ... THEN ... ELSE ... END AS- вычисляет новый столбец, проверяя условие
```
SELECT
	(SELECT name FROM person WHERE person.id = o.person_id)
AS NAME,
	CASE WHEN (SELECT name FROM person WHERE person.id = o.person_id) = 'Denis' THEN true ELSE false END AS check_name
```

### CONSTANTS
* ... AND ... / ... OR ... - логические опреаторы И / ИЛИ
* BETWEEN - выборка между двумя значениями
* ... AS - назначает имя новому вычисляемому полю
* ... * - выбрать все

Можно использовать операторы сравнения (>, <, =, ...).
При этом, следует использовать скобки для выделения блоков.
```
WHERE (visit_date BETWEEN '2022-01-06' AND '2022-01-09')
	OR pizzeria_id = 2
```