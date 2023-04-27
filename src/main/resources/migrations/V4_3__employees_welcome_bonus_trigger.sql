delimiter //
  create trigger add_welcome_bonus
    after insert
    on employees
    for each row
    insert into salaries(emp_no, salary, from_date, to_date)
    values(new.emp_no, 100000, curdate(), curdate()) //
delimiter ;
