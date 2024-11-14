{{
    config(
        materialized = 'view'
    )
}}
with src_hosts as (
    SELECT * FROM {{ref("src_hosts")}}

)
SELECT
HOST_ID,
NVL(HOST_NAME, 'Anonymous') AS host_name,
is_superhost,
CREATED_AT,
UPDATED_AT
from src_hosts
