-- macros/bronze_enhance_parking.sql
{% macro bronze_enhance_parking(base_data) %}
    SELECT
        *,
        EXTRACT(YEAR FROM CURRENT_DATE) - vehicle_year AS vehicle_age,
        CASE 
            WHEN violation_county = 'MN' THEN TRUE
            ELSE FALSE
        END AS is_manhattan_96th_st_below
    FROM {{ base_data }}
{% endmacro %}