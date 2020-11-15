--MODULE 7 Deliverable CODE
-- Employee_Challenge_Deliverable 1 part 1
SELECT e.emp_no,
	e.first_name,
	e.last_name,
 	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--testing of retirement title table
SELECT * FROM retirement_titles;

-- Employee_Challenge_Deliverable 1 part 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
 	rt.title
INTO unique_titles 
FROM employees AS e
INNER JOIN retirement_titles AS rt
ON (e.emp_no = rt.emp_no)
ORDER BY e.emp_no ASC,
	rt.to_date DESC;

--testing of unique titles table
SELECT * FROM unique_titles;

-- Employee_Challenge_Deliverable 1 Part 3
SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;

--testing retiring titles count
SELECT * FROM retiring_titles;