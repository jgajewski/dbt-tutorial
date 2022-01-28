COPY INTO {{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA") }}.{{ var("SNOWFLAKETBLNAME") }} 
FROM ( 
    select $1
        , '{{ var("LOADDATE") }}'
    from '{{ var("SNOWFLAKESTAGEINBOUND") }}/{{ var("FILENAME") }}'
    )
FILE_FORMAT = '{{ var("SNOWFLAKEDB") }}.{{ var("SNOWFLAKESCHEMA") }}.{{ var("FILEFORMATINBOUND") }}'
ON_ERROR = 'SKIP_FILE';