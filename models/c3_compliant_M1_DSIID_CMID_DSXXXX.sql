
select x.INDIVIDUAL_ID, x.CMID
from {{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA2") }}.M1_DSIID_CMID_DS{{ var("DSUPDATE") }} x
left join {{ var("CONSUMERCHOICE") }}  y
on x.individual_id = y.DS_IID
where y.DS_IID is NULL
