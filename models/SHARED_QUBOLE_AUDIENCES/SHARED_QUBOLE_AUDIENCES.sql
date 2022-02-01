{{ config(materialized='incremental')}}

select a.CMID
, '{{ var("LOADDATE") }}' as Load_Date
, '{{ var("FILENAME") }}' as FILENAME
from  {{ source('AMEX_INBOUND', 'M1_AUDIENCE_SOURCE') }}  a
where right(a.METADATA$FILENAME, length('{{ var("FILENAME") }}')) = '{{ var("FILENAME") }}'

{% if is_incremental() %}
  and right(a.METADATA$FILENAME, length('{{ var("FILENAME") }}')) NOT IN (SELECT DISTINCT FILENAME FROM {{ this}})
  and '{{ var("LOADDATE") }}' NOT IN (SELECT DISTINCT Load_Date FROM {{ this}})
{% endif %}



