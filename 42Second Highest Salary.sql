-- select
-- (select distinct Salary 
-- from Employee order by salary desc 
-- limit 1 offset 1) 
-- as SecondHighestSalary;
select max(salary) as secondHighestSalary from Employee where salary not in (select max(salary) from Employee);