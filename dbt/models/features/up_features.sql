{{ config(materialized='table', schema='features') }}

with up_features as (

    select user_id,
        product_id,
        Count(*) AS up_orders,
        Min(order_number) AS up_first_order, 
        Max(order_number) AS up_last_order, 
        Avg(add_to_cart_order) AS up_average_cart_position

    from {{ ref("order_products_prior") }}

    group by user_id, product_id

)

select * from up_features