# Library Database System

DB System used to keep track of books, borrowers, and book loans.

## Publisher

| Field   | Type         | Null | Key | Extra | Foreign Key |
|---------|--------------|------|-----|-------|-------------|
| Name    | VARCHAR(255) | NO   | PRI |       |             |
| Address | VARCHAR(255) | YES  |     |       |             |
| Phone   | VARCHAR(20)  | YES  |     |       |             |

## Book

| Field          | Type         | Null | Key | Extra | Foreign Key     |
|----------------|--------------|------|-----|-------|-----------------|
| BookId         | INT          | NO   | PRI |       |                 |
| Title          | VARCHAR(255) | YES  |     |       |                 |
| AuthorName     | VARCHAR(255) | YES  |     |       |                 |
| Publisher_Name | VARCHAR(255) | YES  | MUL |       | PUBLISHER(Name) |

## Library Branch

| Field      | Type         | Null | Key | Extra | Foreign Key |
|------------|--------------|------|-----|-------|-------------|
| BranchId   | INT          | NO   | PRI |       |             |
| BranchName | VARCHAR(255) | YES  |     |       |             |
| Address    | VARCHAR(255) | YES  |     |       |             |

## Book Copies

| Field      | Type | Null | Key | Extra | Foreign Key              |
|------------|------|------|-----|-------|--------------------------|
| BookId     | INT  | NO   | PRI |       | BOOK(BookId)             |
| BranchId   | INT  | NO   | PRI |       | LIBRARY_BRANCH(BranchId) |
| NoOfCopies | INT  | YES  |     |       |                          |

## Borrower

| Field   | Type         | Null | Key | Extra | Foreign Key |
|---------|--------------|------|-----|-------|-------------|
| CardNo  | INT          | NO   | PRI |       |             |
| Name    | VARCHAR(255) | YES  |     |       |             |
| Address | VARCHAR(255) | YES  |     |       |             |
| Phone   | VARCHAR(20)  | YES  |     |       |             |

## Book Loans

| Field    | Type | Null | Key | Extra | Foreign Key              |
|----------|------|------|-----|-------|--------------------------|
| BookId   | INT  | NO   | PRI |       | BOOK(BookId)             |
| BranchId | INT  | NO   | PRI |       | LIBRARY_BRANCH(BranchId) |
| CardNo   | INT  | NO   | PRI |       | BORROWER(CardNo)         |
| DateOut  | DATE | YES  |     |       |                          |
| DueDate  | DATE | YES  |     |       |                          |

