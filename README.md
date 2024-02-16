# database-design

CSC422 Database &amp; Design shared repository for course project.

**_Group 3_**: Nate Mollica | Peter Momsen | John Padworski | Brandon Perez-Lee

### Database System Project

**_Project Domain_**: Learning Management System (LMS)

**_Project Technology_**: MySQL Database

## Introduction

A LMS app database application plays a vital role in modern education by providing a centralized
platform for managing courses, users, content, and assessments. Its features and functionalities
empower educators to deliver engaging and interactive learning experiences while facilitating
communication, collaboration, and data-driven decision-making. Despite the challenges of
scalability, customization, security, and accessibility, a well-designed LMS app database
application can significantly enhance the effectiveness and efficiency of online education,
fostering a culture of continuous learning and innovation in educational institutions.

## Relationships

* **User to Course:** Many-to-Many (Instructors teach many courses; students enroll in many courses)
* **Course to Module:** One-to-Many (A course contains many modules)
* **Module to Lesson:** One-to-Many (A module contains many lessons)
* **Course to Assignment_Quiz:** One-to-Many (A course has many assignments/quizzes)
* **User to Submission:** One-to-Many (A user can make many submissions, but each submission is made by one user)
* **Lesson to Content:** One-to-Many (A lesson can have multiple contents)
* **User to Communication:** Many-to-Many (Users can send messages to many users, and receive from many)


## Cardinality and Participation Constraints
* **User to Course:** (N:M) A user can be associated with multiple courses either as a student, instructor, or both. A course must have at least one instructor but can have many students.
* **Course to Module, Module to Lesson, Lesson to Content:** (1:N) A parent entity must have at least one child entity but can have many.
* **Course to Assignment_Quiz:** (1:N) Each course must have at least one assignment or quiz.
* **User to Submission:** (1:N) A submission must be made by exactly one user, but a user can make multiple submissions.

## Entities and Their Attributes

### User Entity

| Attribute        | Type     | Description                                      |
|------------------|----------|--------------------------------------------------|
| UserID           | INT (PK) | Primary Key, Unique Identifier for User          |
| Username         | VARCHAR  | User's Username                                  |
| Password         | VARCHAR  | User's Password                                  |
| Email            | VARCHAR  | User's Email Address                             |
| Role             | ENUM     | User's Role (Student, Instructor, Administrator) |
| RegistrationDate | DATE     | Date When User Registered                        |
| ProfileInfo      | TEXT     | Additional Information About the User            |

### Course Entity

| Attribute    | Type     | Description                               |
|--------------|----------|-------------------------------------------|
| CourseID     | INT (PK) | Primary Key, Unique Identifier for Course |
| CourseName   | VARCHAR  | Name of the Course                        |
| Description  | TEXT     | Course Description                        |
| StartDate    | DATE     | Course Start Date                         |
| EndDate      | DATE     | Course End Date                           |
| InstructorID | INT (FK) | Foreign Key from User Entity              |

### Module Entity

| Attribute   | Type     | Description                               |
|-------------|----------|-------------------------------------------|
| ModuleID    | INT (PK) | Primary Key, Unique Identifier for Module |
| CourseID    | INT (FK) | Foreign Key from Course Entity            |
| ModuleName  | VARCHAR  | Name of the Module                        |
| Description | TEXT     | Module Description                        |

### Lesson Entity

| Attribute | Type     | Description                               |
|-----------|----------|-------------------------------------------|
| LessonID  | INT (PK) | Primary Key, Unique Identifier for Lesson |
| ModuleID  | INT (FK) | Foreign Key from Module Entity            |
| Title     | VARCHAR  | Lesson Title                              |
| Content   | TEXT     | Lesson Content                            |
| Type      | ENUM     | Type of Content (e.g., Video, Document)   |

### Assignment_Quiz Entity

| Attribute  | Type     | Description                                        |
|------------|----------|----------------------------------------------------|
| AQID       | INT (PK) | Primary Key, Unique Identifier for Assignment/Quiz |
| CourseID   | INT (FK) | Foreign Key from Course Entity                     |
| Title      | VARCHAR  | Title of the Assignment or Quiz                    |
| Type       | ENUM     | Type (Assignment or Quiz)                          |
| Deadline   | DATE     | Deadline for Submission                            |
| TotalMarks | INT      | Maximum Marks Possible                             |

### Submission Entity

| Attribute      | Type     | Description                                   |
|----------------|----------|-----------------------------------------------|
| SubmissionID   | INT (PK) | Primary Key, Unique Identifier for Submission |
| AQID           | INT (FK) | Foreign Key from Assignment_Quiz Entity       |
| UserID         | INT (FK) | Foreign Key from User Entity                  |
| SubmissionDate | DATE     | Date of Submission                            |
| MarksAwarded   | INT      | Marks Awarded to Submission                   |

### Content Entity

| Attribute         | Type     | Description                                |
|-------------------|----------|--------------------------------------------|
| ContentID         | INT (PK) | Primary Key, Unique Identifier for Content |
| LessonID          | INT (FK) | Foreign Key from Lesson Entity             |
| Type              | ENUM     | Type of Content (e.g., Document, Video)    |
| URL               | VARCHAR  | URL to Access Content                      |
| AccessPermissions | VARCHAR  | Permissions Required to Access Content     |

### Communication Entity

| Attribute  | Type     | Description                                |
|------------|----------|--------------------------------------------|
| MessageID  | INT (PK) | Primary Key, Unique Identifier for Message |
| FromUserID | INT (FK) | Foreign Key, Identifier for Sender         |
| ToUserID   | INT (FK) | Foreign Key, Identifier for Receiver       |
| Message    | TEXT     | Content of the Message                     |
| Timestamp  | DATETIME | Time When the Message Was Sent             |
