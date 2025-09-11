SELECT
  DATE_TRUNC(date_date, MONTH) AS datemonth,

  SUM(COALESCE(operational_margin, 0)) - SUM(COALESCE(ads_cost, 0)) AS ads_margin,
  ROUND(SUM(revenue) / NULLIF(SUM(nb_transactions), 0), 2)          AS average_basket,
  SUM(operational_margin)                                           AS operational_margin,
  SUM(ads_cost)                                                     AS ads_cost,
  SUM(ads_impression)                                               AS ads_impression,
  SUM(ads_clicks)                                                   AS ads_clicks,
  SUM(quantity)                                                     AS quantity,
  SUM(revenue)                                                      AS revenue,
  SUM(purchase_cost)                                                AS purchase_cost,
  SUM(margin)                                                       AS margin,
  SUM(shipping_fee)                                                 AS shipping_fee,
  SUM(log_cost)                                                     AS log_cost,
  SUM(ship_cost)                                                    AS ship_cost
FROM {{ ref('int_campaigns_day') }}
FULL OUTER JOIN {{ ref('finance_days') }}
USING (date_date)
GROUP BY 1
ORDER BY 1 DESC
