-- macros/bronze_cast_code.sql
{% macro bronze_cast_code() %}
    CAST(code AS INT) AS violation_code,
    UPPER(TRIM(definition)) AS code_description,
    CAST(manhattan_96th_st_below AS INT) AS manhattan_96th_st_below,
    CAST(all_other_areas AS INT) AS all_other_areas
{% endmacro %}