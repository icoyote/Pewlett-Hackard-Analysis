--deliverable 1: number of retiring employees by Title

SELECT  e.emp_no,
    	e.first_name,
		e.last_name,
		ttl.title,
		ttl.from_date,
		ttl.to_date
--INTO retirement_titles
FROM employees as e
INNER JOIN titles as ttl
ON (e.emp_no = ttl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    	e.first_name,
		e.last_name,
		ttl.title,
		ttl.from_date,
		ttl.to_date
--INTO unique_retirement_titles
FROM employees as e
INNER JOIN titles as ttl
ON (e.emp_no = ttl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND ttl.to_date = ('9999-01-01')
ORDER BY e.emp_no, to_date DESC;

-- retrieve number of employees by most recent job title to retire

SELECT COUNT(urt.emp_no) as count_emp_no, urt.title
into retirement_titles_count
FROM unique_retirement_titles as urt
GROUP BY urt.title
ORDER BY count_emp_no DESC;

-- deliverable 2: employees eligible for mentorship program
SELECT 	e.emp_no,
    	e.first_name,
		e.last_name,
    	e.birth_date,
    	de.from_date,
		de.to_date,
		ttl.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ttl
ON (e.emp_no = ttl.emp_no and de.to_date = ttl.to_date )
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
order by emp_no;



