-- Creating retirement_titles.csv
SELECT a.emp_no, a.first_name, a.last_name,
	b.title, b.from_date, b.to_date
INTO retirement_titles
FROM employees as a
    INNER JOIN titles as b
	ON (a.emp_no = b.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY a.emp_no


-- Creating unique_titles.csv
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

-- Creating retiring_titles.csv
SELECT COUNT(emp_no),title 
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT (emp_no) DESC;

---- DELIVERABLE 2 ----
SELECT DISTINCT ON (a.emp_no) a.emp_no,
    a.first_name,
    a.last_name,
    a.birth_date,
    b.from_date,
    b.to_date,
    c.title
INTO mentorship_eligibility
FROM employees as a
    INNER JOIN dept_emp as b
    ON (a.emp_no = b.emp_no)
    INNER JOIN titles as c
    ON (a.emp_no = c.emp_no)
WHERE (a.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;
