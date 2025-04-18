with dates as (
    select
        dateadd(day, seq4(), '2000-01-01') as date_day
    from table(generator(rowcount => 10000))
)

select
    date_day as date,
    year(date_day) as year,
    month(date_day) as month,
    day(date_day) as day,
    dayofweek(date_day) as weekday,
    to_char(date_day, 'Day') as day_name,
    to_char(date_day, 'Month') as month_name
from dates