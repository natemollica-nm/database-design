USE COMPANY;

SELECT
    p.pname AS ProjectName,
    d.dname AS DepartmentName,
    e.lname AS ManagerLastName
FROM
    project p
INNER JOIN
    department d ON p.dnum = d.dnumber
INNER JOIN
    employee e ON d.Mgr_ssn = e.ssn
WHERE
    p.plocation = 'Stafford';