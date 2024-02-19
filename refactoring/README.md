## Project Normalization to 3NF

**First Normal Form (1NF)**: Each table has a primary key, and all columns contain atomic (indivisible) values. There are no repeating groups.

**Second Normal Form (2NF)**: It is in 1NF, and all non-key attributes are fully functional and dependent on the primary key.

**Third Normal Form (3NF)**: It is in 2NF, and all the attributes are only dependent on the primary key, not on any other non-prime attribute (i.e., no transitive dependencies).


### LMS Schema Review

**Users Table**
* **1NF**: Achieved through a primary key (UserID) and atomic columns.
* **2NF**: Achieved since all information is directly related to the UserID.
* **3NF**: Achieved, as there are no transitive dependencies; all attributes directly depend on UserID.

Courses Table
* **1NF**: Primary key (CourseID) ensures uniqueness, and all attributes are atomic.
* **2NF**: Achieved, but introduces a potential issue with InstructorID pointing to Users. The direct dependency is on CourseID, but InstructorID relies on the existence of a user. This setup is logical for this context, as it represents a real-world relationship.
* **3NF**: The table is in 3NF if we consider InstructorID as a foreign key that directly depends on the CourseID for its context within the Courses table. It's not a transitive dependency because it represents a direct relationship, not an attribute of another non-prime attribute.

Modules, Lessons, Assignment_Quiz, Submissions, Content, and Communication Tables
* **1NF**: Each table has a primary key and atomic attributes.
* **2NF**: All non-key attributes are fully dependent on their respective primary keys, with no partial dependencies.
* **3NF**: There are no transitive dependencies; non-key attributes depend only on the primary key.

### Considerations for Normalization to **3NF**:

* **Eliminate Redundant Data**: Ensure that user information is not duplicated across tables. For example, InstructorID in Courses table should not lead to redundant user information elsewhere.
* **Foreign Key References**: Maintain integrity through foreign keys without causing unnecessary duplication. For instance, InstructorID, UserID, and ModuleID serve as foreign keys that link tables based on logical relationships, not duplicating information.
* **Avoid Transitive Dependencies**: If any table appears to have attributes that depend on non-key attributes, consider restructuring or splitting the table. However, in the provided schema, such dependencies do not seem to be present.
* **Specific Adjustments**:
  * **_Courses Table_**: If instructors can teach multiple courses and if there's significant instructor-specific data relevant to courses (e.g., teaching style, feedback ratings), we might consider an InstructorDetails table linked to Users to keep user data and instructor-specific data separate. 
    * This is more about enhancing design than a requirement for 3NF.

**Normalization and Real-world Applications**: While the schema is normalized to 3NF based on the provided structure, it's essential to balance normalization with practical considerations like query performance, readability, and the complexity of JOIN operations in a real-world application.



## Key Adjustments:
**Instructors Table**: 
* A new table Instructors is introduced to separate instructor-specific data 
from the general user data. This table includes attributes like Bio and Qualifications which are 
specific to instructors. 
* It's linked to the **Users** table via a foreign key (**UserID**), ensuring that each instructor record is directly associated with a user record. 
  * This separation maintains the 3NF by eliminating transitive dependencies within the **Users** table and allows for more detailed information to be stored about instructors without 
cluttering the Users table.

```mysql
CREATE TABLE IF NOT EXISTS Instructors (
    InstructorID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT UNIQUE NOT NULL,
    Bio TEXT,
    Qualifications TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);
```

**Courses Table**: 

* The foreign key in the **Courses** table now references Instructors(**InstructorID**) instead of Users(**UserID**), directly linking courses to the instructors table. 
  * This change ensures that course-instructor relationships are clearly defined and manageable, 
  especially when a user has multiple roles or when detailed instructor information needs to be 
  accessed or updated.


```mysql
CREATE TABLE IF NOT EXISTS Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID) ON DELETE SET NULL
);
```

These adjustments enhance the database schema's adherence to 3NF by ensuring all attributes depend on the primary key, reducing redundancy, and improving the clarity and efficiency of data management within the LMS.