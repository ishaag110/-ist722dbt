with billing as (
    select * from {{ source('fudgeflix', 'ff_account_billing') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['ab_id']) }} as subscription_event_id,
    {{ dbt_utils.generate_surrogate_key(['ab_account_id']) }} as account_key,
    {{ dbt_utils.generate_surrogate_key(['ab_plan_id']) }} as plan_key,
    ab_date as subscription_date,
    ab_billed_amount,
    null as upgrade_downgrade_flag,
    null as active_status
from billing