with 
    source_data as (
        select 
            salesreasonid	
            , name	
            , reasontype	
        from {{  source('erpadventure','sales_salesreason')  }}
    )

    select * from source_data