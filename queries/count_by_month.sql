SELECT COUNT(t.id) as total_transactions
FROM dp_cp.rights r
         LEFT JOIN dp_cp.membership_data md ON r.id = md.right_id
         LEFT JOIN dp_cp.organisations o ON md.organisation_id = o.id
		 LEFT JOIN dp_cp.transactions t ON md.transaction_id = t.id
WHERE EXTRACT(month from date) = {month};