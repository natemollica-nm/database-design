-- Create database
CREATE DATABASE IF NOT EXISTS Research_Conference;

-- Set context to Research_Conference DB
USE Research_Conference;

-- Create the Author table
CREATE TABLE IF NOT EXISTS Author (
                        Author_Id INT AUTO_INCREMENT PRIMARY KEY,
                        First_Name VARCHAR(50),
                        Last_Name VARCHAR(50),
                        Affiliation VARCHAR(100),
                        Email_Address VARCHAR(100) UNIQUE,
                        Phone_Number VARCHAR(20),
                        Mailing_Address VARCHAR(255)
);

-- Create the Paper table
CREATE TABLE IF NOT EXISTS Paper (
                       Paper_Id INT AUTO_INCREMENT PRIMARY KEY,
                       Title VARCHAR(255),
                       Abstract TEXT,
                       File_Name VARCHAR(255),
                       Contact_Author_Id INT,
                       FOREIGN KEY (Contact_Author_Id) REFERENCES Author(Author_Id)
);

-- Create the Paper_Reviewer_Assignment table
CREATE TABLE IF NOT EXISTS Paper_Reviewer_Assignment (
    Paper_Id INT,
    Reviewer_Id INT,
    PRIMARY KEY (Paper_Id, Reviewer_Id),
    FOREIGN KEY (Paper_Id) REFERENCES Paper(Paper_Id),
    FOREIGN KEY (Reviewer_Id) REFERENCES Reviewer(Reviewer_Id)
);


-- Create the Reviewer table
CREATE TABLE IF NOT EXISTS Reviewer (
                          Reviewer_Id INT AUTO_INCREMENT PRIMARY KEY,
                          First_Name VARCHAR(50),
                          Last_Name VARCHAR(50),
                          Email_Address VARCHAR(100) UNIQUE,
                          Affiliation VARCHAR(100)
);

-- Create the Review table
CREATE TABLE IF NOT EXISTS Review (
                        Review_Id INT AUTO_INCREMENT PRIMARY KEY,
                        Paper_Id INT,
                        Reviewer_Id INT,
                        Technical INT,
                        Readability INT,
                        Originality INT,
                        Relevance INT,
                        Recommendation ENUM('Accept', 'Reject'),
                        Comments_to_Author TEXT,
                        Comments_to_Chair TEXT,
                        FOREIGN KEY (Paper_Id) REFERENCES Paper(Paper_Id),
                        FOREIGN KEY (Reviewer_Id) REFERENCES Reviewer(Reviewer_Id)
);
