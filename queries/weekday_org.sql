WITH orj as (SELECT EXTRACT(isodow FROM md.date) week_day,
			COUNT(DISTINCT o.name) as total_joins
			FROM dp_cp.organisations as o
			LEFT JOIN dp_cp.membership_data md ON o.id = md.organisation_id
			WHERE date is not null
			GROUP BY week_day
			ORDER BY total_joins DESC)
SELECT total_joins,
    CASE
	    WHEN week_day = 1 THEN 'Понедельник'
		WHEN week_day = 2 THEN 'Вторник'
		WHEN week_day = 3 THEN 'Среда'
		WHEN week_day = 4 THEN 'Четверг'
		WHEN week_day = 5 THEN 'Пятница'
		WHEN week_day = 6 THEN 'Суббота'
		WHEN week_day = 7 THEN 'Воскресенье'
		ELSE 'Неизвестный день'
		END
FROM orj;