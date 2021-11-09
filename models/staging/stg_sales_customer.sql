with 
    source_data as (
        select 
            customerid
            , personid
            , storeid
            , territoryid
        from {{  source('erpadventure','sales_customer')  }}
    )

    select * from source_data