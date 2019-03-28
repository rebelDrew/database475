INSERT INTO Departments(name, type, email)
values ('Fitness', 'fitness', 'fitness@go.olemiss.edu');

INSERT INTO Departments(name, type, email)
values ('Aquatics', 'swimming', 'aquatics@go.olemiss.edu')

INSERT INTO Departments(name, type, email)
values ('Professional Staff', 'GAs/Directors', 'prostaff@go.olemiss.edu')

INSERT INTO Staff(FName, LName, type, email, phone, Departments_depart_id)
values ('Andrew', 'Wallace', 'trainer', 'anwalla3@go.olemiss.edu', '5803019511', 1);

INSERT INTO Staff(FName, LName, type, email, phone, Departments_depart_id)
values ('Austin', 'Wallace', 'trainer', 'amwalla3@go.olemiss.edu', '5803019401', 1);

INSERT INTO Staff(staff_id, FName, LName, type, email, phone, Departments_depart_id)
values ('Joey', 'Ele', 'lifeguard', 'joeEle4@go.olemiss.edu', '90139281111', );

INSERT INTO Staff(staff_id, FName, LName, type, email, phone, Departments_depart_id)
values ('Jeff', 'Lucas', 'Directory', 'jeffLuc2@go.olemiss.edu', '6623918821', );

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
values ('2019-3-16', '12:15:30', 1);

INSERT INTO ClockOut(ClockIn_in_id, out_time)
values (2, "14:15:00");

INSERT INTO ClockIn(recordDate, in_time, Staff_staff_id)
values ('2019-3-19', '08:15:30', 2);

INSERT INTO ClockOut(ClockIn_in_id, out_time)
values (3, "14:55:34");

INSERT INTO ClockIn(recordDate, in_time, Staff_staff_id)
values ('2019-3-22', '16:12:44', 4);

INSERT INTO ClockOut(ClockIn_in_id, out_time)
values (4, "16:48:12");
