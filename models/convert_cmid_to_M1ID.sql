create or replace table {{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA2") }}.{{ var("SNOWFLAKETBLNAME") }}_AUDIENCE_M1 as 
select distinct b.INDIVIDUAL_ID as IND_ID
from {{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA") }}.{{ var("SNOWFLAKETBLNAME") }}  a
inner join {{ref('c3_compliant_M1_DSIID_CMID_DSXXXX')}} b
on a.CMID = b.CMID
