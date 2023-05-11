explain
select dept_name, count(*)
from dept_emp
  left join departments d on dept_emp.dept_no = d.dept_no
where curdate() < to_date
group by dept_name;