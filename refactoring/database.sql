-- Create database
CREATE DATABASE IF NOT EXISTS LMS;

-- Set context to LMS DB
USE LMS;

-- Creating the Users table
CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Role ENUM('Student', 'Instructor', 'Administrator') NOT NULL,
    RegistrationDate DATE NOT NULL,
    ProfileInfo TEXT
);

-- Introducing an Instructors table to separate instructor-specific information
CREATE TABLE IF NOT EXISTS Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT UNIQUE NOT NULL,
    Bio TEXT,
    Qualifications TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Adjusting the Courses table to reference the Instructors table
CREATE TABLE IF NOT EXISTS Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) ON DELETE SET NULL
);

-- Creating the Modules table
CREATE TABLE IF NOT EXISTS Modules (
    ModuleID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    ModuleName VARCHAR(255) NOT NULL,
    Description TEXT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Creating the Lessons table
CREATE TABLE IF NOT EXISTS Lessons (
    LessonID INT AUTO_INCREMENT PRIMARY KEY,
    ModuleID INT,
    Title VARCHAR(255) NOT NULL,
    Content TEXT,
    Type ENUM('Video', 'Document', 'Interactive') NOT NULL,
    FOREIGN KEY (ModuleID) REFERENCES Modules(ModuleID) ON DELETE CASCADE
);

-- Creating the Assignment_Quiz table
CREATE TABLE IF NOT EXISTS Assignment_Quiz (
    AQID INT AUTO_INCREMENT PRIMARY KEY,
    CourseID INT,
    Title VARCHAR(255) NOT NULL,
    Type ENUM('Assignment', 'Quiz') NOT NULL,
    Deadline DATE,
    TotalMarks INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Creating the Submissions table
CREATE TABLE IF NOT EXISTS Submissions (
    SubmissionID INT AUTO_INCREMENT PRIMARY KEY,
    AQID INT,
    UserID INT,
    SubmissionDate DATE,
    MarksAwarded INT,
    FOREIGN KEY (AQID) REFERENCES Assignment_Quiz(AQID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- Creating the Content table
CREATE TABLE IF NOT EXISTS Content (
    ContentID INT AUTO_INCREMENT PRIMARY KEY,
    LessonID INT,
    Type ENUM('Document', 'Video', 'Interactive', 'Other') NOT NULL,
    URL VARCHAR(255) NOT NULL,
    AccessPermissions VARCHAR(255),
    FOREIGN KEY (LessonID) REFERENCES Lessons(LessonID) ON DELETE CASCADE
);

-- Creating the Communication table
CREATE TABLE IF NOT EXISTS Communication (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    FromUserID INT,
    ToUserID INT,
    Message TEXT NOT NULL,
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (FromUserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ToUserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
