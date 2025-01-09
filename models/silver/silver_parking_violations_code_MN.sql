WITH manhattan_violation_codes AS (
    SELECT
        violation_code,
        code_description,
        TRUE AS is_manhattan_96th_st_below,
        manhattan_96th_st_below AS fee_usd,
        rate_type
    FROM
        {{ ref('bronze_parking_violations_code') }}
),
all_other_violation_codes AS (
    SELECT
        violation_code,
        code_description,
        FALSE AS is_manhattan_96th_st_below,
        all_other_areas AS fee_usd,
        rate_type
    FROM
        {{ ref('bronze_parking_violations_code') }}
)

SELECT * FROM manhattan_violation_codes
UNION ALL
SELECT * FROM all_other_violation_codes
ORDER BY fee_usd ASC