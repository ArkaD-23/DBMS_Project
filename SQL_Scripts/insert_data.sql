INSERT INTO Members (Name, Age, MembershipType, ExpiryDate) 
VALUES
('John Smith', 26, 'Gold', '2025-06-15'),
('Jaina Proudmoore', 30, 'Basic', '2025-03-20'),
('Alice Johnson', 25, 'Platinum', '2025-07-10'),
('Bob Odenkirk', 43, 'Gold', '2025-06-30'),
('Chris Brown', 34, 'Basic', '2025-05-01'),
('David Miller', 28, 'Platinum', '2025-08-25'),
('Emily Blunt', 30, 'Gold', '2025-06-05'),
('Frank Wilson', 32, 'Basic', '2025-03-15'),
('Grace Hall', 29, 'Platinum', '2025-07-20'),
('Henry Clark', 37, 'Gold', '2025-05-30');

INSERT INTO Trainers (Name, Specialization) 
VALUES
('Rahul Sharma', 'Strength Training'),
('Ananya Gupta', 'Yoga & Flexibility'),
('Amit Verma', 'Weight Loss & Cardio'),
('Sneha Reddy', 'Pilates & Core Strength'),
('Rohan Mehta', 'Functional Fitness'),
('Kavita Nair', 'CrossFit'),
('Sandeep Yadav', 'Powerlifting'),
('Priya Das', 'Zumba & Aerobics'),
('Vikram Singh', 'Martial Arts & Self-defense'),
('Neha Malhotra', 'Sports Conditioning');

INSERT INTO Sessions (MemberID, TrainerID, Date, Duration) 
VALUES
(3, 1, '2025-02-25', 50),
(1, 4, '2025-02-27', 40),
(5, 2, '2025-02-28', 75),
(7, 3, '2025-03-01', 60),
(2, 6, '2025-03-03', 90),
(8, 7, '2025-03-04', 45),
(6, 9, '2025-03-06', 55),
(9, 5, '2025-03-07', 35),
(10, 8, '2025-03-08', 65),
(4, 10, '2025-03-09', 70);
