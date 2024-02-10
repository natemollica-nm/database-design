# Research Conference Database System

Database System used for submitting and reviewing research papers written in MySQL.

Tested on MySQL **_v8.3.0-arm64_**

## Data Requirements

1. Authors are uniquely identified by an Author ID.
2. Authors should each have their First Name, Last Name, Affiliation, email, Phone Number, and Address.
3. Each paper is uniquely identified by the DBMS.
4. Each paper is described by a Title, Abstract, and the Name of the paper.
5. Each paper can have many Authors.
6. Each paper has exactly one **_contact author_**.
7. Each paper can have only one Author who submits the paper.
8. Each paper is assigned multiple reviewers.
9. Authors cannot be reviewers.
10. Each Author in the system has to have submitted at least one paper.
11. Each Author can submit multiple papers.
12. Each Author can be the contact for multiple papers.
13. Reviewer is uniquely identified by DBMS.
14. Reviewer should include their First Name, Last Name, email, and Affiliation.
15. Reviewer can review multiple papers, and a paper can be reviewed by multiple reviewers.
16. Each review is associated with exactly one paper and one reviewer.
17. Each review contains ratings in four categories: technical merit, readability, originality, and relevance.
18. Each review includes two types of written comments: one to be sent to the author and another to be shared with the review committee chair.
19. Each reviewer provides an overall recommendation regarding each paper.
20. Authors must submit at least one paper.
21. The database should enforce referential integrity constraints to ensure that only existing authors can be assigned as the contact author of a paper.
22. The database should enforce referential integrity constraints to ensure that only existing reviewers can be assigned to review papers.
23. The database should enforce the uniqueness of Author ID, Reviewer ID, and Paper ID to ensure identification integrity.
24. The ratings provided by reviewers for each paper should fall within the range of 1 to 10.
25. The database should enforce constraints to ensure that each paper has at least one reviewer assigned to it.
26. The database should provide functionality to track the status of each paper (e.g., under review, accepted, rejected).
