select e.emp_no, 
    first_name,
    last_name,
    title,
    from_date,
    to_date
INTO retirement_titles
from employees as e
LEFT JOIN titles as ts
on (e.emp_no = ts.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31');

SELECT * FROM retirement_titles;

SELECT DISTINCT ON (emp_no) emp_no,
    first_name,
    last_name,
    title
INTO recent_list
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM recent_list;

select count(emp_no), 
title 
INTO retiring_titles
from recent_list 
group by  title 
order by count(emp_no) DESC;

SELECT * FROM retiring_titles;

SELECT distinct on (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    ts.title


INTO mentorship_eligibility
FROM employees as e
    INNER JOIN dept_emp AS de
    ON (e.emp_no = de.emp_no)
    INNER JOIN titles AS ts
    ON (e.emp_no = ts.emp_no)
where (de.to_date = '9999-01-01') and
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')


SELECT * FROM mentorship_eligibility;