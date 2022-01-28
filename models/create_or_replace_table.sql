create or replace table {{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA") }}.{{ var("SNOWFLAKETBLNAME") }} 
(
CMID varchar(34)
, Load_Date varchar(10)
);