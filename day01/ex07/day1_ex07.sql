SELECT
	order_date,
	p.name || ' (age:' || age || ')' AS person_information
FROM person_order po
JOIN
	person p ON po.person_id = p.id
ORDER BY 
    po.order_date ASC, 
    person_information ASC;