-- custom generic tests: check no null in columns
-- programming in jinja!
-- the code in jinja and dbt macro loosely translated to

-- def no_nulls_in_columns(model):
--     for col in adapter.get_columns_in_relation(model):
-- # check if the columnname is Null
--         if col.column is None:


{% macro no_nulls_in_columns(model) %}
    SELECT * FROM {{ model }} WHERE 
    {% for col in adapter.get_columns_in_relation(model) -%}
        {{ col.column }} IS NULL OR
    {% endfor %}
    FALSE
{% endmacro %}
