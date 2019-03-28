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
