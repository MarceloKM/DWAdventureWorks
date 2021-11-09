{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_sales_customer')}}
    )
    , transformed as (
        select
            row_number() over (order by customerid) as customerid_sk
            , customerid
            , personid
            , storeid
            , territoryid
        from staging
    )

    select * from transformed