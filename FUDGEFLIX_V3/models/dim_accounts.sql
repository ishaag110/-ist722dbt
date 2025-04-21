with source as (
    select * from {{ source('fudgeflix', 'ff_accounts') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['account_id']) }} as account_key,
    account_id,
    account_email,
    account_firstname,
    account_lastname,
    account_zipcode,
    account_plan_id,
    account_opened_on
from source