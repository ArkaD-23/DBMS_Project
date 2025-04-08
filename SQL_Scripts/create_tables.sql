CREATE TABLE members (
	MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(150) NOT NULL,
    Age INT,
    MembershipType ENUM('Basic', 'Gold', 'Platinum') NOT NULL,
    ExpiryDate DATE,
    CONSTRAINT chk_age CHECK (Age >= 16)
);

CREATE INDEX idx_expiry ON members(ExpiryDate);

CREATE TABLE trainers (
	TrainerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(120) NOT NULL,
    Specialization VARCHAR(100)
);

CREATE TABLE sessions (
    SessionID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    TrainerID INT,
    Date DATE,
    Duration INT,
    FOREIGN KEY (MemberID) REFERENCES members(MemberID) ON DELETE SET NULL,
    FOREIGN KEY (TrainerID) REFERENCES trainers(TrainerID) ON DELETE SET NULL,
    CONSTRAINT chk_duration CHECK (Duration > 0)
);
