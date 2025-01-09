SELECT
    CAST(violations.summons_number AS STRING) AS summons_number,
    violations.registration_state,
    violations.plate_type,
    violations.issue_date,
    violations.vehicle_body_type,
    violations.vehicle_make,
    violations.vehicle_expiration_date,
    CAST(violations.violation_precinct AS STRING) AS violation_precinct,
    CAST(violations.issuer_precinct AS STRING) AS issuer_precinct,
    violations.issuer_squad,
    violations.violation_time,
    violations.violation_county,
    violations.vehicle_color,
    violations.vehicle_year,
    violations.vehicle_age,
    codes.violation_code AS violation_code,
    codes.code_description,
    codes.fee_usd,
    codes.rate_type
FROM
    {{ ref('silver_merge_all_parking_violations_MN') }} AS violations
LEFT JOIN
    {{ ref('silver_parking_violations_code_MN') }} AS codes 
ON
    violations.violation_code = codes.violation_code 
    AND violations.is_manhattan_96th_st_below = codes.is_manhattan_96th_st_below
WHERE
    violations.issue_date IS NOT NULL
    AND violations.summons_number IS NOT NULL
    AND violations.registration_state IS NOT NULL
    AND violations.plate_type IS NOT NULL
    AND violations.vehicle_body_type IS NOT NULL
    AND violations.vehicle_make IS NOT NULL
    AND violations.vehicle_expiration_date IS NOT NULL
    AND violations.violation_precinct IS NOT NULL
    AND violations.issuer_precinct IS NOT NULL
    AND violations.issuer_squad IS NOT NULL
    AND violations.violation_time IS NOT NULL
    AND violations.violation_county IS NOT NULL
    AND violations.vehicle_color IS NOT NULL
    AND violations.vehicle_year IS NOT NULL
    AND violations.vehicle_age IS NOT NULL
    AND codes.violation_code IS NOT NULL
    AND codes.code_description IS NOT NULL
    AND codes.fee_usd IS NOT NULL
    AND codes.rate_type IS NOT NULL