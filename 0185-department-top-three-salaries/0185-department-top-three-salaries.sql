with highest_earner as (
    select 
    d.name as Department,
    e.name as Employee,
    e.salary as Salary,
    dense_rank() over(
        partition by d.name
        order by e.salary desc
    ) as salary_rank
    from Employee as e
    join Department as d
    on d.id = e.departmentId
)
select 
Department,
Employee,
Salary from highest_earner 
where salary_rank <=3;