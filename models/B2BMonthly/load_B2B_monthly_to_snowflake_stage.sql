--copy into @CLIENT_AMEX.M1EE.AMEX_ACXIOM_OUT/B2B${B2B_BUILD_ID}/Amex_Merkle_B2B${B2B_BUILD_ID}
COPY INTO {{ var("SNOWFLAKESTAGEOUTBOUND") }}/B2B{{ var("B2BBUILDID") }}/Amex_Merkle_B2B{{ var("B2BBUILDID") }}.tsv.gz
from
(
 SELECT
  CMID AS Merkle_ID
, PROFESSIONAL_IDENTIFIER
, COMPANY_SITE_IDENTIFIER
, COMPANY_NAME
, CITY
, STATE
, POSTAL_CODE
, JOB_FUNCTION_STANDARD
, JOB_LEVEL_STANDARD
, SALES_VOLUME_RANGE_LOCATION
, EMPLOYEE_SIZE_RANGE_LOCATION
, SIC_CODE_6
, WORTHINESS_CODE
, NUM_PC_RANGE_CODE
, SQ_FT_RANGE_CODE
, NAICS_CODE
, SIC_CODE_2
, SIC_CODE_4
, ETHNICITY_CODE
, WOMEN_OWNED_BUSINESS_INDICATOR
, ETHNIC_OWNED_BUSINESS_INDICATOR
, BUSINESS_START_YEAR
, FRANCHISE_CODE
, SOHO_FLAG
, SECONDARY_SIC_6
, COMPANY_URL
, MSA_CODE
, SALES_VOLUME_ACTUAL_LOCATION
, EMPLOYEE_SIZE_ACTUAL_LOCATION
, SECONDARY_NAICS_CODE
, PUBLIC_PRIVATE_FLAG
, SALES_VOLUME_ACTUAL_CORPORATE
, SALES_VOLUME_RANGE_CORPORATE
, EMPLOYEE_SIZE_ACTUAL_CORPORATE
, EMPLOYEE_SIZE_RANGE_CORPORATE
, BUSINESS_TYPE
, BUSINESS_LIFECYCLE
, SECONDARY_SIC_4
, SALES_LOCATION_VALUE_TYPE
, EMPLOYEE_LOCATION_VALUE_TYPE
, FIPS_CODE_STATE
, FIPS_CODE_COUNTY
, CBSA_CODE
, SALES_VOL_ACT_CORP_TYPE
, SALES_VOL_ACT_LOC_TYPE
, EMP_SIZE_ACT_CORP_TYPE
, EMP_SIZE_ACT_LOC_TYPE
, SALES_VOLUME_RANGE_CORPORATE_COMPRESSED
, EMPLOYEE_SIZE_RANGE_CORPORATE_COMPRESSED
, EST_CASH
, EST_LT_DEBT
, EST_ST_DEBT
, EST_TOT_ASSETS
, DAYS_BEYOND_TERM_CONF
FROM {{ref('b2b_monthly_extract')}}
)
file_format=(format_name='{{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA2") }}.{{ var("FILEFORMATOUTBOUND") }}_QUOTED' file_extension=tsv COMPRESSION = 'GZIP') 
header=true 
single=false
max_file_size=5368709120
