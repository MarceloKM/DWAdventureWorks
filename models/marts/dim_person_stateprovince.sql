{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_person_stateprovince')}}
    )
    , transformed as (
        select
            row_number() over (order by stateprovinceid) as stateprovinceid_sk
            , stateprovinceid
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name
            , territoryid
        from staging
    )

    select * from transformed