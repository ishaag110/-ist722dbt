with source as (
    select * from {{ source('fudgeflix', 'ff_plans') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['plan_id']) }} as plan_key,
    plan_id,
    plan_name,
    plan_price,
    plan_current
from source