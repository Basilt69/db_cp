WITH regional_joins AS (
    SELECT md.region_id,
    COUNT(DISTINCT o.name) as total_joins
    FROM dp_cp.membership_data AS md
    LEFT JOIN dp_cp.organisations AS o ON md.organisation_id = o.id
    GROUP BY md.region_id),
	top_regions AS (
	SELECT region_id
	FROM regional_joins
	ORDER BY total_joins DESC
	LIMIT 10)
SELECT region,
     region_id,
	 COUNT(DISTINCT o.name) as rights_received
FROM dp_cp.membership_data md
    LEFT JOIN dp_cp.regions r ON md.region_id = r.id
	LEFT JOIN dp_cp.rights rg ON md.rights_id = rg.id
	LEFT JOIN dp_cp.organisations o ON md.organisation_id = o.id
WHERE region_id IN (SELECT region_id FROM top_regions)
GROUP BY region, region_id;