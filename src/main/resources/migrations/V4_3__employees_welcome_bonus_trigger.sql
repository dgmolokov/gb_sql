delimiter //
create trigger add_welcome_bonus
  after insert
  on salaries
  for each row
begin
  declare salaries_count int;
  set salaries_count = (select count(*) from salaries where emp_no = new.emp_no);
  if salaries_count = 0 then
    insert into salaries (emp_no, salary, from_date, to_date)
    values (new.emp_no, new.salary * 0.5, curdate(), curdate());
  end if;
end //