# Pewlett-Hackard-Analysis

## Overview of the analysis: 
For this project the employee information for the Pewlwtt-Hackard company was available in the format of CSV files. In order to perform querries and also to store the data it was uploaded into a relational database. Logical relationships between columns from the different files were identified.

![](/EmployeeDB.png)


## Results: 

Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.
![](/UniqueRetireTitles.png)



## Summary: 

Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

-How many roles will need to be filled as the "silver tsunami" begins to make an impact?

a total of 72 458 roles will need to be filled as part of the silver tsunami.
```
SELECT COUNT(urt.emp_no) as count_emp_no
FROM unique_retirement_titles as urt
```

-Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
in the second deliverable we made a selection of employees that are available for the mentorship program

```
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

select count(*)
from mentorship_eligibility
```

By doing a count of the selection saved into table mentorship_availability, we only have 1549 employees that is almost 50 times less the amount of potential retirees. 

we also will have the following positions to fill (result query from deliverable 1):

**25916**	"Senior Engineer"
**24926**	"Senior Staff"
**9285**	"Engineer"
**7636**	"Staff"
**3603** "Technique Leader"
**1090**	"Assistant Engineer"
**2**	"Manager"

and from the mentorship_eligibility

```
SELECT 	count (e.emp_no) count_mentorship ,ttl.title
--INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ttl
ON (e.emp_no = ttl.emp_no and de.to_date = ttl.to_date )
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
group by ttl.title
order by count_mentorship;
```


**29**	"Assistant Engineer"
**77**	"Technique Leader"
**155**	"Staff"
**190**	"Engineer"
**529**	"Senior Engineer"
**569**	"Senior Staff"

There will be no mentorship opportunity for Manager titles. also the most in demand titles will be

**25916**	"Senior Engineer"
**24926**	"Senior Staff"
**9285**	"Engineer"

while the top 3 mentorship eligibility are 

**190**	"Engineer"
**529**	"Senior Engineer"
**569**	"Senior Staff"

however the number of future retirees outnumbers greatly the candidates for mentorship.


