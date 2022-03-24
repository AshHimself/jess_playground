{{ config(schema='silver') }}


with source as (
    
    select * from {{ source('customer_data', 'orders') }}
    
),

renamed as (
    
    select
orderid,customerid,employeeid,orderdate,requireddate,shippeddate,shipvia,freight,shipname,shipaddress,shipcity,shipregion,shippostalcode,shipcountry

    from source

)

select * from renamed