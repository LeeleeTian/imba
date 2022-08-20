{{ config(materialized='table', schema='features') }}

with order_products_prior as (

    select a.*,
        b.product_id,
        b.add_to_cart_order,
        b.reordered 

    from {{ source("rawdata", "orders") }} a

    join {{ ref("order_products") }} b

    on a.order_id = b.order_id

    where a.eval_set = 'prior'

)

select * from order_products_prior