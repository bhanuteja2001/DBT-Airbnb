
WITH  __dbt__cte__src_reviews as (
WITH raw_reviews AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_REVIEWS
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
SELECT * FROM src_reviews
WHERE review_text is not null


  AND review_date > (select max(review_date) from AIRBNB.DEV.fct_reviews)
