{{ config(materialized='table', schema='features') }}

with user_features_1 as (

    select user_id,
        Max(order_number) AS user_orders, 
        Sum(days_since_prior_order) AS user_period, 
        Avg(days_since_prior_order) AS user_mean_days_since_prior
        
    from {{ source("rawdata", "orders") }}

    group by user_id

)

select * from user_features_1