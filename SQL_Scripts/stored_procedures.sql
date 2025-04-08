DELIMITER //
CREATE PROCEDURE GetSessionsByMember(IN member_id INT)
BEGIN
    SELECT s.SessionID, s.Date, s.Duration, t.Name AS TrainerName
    FROM sessions s
    JOIN trainers t ON s.TrainerID = t.TrainerID
    WHERE s.MemberID = member_id;
END //
DELIMITER ;

CALL GetSessionsByMember(2);

DELIMITER //
CREATE PROCEDURE ExtendMembership(IN member_id INT, IN extra_days INT)
BEGIN
    UPDATE members
    SET ExpiryDate = DATE_ADD(ExpiryDate, INTERVAL extra_days DAY)
    WHERE MemberID = member_id;
END //
DELIMITER ;

CALL ExtendMembership(5,31);

DELIMITER //
CREATE PROCEDURE GetActiveNonAttendees()
BEGIN
    SELECT m.MemberID, m.Name, m.ExpiryDate
    FROM members m
    WHERE m.ExpiryDate >= CURDATE()
    AND m.MemberID NOT IN (
        SELECT DISTINCT MemberID FROM sessions
    );
END //
DELIMITER ;

CALL GetActiveNonAttendees();

DELIMITER //
CREATE PROCEDURE UpdateMembershipType(IN m_id INT, IN new_type ENUM('Basic', 'Gold', 'Platinum'))
BEGIN
    UPDATE members
    SET MembershipType = new_type
    WHERE MemberID = m_id;
END //
DELIMITER ;

CALL UpdateMembershipType(7,'Platinum');

DELIMITER //
CREATE PROCEDURE GetTotalWorkoutDuration(IN m_id INT)
BEGIN
    SELECT M.Name as MemberName, SUM(SS.Duration) AS TotalWorkoutTime
    FROM Members M
    JOIN Sessions SS ON M.MemberID = SS.MemberID
    WHERE M.MemberID = m_id
    GROUP BY M.MemberID, M.Name;
END //
DELIMITER ;

CALL GetTotalWorkoutDuration(5);

DELIMITER //
CREATE PROCEDURE TrainerSessionCount()
BEGIN
    SELECT t.Name, COUNT(s.SessionID) AS SessionCount
    FROM trainers t
    LEFT JOIN sessions s ON t.TrainerID = s.TrainerID
    GROUP BY t.TrainerID;
END //
DELIMITER ;

CALL TrainerSessionCount();
