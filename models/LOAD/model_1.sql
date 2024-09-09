with final as
(

    select id as Id_1,name as name_1 from {{ source('member','table_1') }}

),
final_1 as 
(

    select id as id_2,name as name_2 ,city as city_2
    
     from {{ source('member','table_2') }}
),

final_2 as 
    (
    select f.*,f1.* from final f inner join final_1 f1 on f.id_1  = f1.id_2
    )

select * from final_2

