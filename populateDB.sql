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
values ('Joey', 'Ele', 'lifeguard', 'joeEle4@go.olemiss.edu', '90139281111', 2);

INSERT INTO Staff(staff_id, FName, LName, type, email, phone, Departments_depart_id)
values ('Jeff', 'Lucas', 'Directory', 'jeffLuc2@go.olemiss.edu', '6623918821', 3);





























































































INSERT INTO Programs(type, Departments_depart_id)
values ('Personal Training', 1);

INSERT INTO Programs(type, Departments_depart_id)
values ('Group Fitness', 1);

INSERT INTO Programs(type, Departments_depart_id)
values ('Swim Class', 2);

INSERT INTO Members(FNAme, LName, type, cost, DOB, email)
values ('Joshua', 'Williamson', 'student', 0.00, 'joshwil32@go.olemiss.edu');

INSERT INTO Members(FNAme, LName, type, cost, DOB, email)
values ('John', 'Doe', 'student', 0.00, 'joedoe1@go.olemiss.edu');

INSERT INTO Members(FNAme, LName, type, cost, DOB, email)
values ('Yixin', 'Chen', 'faculty', 50.00, 'yixchen@go.olemiss.edu');

INSERT INTO Pro_members(Members_mem_id, Programs_pro_id, experienceLevel)
values (1, 1, 'beginner');

INSERT INTO Pro_members(Members_mem_id, Programs_pro_id, experienceLevel)
values (2, 2, 'intermediate');
