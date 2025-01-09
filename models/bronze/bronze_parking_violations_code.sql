WITH base_data AS (
    SELECT 
        {{ bronze_cast_code() }}
    FROM {{ source('PARKING_SCHEMA', 'PARKING_VIOLATIONS_CODE') }}
),
categorized_data AS (
    SELECT
        {{ bronze_enhance_code() }}
    FROM base_data
)
SELECT
    violation_code,
    code_description,
    manhattan_96th_st_below,
    all_other_areas,
    rate_type
FROM categorized_data