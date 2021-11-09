{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_sales_salesreason')}}
    )
    , transformed as (
        select
            row_number() over (order by salesreasonid) as salesreasonid_sk
            , salesreasonid	
            , name	
            , reasontype	

        from staging
    )

    select * from transformed