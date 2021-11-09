with 
    source_data as (
        select
            countryregioncode
            , name
        from {{  source('erpadventure','person_countryregion')  }}
    )

    select * from source_data