SELECT COUNT(r.id) as total_rights
FROM dp_cp.rights r
         LEFT JOIN dp_cp.membership_data md ON r.id = md.right_id
         LEFT JOIN dp_cp.organisations o ON md.organisation_id = o.id
WHERE EXTRACT(month from date) = {month};