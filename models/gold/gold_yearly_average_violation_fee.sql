WITH yearly_avg_fee AS (
    SELECT
        EXTRACT(YEAR FROM issue_date) AS violation_year,
        AVG(fee_usd) AS average_fee
    FROM
        {{ ref('silver_violations_tickets') }}
    WHERE
        EXTRACT(YEAR FROM issue_date) < 2024
    GROUP BY
        violation_year
)
SELECT
    violation_year,
    average_fee
FROM
    yearly_avg_fee
ORDER BY
    violation_year