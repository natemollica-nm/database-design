USE COMPANY;

SELECT
    e.fname AS Name,
    e.lname AS Last,
    d.dependent_name AS DependentName

FROM
    employee e

INNER JOIN
    dependent d ON e.ssn = d.essn

WHERE
    EXISTS (
        SELECT 1 FROM department WHERE Mgr_ssn = e.ssn
    )

ORDER BY
    e.fname, e.lname, d.dependent_name;