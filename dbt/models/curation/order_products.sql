{{ config(materialized='table', schema='curation') }}

with order_products as (

    select * 

    from {{ source("rawdata", "order_products_prior") }}

    union all

    select * 

    from {{ source("rawdata", "order_products_train") }}

)

select * from order_products