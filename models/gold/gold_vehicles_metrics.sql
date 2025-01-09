SELECT
    code_description,
    violation_code,
    COUNT(summons_number) AS ticket_count,
    SUM(fee_usd) AS total_revenue_usd
FROM
    {{ref('silver_violations_tickets')}}
WHERE
    fee_usd IS NOT NULL
GROUP BY
    violation_code, code_description
ORDER BY
    total_revenue_usd DESC