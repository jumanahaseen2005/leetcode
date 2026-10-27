with score_rank as (
select 
score,
dense_rank() over(
    order by score desc 
) as rank
from Scores
)
select * from score_rank 
order by score desc;

