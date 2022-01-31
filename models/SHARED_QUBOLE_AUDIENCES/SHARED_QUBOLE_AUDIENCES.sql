{{ config(materialized='incremental')}}

select a.CMID
, '{{ var("LOADDATE") }}' as Load_Date
, '{{ var("FILENAME") }}' as FILENAME
from  {{ source('AMEX_INBOUND', 'M1_AUDIENCE_SOURCE') }}  a


{% if is_incremental() %}
  -- this filter will only be applied on an incremental run  where date_day >= (select max(date_day) from {{ this }})
  where right(a.METADATA$FILENAME, length('{{ var("FILENAME") }}')) = '{{ var("FILENAME") }}'
{% endif %}



