INSERT INTO Departments(name, department_type, email)
values ('Fitness', 'fitness', 'fitness@go.olemiss.edu');

INSERT INTO Departments(name, department_type, email)
values ('Aquatics', 'swimming', 'aquatics@go.olemiss.edu');

INSERT INTO Departments(name, department_type, email)
values ('ProfessionalStaff', 'directors', 'prostaff@go.olemiss.edu');

INSERT INTO Staff(FName, LName, staff_type, email, phone, Departments_depart_id)
values ('Andrew', 'Wallace', 'trainer', 'anwalla3@go.olemiss.edu', '5803019511', 1);

INSERT INTO Staff(FName, LName, staff_type, email, phone, Departments_depart_id)
values ('Austin', 'Wallace', 'trainer', 'amwalla3@go.olemiss.edu', '5803019401', 1);

INSERT INTO Staff(FName, LName, type, email, phone, Departments_depart_id)
values ('Alexander', 'Winand', 'trainer', 'alwin3@go.olemiss.edu', '6623019511', 1);

INSERT INTO Staff(FName, LName, type, email, phone, Departments_depart_id)
values ('David', 'Winand', 'trainer', 'davwin3@go.olemiss.edu', '6623019401', 1);

INSERT INTO Staff(FName, LName, staff_type, email, phone, Departments_depart_id)
values ('Jacob', 'Winand', 'trainer', 'jacwin2@go.olemiss.edu', '9019212333', 1);

INSERT INTO Staff(FName, LName, staff_type, email, phone, Departments_depart_id)
values ('Joey', 'Ele', 'lifeguard', 'joeEle4@go.olemiss.edu', '90139281111', 2);

INSERT INTO Staff(FName, LName, staff_type, email, phone, Departments_depart_id)
values ('Jeff', 'Lucas', 'Directory', 'jeffLuc2@go.olemiss.edu', '6623918821', 3);

INSERT INTO Programs(program_type, Departments_depart_id)
values ('Personal Training', 1);

INSERT INTO Programs(program_type, Departments_depart_id)
values ('Group Fitness', 1);

INSERT INTO Programs(program_type, Departments_depart_id)
values ('Swim Class', 2);

INSERT INTO Members(FName, LName, member_type, cost, DOB, email)
values ('Joshua', 'Williamson', 'student', 0.00, 11/21/1992, 'joshwil32@go.olemiss.edu');

INSERT INTO Members(FName, LName, member_type, cost, DOB, email)
values ('John', 'Doe', 'student', 0.00, 01/31/1998, 'joedoe1@go.olemiss.edu');

INSERT INTO Members(FName, LName, member_type, cost, DOB, email)
values ('Yixin', 'Chen', 'faculty', 50.00, 10/31/1982, 'yixchen@go.olemiss.edu');

INSERT INTO Pro_members(Members_mem_id, Programs_pro_id, experienceLevel)
values (1, 1, 'beginner');

INSERT INTO Pro_members(Members_mem_id, Programs_pro_id, experienceLevel)
values (2, 2, 'intermediate');

INSERT INTO Pro_members(Members_mem_id, Programs_pro_id, experienceLevel)
values (3, 2, 'expert');

INSERT INTO Pro_members(Members_mem_id, Programs_pro_id, experienceLevel)
values (2, 3, 'intermediate');

INSERT INTO payment(pay_type, rate, Staff_staff_id)
values ('card', 25, 1);

INSERT INTO payment(pay_type, rate, Staff_staff_id)
values ('cash', 10.50, 2);

INSERT INTO payment(pay_type, rate, Staff_staff_id)
values ('card', 12, 3);

INSERT INTO ClockIn(recordDate, in_time, Staff_staff_id)
values ('2019-3-14', '08:15:30', 1);

INSERT INTO ClockOut(ClockIn_in_id, out_time)
values (1, "09:45:15");

INSERT INTO ClockIn(recordDate, in_time, Staff_staff_id)
values ('2019-3-16', '12:15:30', 2);

INSERT INTO ClockOut(ClockIn_in_id, out_time)
values (2, "14:15:00");

INSERT INTO ClockIn(recordDate, in_time, Staff_staff_id)
values ('2019-3-19', '08:15:30', 3);

INSERT INTO ClockOut(ClockIn_in_id, out_time)
values (3, "14:55:34");

INSERT INTO ClockIn(recordDate, in_time, Staff_staff_id)
values ('2019-3-22', '16:12:44', 4);

INSERT INTO ClockOut(ClockIn_in_id, out_time)
values (4, "16:48:12");
