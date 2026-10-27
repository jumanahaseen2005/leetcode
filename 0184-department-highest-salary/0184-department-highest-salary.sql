with highest_salary as(
    select d.name as Department ,
    e.name as Employee, e.salary ,
    dense_rank() over (
        partition by d.name
        order by e.salary desc
    ) as salary_rank
    from Employee as e 
    join Department as d 
    on d.id = e.departmentid 
) 
 select 
   Department,Employee,Salary from highest_salary 
   where salary_rank = 1
   order by salary desc;
