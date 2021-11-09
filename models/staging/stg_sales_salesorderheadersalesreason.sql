with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            salesorderid
            , salesreasonid
            --, modifieddate
        from {{  source('erpadventure','sales_salesorderheadersalesreason')  }}
    )

    select * from source_data