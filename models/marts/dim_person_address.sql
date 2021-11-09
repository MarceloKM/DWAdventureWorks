{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_person_address')}}
    )
    , transformed as (
        select
            row_number() over (order by addressid) as addressid_sk
            , addressid
            , addressline1
            , addressline2
            , city
            , stateprovinceid
            , postalcode
            , spatiallocation
        from staging
    )

    select * from transformed