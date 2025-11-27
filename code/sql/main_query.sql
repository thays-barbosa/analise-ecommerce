-- main_query.sql
-- Consulta SQL para juntar as tabelas principais e calcular as features de KPI.
-- Esta consulta simula o processo de Feature Engineering realizado no Python.

WITH Orders_Delivery AS (
    -- 1. Juntar FACT_Orders e DIM_Delivery
    SELECT
        T1.Id AS Order_ID,
        T1.Order_Date,
        T1.Discount,
        T1.Subtotal,
        T1.Total,
        T1.payment AS Payment_Method,
        T1.Purchase_Status,
        T2.Services AS Delivery_Service,
        T2.P_Sevice AS Freight_Cost,
        T2.D_Forecast,
        T2.D_Date,
        T2.Status AS Delivery_Status
    FROM
        FACT_Orders T1
    LEFT JOIN
        DIM_Delivery T2 ON T1.Id = T2.Id
),
Orders_Customer AS (
    -- 2. Juntar Orders_Delivery e DIM_Customer
    SELECT
        T1.*,
        T2.UF,
        T2.Region
    FROM
        Orders_Delivery T1
    LEFT JOIN
        DIM_Customer T2 ON T1.Order_ID = T2.Id
),
Orders_Features AS (
    -- 3. Feature Engineering (Cálculo de KPIs)
    SELECT
        *,
        -- delivery_delay_days = (D_Date − D_Forecast).days
        -- Nota: A função JULIANDAY é específica do SQLite. Em outros SGBDs, usar DATEDIFF.
        CAST(JULIANDAY(D_Date) - JULIANDAY(D_Forecast) AS INTEGER) AS delivery_delay_days,
        -- delivery_lead_time = (D_Date − Order_Date).days
        CAST(JULIANDAY(D_Date) - JULIANDAY(Order_Date) AS INTEGER) AS delivery_lead_time,
        -- is_late = 1(D_Date > D_Forecast)
        CASE WHEN D_Date > D_Forecast THEN 1 ELSE 0 END AS is_late,
        -- is_confirmed = 1(Purchase_Status=="Confirmado")
        CASE WHEN Purchase_Status = 'Confirmado' THEN 1 ELSE 0 END AS is_confirmed,
        -- freight_share = P_Service / Total
        Freight_Cost / Total AS freight_share,
        -- discount_abs = Discount * Subtotal
        Discount * Subtotal AS discount_abs,
        -- Sazonalidade
        STRFTIME('%m', Order_Date) AS Order_Month,
        STRFTIME('%Y', Order_Date) AS Order_Year
    FROM
        Orders_Customer
)
-- 4. Seleção final (sem a parte de Mix, que é mais complexa em SQL sem uma chave clara)
SELECT
    Order_ID,
    Order_Date,
    Discount,
    Subtotal,
    Total,
    Payment_Method,
    Purchase_Status,
    Delivery_Service,
    Freight_Cost,
    D_Forecast,
    D_Date,
    Delivery_Status,
    UF,
    Region,
    delivery_delay_days,
    delivery_lead_time,
    is_late,
    is_confirmed,
    freight_share,
    discount_abs,
    Order_Month,
    Order_Year
FROM
    Orders_Features;
