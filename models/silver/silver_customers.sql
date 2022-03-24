{{ config(schema='silver') }}



with source as (
    
    select * from {{ source('customer_data', 'customers') }}
    
),

renamed as (
    
SELECT 

customerid,companyname,contactname,contacttitle,address,city,region,postalcode,country,phone,fax


    from source

)

select * from renamed