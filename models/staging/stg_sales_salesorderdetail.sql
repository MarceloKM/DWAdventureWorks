with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            salesorderid
            , salesorderdetailid
            , carriertrackingnumber
            , orderqty
            , productid
            , specialofferid
            , unitprice
            , unitpricediscount
            --, rowguid
            --, modifieddate
        from {{  source('erpadventure','sales_salesorderdetail')  }}
    )

    select * from source_data