-- display the payment rates for staff who work at department 1
select payment.rate
from payment
where payment.Staff_staff_id in
(select Staff.staff_id from Staff where Staff.Departments_depart_id = 1);


-- for each program type, list all of the members first and last name
select group_concat(FName, " ", LName) as Name,
program_type as Program
from Programs left outer join Pro_members
on Programs.pro_id = Pro_members.Programs_pro_id
left outer join Members on Pro_members.Members_mem_id = Members.mem_id
group by program_type;
