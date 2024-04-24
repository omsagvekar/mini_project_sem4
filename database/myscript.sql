SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Table structure for table `login_user`
CREATE TABLE login_user (
    `id` int PRIMARY KEY AUTO_INCREMENT,
    `username` varchar(20) NOT NULL,
    `password` varchar(255) NOT NULL -- Hash passwords before storing
);

INSERT INTO login_user (username, password) VALUES ('sanjay','Sanjay');
INSERT INTO login_user (username, password) VALUES ('admin','Admin');

-- Table structure for table `students`
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    address_street VARCHAR(255) NOT NULL,
    address_city VARCHAR(100) NOT NULL,
    address_state VARCHAR(100) NOT NULL,
    address_zip VARCHAR(20) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    guardian_name VARCHAR(100),
    guardian_relationship VARCHAR(50),
    guardian_contact_number VARCHAR(20),
    guardian_email VARCHAR(100),
    admission_date DATE NOT NULL,
    roll_number INT NOT NULL,
    standard INT NOT NULL
);

-- Table structure for table `Fees`

CREATE TABLE Fees (
    `Fees_ID` int PRIMARY KEY AUTO_INCREMENT,
    `Total_Fees` DECIMAL(10, 2) NOT NULL,
    `Paid_Fees` DECIMAL(10, 2) NOT NULL,
    `Last_Payment` DECIMAL(10 , 2) NOT NULL,
    `Balance_Fees` DECIMAL(10, 2) NOT NULL,
    `Last_Payment_Date` DATE NOT NULL,
    `student_id` int,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);



-- Table structure for table `Teacher_checkInOut_Record`
CREATE TABLE Teacher_checkInOut_Record (
    `T_ID` int,
    `CheckInTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `CheckOutTime` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `Total_Hours` DECIMAL(10, 2),
    `Payment` DECIMAL(7, 2),
    `T_Date` DATE,
    PRIMARY KEY(T_ID,T_Date)
);

CREATE TABLE Teachers (
    `T_ID` int,
    `Teacher_Name` varchar(80) NOT NULL,
    `Pay_Per_Hour` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (T_ID) REFERENCES Teacher_checkInOut_Record(T_ID)
);

COMMIT;
