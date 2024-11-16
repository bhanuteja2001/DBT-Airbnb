
WITH  __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT
        *
    FROM
        AIRBNB.raw.raw_reviews
)
SELECT
    LISTING_ID,
    DATE AS REVIEW_DATE,
    REVIEWER_NAME,
    COMMENTS AS REVIEW_TEXT,
    SENTIMENT AS REVIEW_SENTIMENT
    
FROM
    raw_reviews
), src_reviews AS (
  SELECT * FROM __dbt__cte__src_reviews
)
SELECT 
  md5(cast(coalesce(cast(listing_id as 
    varchar
), '') || '-' || coalesce(cast(review_date as 
    varchar
), '') || '-' || coalesce(cast(reviewer_name as 
    varchar
), '') || '-' || coalesce(cast(review_text as 
    varchar
), '') as 
    varchar
))
    AS review_id,
  * 
  FROM src_reviews
WHERE review_text is not null

  AND review_date > (select max(review_date) from AIRBNB.DEV.fct_reviews)
