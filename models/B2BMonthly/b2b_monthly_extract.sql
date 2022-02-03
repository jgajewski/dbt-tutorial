with
get_mid as (
    select a.CMID as M1V1_ID, b.* from {{ source('DKB_ASSETS', 'DKB_003_XWALK_COMPOSITE') }} a
        inner join {{ source('SHARED', 'B2B') }}_{{ var("B2BBUILDID") }} b
            on b.INDIVIDUAL_ID = a.DS_IID
    where a.ds_build_id = '{{ var("XWALK_HIGH_DS_BUILD_ID") }}'),

get_iids as (
    select c.DS_IID, d.* {{ source('DKB_ASSETS', 'DKB_003_XWALK_COMPOSITE') }} c
        inner join get_mid d
            on d.M1V1_ID = c.CMID
    where c.ds_build_id = '{{ var("XWALK_HIGH_DS_BUILD_ID") }}'),

amex_cmid as (
    select f.cmid, e.* from get_iids e
        inner join {{ref('c3_compliant_M1_DSIID_CMID_DSXXXX')}} f
            on f.INDIVIDUAL_ID = e.DS_IID)

select * from amex_cmid;
