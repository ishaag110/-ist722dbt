

with f_billing as (
    select * from {{ ref('fact_billing_transactions') }}
),

d_account as (
    select * from {{ ref('dim_accounts') }}
),

d_plan as (
    select * from {{ ref('dim_plans') }}
),

d_date as (
    select * from {{ ref('dim_date') }}
)

select
    f.billing_transaction_id,

    -- Dim Accounts
    d_account.account_key,
    d_account.account_email,
    d_account.account_firstname,
    d_account.account_lastname,
    d_account.account_zipcode,

    -- Dim Plan
    d_plan.plan_key,
    d_plan.plan_name,
    d_plan.plan_price,

    -- Date Dimension
    d_date.date as billing_date,
    d_date.year,
    d_date.month,
    d_date.day_name,

    -- Fact Fields
    f.ab_billed_amount,
    f.refund_status,
    f.plan_status,
    f.billing_status

from f_billing f
left join d_account on f.account_key = d_account.account_key
left join d_plan on f.plan_key = d_plan.plan_key
left join d_date on f.billing_date = d_date.date
