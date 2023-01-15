WITH intermediaries_1 as(
    SELECT md.intermediary_id,
    COUNT(DISTINCT md.intermediary_id) as total_frequency
    FROM dp_cp.membership_data as md
    GROUP BY md.intermediary_id),
	top_intermediaries as (
	SELECT intermediary_id
	FROM intermediaries_1
	ORDER BY total_frequency DESC
	LIMIT 5)
SELECT i.name
FROM dp_cp.intermediaries AS i
RIGHT JOIN top_intermediaries as ti ON i.id = ti.intermediary_id;