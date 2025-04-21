with billing as (
    select * from {{ source('fudgeflix', 'ff_account_billing') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['ab_id']) }} as billing_transaction_id,
    {{ dbt_utils.generate_surrogate_key(['ab_account_id']) }} as account_key,
    {{ dbt_utils.generate_surrogate_key(['ab_plan_id']) }} as plan_key,
    ab_date as billing_date,
    ab_billed_amount,
    null as refund_status,
    null as billing_status,
    null as plan_status
from billing



