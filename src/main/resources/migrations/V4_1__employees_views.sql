create or replace view average_salary_by_department
as
select avg(salary), dept_name
from salaries
  left join (dept_emp, departments)
  on (salaries.emp_no = dept_emp.emp_no and dept_emp.dept_no = departments.dept_no)
where curdate() < salaries.to_date
  and curdate() < dept_emp.to_date
group by dept_emp.dept_no;

create or replace view employee_max_salary
as
select max(salary), concat(last_name, ', ', first_name) as full_name
from employees
  left join salaries s on employees.emp_no = s.emp_no
group by full_name;

create or replace view employees_count_by_department
as
select dept_name, count(*)
from dept_emp
  left join departments d on dept_emp.dept_no = d.dept_no
where curdate() < to_date
group by dept_name;

create or replace view department_full_salary
as
select dept_name, count(*), sum(salary)
from dept_emp
  left join (departments d, salaries s) on (dept_emp.dept_no = d.dept_no and dept_emp.emp_no = s.emp_no)
where curdate() < s.to_date
  and curdate() < dept_emp.to_date
group by dept_name;
