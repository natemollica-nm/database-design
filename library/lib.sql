-- Creating the PUBLISHER table
CREATE TABLE IF NOT EXISTS PUBLISHER (
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    PRIMARY KEY (Name)
);

-- Creating the BOOK table
CREATE TABLE IF NOT EXISTS BOOK (
    BookId INT NOT NULL,
    Title VARCHAR(255),
    AuthorName VARCHAR(255),
    Publisher_Name VARCHAR(255),
    PRIMARY KEY (BookId),
    FOREIGN KEY (Publisher_Name) REFERENCES PUBLISHER(Name)
);

-- Creating the LIBRARY_BRANCH table
CREATE TABLE IF NOT EXISTS LIBRARY_BRANCH (
    BranchId INT NOT NULL,
    BranchName VARCHAR(255),
    Address VARCHAR(255),
    PRIMARY KEY (BranchId)
);

-- Creating the BOOK_COPIES table
CREATE TABLE IF NOT EXISTS BOOK_COPIES (
    BookId INT NOT NULL,
    BranchId INT NOT NULL,
    NoOfCopies INT,
    PRIMARY KEY (BookId, BranchId),
    FOREIGN KEY (BookId) REFERENCES BOOK(BookId),
    FOREIGN KEY (BranchId) REFERENCES LIBRARY_BRANCH(BranchId)
);

-- Creating the BORROWER table
CREATE TABLE IF NOT EXISTS BORROWER (
    CardNo INT NOT NULL,
    Name VARCHAR(255),
    Address VARCHAR(255),
    Phone VARCHAR(20),
    PRIMARY KEY (CardNo)
);

-- Creating the BOOK_LOANS table
CREATE TABLE IF NOT EXISTS BOOK_LOANS (
    BookId INT NOT NULL,
    BranchId INT NOT NULL,
    CardNo INT NOT NULL,
    DateOut DATE,
    DueDate DATE,
    PRIMARY KEY (BookId, BranchId, CardNo),
    FOREIGN KEY (BookId) REFERENCES BOOK(BookId),
    FOREIGN KEY (BranchId) REFERENCES LIBRARY_BRANCH(BranchId),
    FOREIGN KEY (CardNo) REFERENCES BORROWER(CardNo)
);