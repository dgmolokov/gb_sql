delimiter //
create procedure delete_employee(emp_id int)
begin
  start transaction;
  delete from dept_manager where emp_no = emp_id;
  delete from dept_emp where emp_no = emp_id;
  delete from salaries where emp_no = emp_id;
  delete from titles where emp_no = emp_id;
  delete from employees where emp_no = emp_id;
  commit;
end //
delimiter ;