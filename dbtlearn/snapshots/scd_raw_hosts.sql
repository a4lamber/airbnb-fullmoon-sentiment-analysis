{% snapshot scd_raw_hosts %}
-- scd: slowly changing dimensions
{{
   config(
       target_schema='dev',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       invalidate_hard_deletes=True
   )
}}
-- jinja template
select * FROM {{ source('airbnb', 'hosts')}}

{% endsnapshot %}

