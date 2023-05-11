delimiter //
  create procedure get_employee_id(search_word varchar(30))
    begin
      select emp_no, first_name, last_name
      from employees
      where concat(first_name, last_name) like concat('%', search_word, '%');
    end //
delimiter ;
