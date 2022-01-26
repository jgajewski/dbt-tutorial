set stmt =
$$
declare
    radius_of_circle float;
    area_of_circle float;
begin
    radius_of_circle := 3;
    area_of_circle := pi() * radius_of_circle * radius_of_circle;
    return area_of_circle;
end;
$$
;

execute immediate $stmt;


with customers as (

    select
        c_custkey as customer_id,
        c_name as first_name,
        c_address as last_name

    from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER"

),

orders as (

    select
        O_ORDERKEY as order_id,
        O_CUSTKEY as customer_id,
        O_ORDERDATE as order_date,
        O_ORDERSTATUS as status

    from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"

),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders

    group by 1

),


final as (

    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customers

    left join customer_orders using (customer_id)

)

select * from final