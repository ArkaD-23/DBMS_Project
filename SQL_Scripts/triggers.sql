CREATE TABLE membership_audit (
    AuditID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT,
    OldExpiry DATE,
    NewExpiry DATE,
    ChangeDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_log_expiry_update
BEFORE UPDATE ON members
FOR EACH ROW
BEGIN
    IF OLD.ExpiryDate <> NEW.ExpiryDate THEN
        INSERT INTO membership_audit(MemberID, OldExpiry, NewExpiry)
        VALUES (OLD.MemberID, OLD.ExpiryDate, NEW.ExpiryDate);
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_prevent_expired_sessions
BEFORE INSERT ON sessions
FOR EACH ROW
BEGIN
    DECLARE memberExpiry DATE;
    
    SELECT ExpiryDate INTO memberExpiry
    FROM members
    WHERE MemberID = NEW.MemberID;
    
    IF memberExpiry < CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot book session: Membership expired';
    END IF;
END //
DELIMITER ;
