{{ config(materialized='view') }}

select
dispatching_base_num,

-- identities
cast(pulocationid as integer) as  pickup_locationid,
cast(dolocationid as integer) as dropoff_locationid,

-- timestamps
cast(pickup_datetime as timestamp) as pickup_datetime,
cast(dropoff_datetime as timestamp) as dropoff_datetime,

-- trip info
sr_flag

from {{ source('staging','fhv_tripdata') }}

-- dbt build --m <model.sql> --var 'is_test_run: false'
-- {% if var('is_test_run', default=true) %}

--   limit 100

-- {% endif %}