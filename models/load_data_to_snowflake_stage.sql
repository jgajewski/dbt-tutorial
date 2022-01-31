COPY INTO {{ var("SNOWFLAKESTAGEOUTBOUND") }}/{{ var("SNOWFLAKETBLNAME") }}_audience_m1.tsv.gz
FROM (select distinct IND_ID
from {{ref('convert_cmid_to_M1ID')}}
file_format=(format_name='{{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA2") }}.{{ var("FILEFORMATOUTBOUND") }}' file_extension=tsv COMPRESSION = 'GZIP') 
header=true 
single=true
max_file_size=5368709120
;

