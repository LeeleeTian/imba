with order_products as (
    select * 
    from {{ source("rawdata", "order_products__prior") }}

    union all

    select * 
    from {{ source("rawdata", "order_products__train") }}
)

select * 
from order_products