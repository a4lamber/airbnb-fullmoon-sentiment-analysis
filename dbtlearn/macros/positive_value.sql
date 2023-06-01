-- custom test, making sure everything is postive 
-- by selecting negative cases

{% test positive_value(model, column_name) %}
SELECT
    *
FROM
    {{ model }}
WHERE 
    {{ column_name }} < 1
{% endtest %}