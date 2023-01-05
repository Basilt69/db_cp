SELECT c.name       as customer_name,
       SUM(p.price) as total_sales
FROM db_cp.products p
         LEFT JOIN db_cp.purchases pu ON p.id = pu.product_id
         LEFT JOIN db_cp.customers c ON pu.user_id = c.id
WHERE date is not null
GROUP BY c.name
ORDER BY total_sales desc;