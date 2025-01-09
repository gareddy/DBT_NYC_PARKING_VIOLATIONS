WITH yearly_code_summary AS (
    SELECT
        EXTRACT(YEAR FROM issue_date) AS violation_year,
        violation_code,
        code_description,
        COUNT(*) AS violation_count,
        SUM(fee_usd) AS total_fees_collected
    FROM
        {{ ref('silver_violations_tickets') }}
    WHERE
        EXTRACT(YEAR FROM issue_date) < 2024
    GROUP BY
        violation_year,
        violation_code,
        code_description
)
SELECT
    violation_year,
    violation_code,
    code_description,
    violation_count,
    total_fees_collected
FROM
    yearly_code_summary
WHERE
    violation_code IN (
        SELECT violation_code
        FROM yearly_code_summary
        GROUP BY violation_code
        ORDER BY SUM(violation_count) DESC
        LIMIT 5
    )
ORDER BY
    violation_year,
    violation_code