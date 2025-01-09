WITH violations_2022 AS (
    SELECT * FROM {{ ref('bronze_parking_violations_2022') }}
),
violations_2023 AS (
    SELECT * FROM {{ ref('bronze_parking_violations_2023') }}
),
violations_2024 AS (
    SELECT * FROM {{ ref('bronze_parking_violations_2024') }}
),
all_violations AS (
    SELECT * FROM violations_2022
    UNION ALL
    SELECT * FROM violations_2023
    UNION ALL
    SELECT * FROM violations_2024
)
SELECT * FROM all_violations