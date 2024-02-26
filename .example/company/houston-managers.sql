USE COMPANY;

SELECT
    d.dname AS DepartmentName,
    e.lname AS ManagerLastName,
    p.pname AS ProjectName
FROM
    department d
JOIN
    dept_locations dl ON d.dnumber = dl.dnumber
JOIN
    employee e ON d.Mgr_ssn = e.ssn
JOIN
    project p ON d.dnumber = p.dnum
WHERE
    dl.dlocation = 'Houston'
AND
    p.plocation = 'Houston';
