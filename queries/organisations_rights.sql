SELECT r.name as right_name,
    md.date,
	o.name as organisation_name
FROM dp_cp.rights as r
    LEFT JOIN dp_cp.membership_data md ON r.id = md.rights_id
    LEFT JOIN dp_cp.organisations o ON md.organisation_id = o.id
WHERE date is not null;