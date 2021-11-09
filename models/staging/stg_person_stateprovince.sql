with 
    source_data as (
        select 
            stateprovinceid
            , stateprovincecode
            , countryregioncode
            , isonlystateprovinceflag
            , name
            , territoryid
        from {{  source('erpadventure','person_stateprovince')  }}
    )

    select * from source_data