{{ config(materialized='table') }}

with
    dim_sales_salesreason as (
        select*
        from {{  ref('dim_sales_salesreason')  }}
    )

    , fact_sales_salesorderheadersalesreason as (
        select *
        from {{  ref('fact_sales_salesorderheadersalesreason')  }}
        inner join dim_sales_salesreason
        on fact_sales_salesorderheadersalesreason.salesreasonid_fk = dim_sales_salesreason.salesreasonid
    )

    select * from fact_sales_salesorderheadersalesreason
    