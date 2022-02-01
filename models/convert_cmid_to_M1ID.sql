{{ config(materialized='table')}}

select distinct b.INDIVIDUAL_ID as IND_ID
from  {{ref('SHARED_QUBOLE_AUDIENCES')}}  a
inner join {{ref('c3_compliant_M1_DSIID_CMID_DSXXXX')}} b
on a.CMID = b.CMID
where a.FILENAME = '{{ var("FILENAME") }}'
and a.LOAD_DATE = '{{ var("LOADDATE") }}'