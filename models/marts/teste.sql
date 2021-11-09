{{ config(materialized='table') }}

with
    production_product_with_sk as (
        select
            productid_sk
            , productid
        from {{  ref('dim_production_product')  }}
    )

    , sales_salesorderdetail_with_fk as (
        select
            sales_salesorderdetail.salesorderid
            , sales_salesorderdetail.salesorderdetailid
            , sales_salesorderdetail.carriertrackingnumber
            , sales_salesorderdetail.orderqty
            , production_product_with_sk.productid_sk as productid_fk
            , sales_salesorderdetail.specialofferid
            , sales_salesorderdetail.unitprice
            , sales_salesorderdetail.unitpricediscount
        from {{  ref('stg_sales_salesorderdetail')  }} sales_salesorderdetail
        left join production_product_with_sk
        on sales_salesorderdetail.productid = production_product_with_sk.productid
    )

    , staging as (
        select *
        from {{ref('stg_production_product')}}
    )
    , transformed as (
        select
            row_number() over (order by productid) as productid_sk
            , productid
            , name
            , productnumber
            , makeflag
            , finishedgoodsflag
            , color
            , safetystocklevel
            , reorderpoint
            , standardcost
            , listprice
            , size
            , sizeunitmeasurecode
            , weightunitmeasurecode
            , weight
            , daystomanufacture
            , productline
            , class
            , style
            , productsubcategoryid
            , productmodelid
            , sellstartdate
            , sellenddate
            , discontinueddate
        from staging
        left join sales_salesorderdetail_with_fk
        on transformed.productid_fk = sales_salesorderdetail_with_fk.productid_sk 
    )

    , transformed1 as (
        select *
        from transformed
        left join sales_salesorderdetail_with_fk
        on transformed1.productid_sk = sales_salesorderdetail_with_fk.productid_fk 
    )

    select * from transformed1
