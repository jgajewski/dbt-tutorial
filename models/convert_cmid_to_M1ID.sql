--create or replace table {{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA2") }}.{{ var("SNOWFLAKETBLNAME") }}_AUDIENCE_M1 as 
select distinct b.INDIVIDUAL_ID as IND_ID
from  {{ source('AMEX_INBOUND', 'M1_AUDIENCE_SOURCE') }}  a
inner join {{ref('c3_compliant_M1_DSIID_CMID_DSXXXX')}} b
on a.CMID = b.CMID
where right(METADATA$FILENAME, length('{{ var("FILENAME") }}')) = '{{ var("FILENAME") }}'
