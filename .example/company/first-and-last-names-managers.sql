USE COMPANY;

SELECT DISTINCT
    e.fname AS FirstName,
    e.lname AS LastName
FROM
    employee e
JOIN
    department d ON e.ssn = d.Mgr_ssn
JOIN
    project p ON d.dnumber = p.dnum
JOIN
    works_on w ON e.ssn = w.essn AND p.pnumber = w.pno
WHERE
    e.ssn IN (SELECT essn FROM works_on WHERE pno IN (SELECT pnumber FROM project WHERE dnum = d.dnumber));
