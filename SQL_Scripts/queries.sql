# OPERATIONS

# 1. Retrieve all sessions attended by a specific member

	SELECT SS.SessionID, SS.Date, SS.Duration, T.Name AS Trainer
	FROM Sessions SS
	JOIN Trainers T ON SS.TrainerID = T.TrainerID
	WHERE SS.MemberID = 8;

# 2. List all trainers and their specializations

	SELECT TrainerID, Name, Specialization
	FROM trainers;

# 3. Find the number of sessions conducted by each trainer

	SELECT T.Name AS TrainerName,COUNT(DISTINCT SS.SessionID) AS TotalSessions
    FROM trainers T 
	JOIN sessions SS ON T.TrainerID = SS.TrainerID
    GROUP BY T.TrainerID,T.Name;

# 4. Update membership type for a specific member

	UPDATE members
	SET MembershipType = 'Platinum'
	WHERE MemberID = 5;

# 5. Calculate the total duration of workout sessions for a member

	SELECT M.Name as MemberName, SUM(SS.Duration) AS TotalWorkoutTime
	FROM Members M
	JOIN Sessions SS ON M.MemberID = SS.MemberID
	WHERE M.MemberID = 6
	GROUP BY M.MemberID, M.Name;

# 6. Identify the most frequently attended trainer

	SELECT T.Name AS MostFrequentTrainer, COUNT(*) AS SessionCount
	FROM Sessions SS
	JOIN Trainers T ON SS.TrainerID = T.TrainerID
	GROUP BY T.TrainerID, T.Name
	ORDER BY SessionCount DESC
	LIMIT 1;
    
# 7. Retrieve members with expired memberships

	SELECT MemberID, Name, MembershipType, ExpiryDate
	FROM members
	WHERE ExpiryDate < CURDATE();

# 8. Fetch the busiest training days

	SELECT Date, COUNT(*) AS SessionsHeld
	FROM sessions
	GROUP BY Date
	ORDER BY SessionsHeld DESC;

# 9. List members who attended more than 10 sessions

	SELECT M.MemberID, M.Name, COUNT(SS.SessionID) AS SessionCount
	FROM members M
	JOIN sessions SS ON M.MemberID = SS.MemberID
	GROUP BY M.MemberID, M.Name
	HAVING COUNT(SS.SessionID) > 10;

# 10. Generate a report on average session durations per trainer

	SELECT T.Name AS TrainerName, AVG(SS.Duration) AS AverageDuration
	FROM trainers T
	JOIN sessions SS ON T.TrainerID = SS.TrainerID
	GROUP BY T.TrainerID, T.Name;



