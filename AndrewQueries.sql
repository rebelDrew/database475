SELECT LName, Count(staff_id)
FROM Staff
WHERE type = 'trainer'
GROUP BY LName
ORDER BY phone;
