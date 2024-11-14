
  create or replace   view AIRBNB.DEV.dim_hosts_cleansed
  
   as (
    
with  __dbt__cte__src_hosts as (
WITH raw_hosts AS (
    SELECT
        *
    FROM
       AIRBNB.RAW.RAW_HOSTS
)
SELECT
    id AS host_id,
    NAME AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM
    raw_hosts
), src_hosts as (
    SELECT * FROM __dbt__cte__src_hosts

)
SELECT
HOST_ID,
NVL(HOST_NAME, 'Anonymous') AS host_name,
is_superhost,
CREATED_AT,
UPDATED_AT
from src_hosts
  );

