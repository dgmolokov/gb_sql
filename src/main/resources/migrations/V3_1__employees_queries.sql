select avg(salary), dept_name
from salaries
  left join (dept_emp, departments)
    on (salaries.emp_no = dept_emp.emp_no and dept_emp.dept_no = departments.dept_no)
where curdate() < salaries.to_date
  and curdate() < dept_emp.to_date
group by dept_emp.dept_no;

select max(salary), concat(last_name, ', ', first_name) as full_name
from employees
  left join salaries s on employees.emp_no = s.emp_no
group by full_name;

delete
from employees
where emp_no in (
  select emp_no
  from salaries
  where salary = (
    select max(salary)
    from salaries
    where curdate() < salaries.to_date
  )
);

select dept_name, count(*)
from dept_emp
  left join departments d on dept_emp.dept_no = d.dept_no
where curdate() < to_date
group by dept_name;

select dept_name, count(*), sum(salary)
from dept_emp
  left join (departments d, salaries s) on (dept_emp.dept_no = d.dept_no and dept_emp.emp_no = s.emp_no)
where curdate() < s.to_date
  and curdate() < dept_emp.to_date
group by dept_name;
