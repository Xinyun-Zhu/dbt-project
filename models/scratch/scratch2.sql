{% set animals=['lemur','rhion','dingo'] %}
{% for animal in animals %}
select '{{animal}}' as animal {% if not loop.last %} union all {% endif %}
{% endfor %}
