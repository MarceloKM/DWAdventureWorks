with 
    source_data as (
        select 
            salesorderid
            , salesreasonid
        from {{  source('erpadventure','sales_salesorderheadersalesreason')  }}
    )

    select * from source_data