SELECT c.name       as customer_name,
       SUM(p.price) as total_sales
FROM db_cp.products p
         LEFT JOIN db_cp.purchases pu ON p.id = pu.product_id
         LEFT JOIN db_cp.customers c ON pu.user_id = c.id
WHERE date is not null
GROUP BY c.name
ORDER BY total_sales desc;

SELECT COUNT(DISTINCT o.name) as total_joins,
    EXTRACT(month from date) as month
FROM dp_cp.rights r
    LEFT JOIN dp_cp.membership_data md ON r.id = md.rights_id
	LEFT JOIN dp_cp.organisations o ON md.organisation_id = o.id
WHERE date is not null
GROUP BY EXTRACT(month from date)
ORDER BY EXTRACT(month from date);