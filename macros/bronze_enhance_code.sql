-- macros/bronze_enhance_code.sql
{% macro bronze_enhance_code() %}
    *,
    CASE
        WHEN manhattan_96th_st_below = all_other_areas THEN 'Uniform Rate'
        ELSE 'Different Rate'
    END AS rate_type
{% endmacro %}