with final as (

    select * from {{ source('member','table_1') }}

)
select * from final


