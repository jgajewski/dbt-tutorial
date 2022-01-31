
select x.INDIVIDUAL_ID, x.CMID
from {{ source('M1EE', 'M1_DSIID_CMID_DS') }}{{ var("DSUPDATE") }} x
left join {{ source('C3_SHARED', 'DS_IID_DELETES_DO_NOT_SELL') }}  y
on x.individual_id = y.DS_IID
where y.DS_IID is NULL
