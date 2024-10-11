{{ config(
    materialized='incremental',
    unique_key='id'
) }}

with final as (
select * from {{source('emp','employee_details')}}
)

{% if is_incremental() %}

select * from final 
  where RECEIVED_AT >= (select (max(RECEIVED_AT)) from {{ this }} )

{% else %}

select * from final 

{% endif %}
