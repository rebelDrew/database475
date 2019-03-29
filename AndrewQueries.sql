
--query 1
SELECT LName, Count(staff_id)
FROM Staff
WHERE type = 'trainer'
GROUP BY LName
ORDER BY phone;


SELECT FName, LName, recordDate, TIMEDIFF(ClockOut.out_time, ClockIn.in_time) AS HoursMinSecWorked
from Staff
left outer join ClockIn
on ClockIn.Staff_staff_id = staff_id
left outer join ClockOut
on ClockOut.ClockIn_in_id = ClockIn.in_id
where staff_id = Staff_staff_id
ORDER BY LName, recordDate;

--cast(DATEDIFF(minute, @date1, @date2) / 60.0 as decimal(10,2)) DATEDIFF(second, start_date, end_date) / 3600.0

/*
SELECT GROUP_CONCAT(name)
FROM (
  SELECT name, SUM(ClockOut.out_time - ClockIn.in_time)
  FROM Departments x
  left join Staff
  on Staff.Departments_depart_id = Departments.depart_id
  left join ClockIn
  on Staff.staff_id = ClockIn.Staff_staff_id
  left join ClockOut
  on ClockIn.in_id = ClockOut.ClockIn_in_id;
) x
*/
