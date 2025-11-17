-- main_query.sql
-- Esta query combina todas as tabelas dimensionais com a tabela FATO central (FACT_Orders).
-- Chave de Ligação principal: 'Id' (ID do Pedido)

SELECT
    o.Id AS Order_PK,
    o.Order_Date,
    o.Total,
    o.payment,
    o.Purchase_Status,
    
    -- Dados de Logística (DIM_Delivery)
    d.Services AS Delivery_Service_Type,
    d.P_Sevice AS Freight_Value,
    d.D_Forecast AS Delivery_Forecast_Date,
    d.D_Date AS Delivery_Date,
    
    -- Detalhes do Produto/Item (DIM_Shopping e DIM_Products)
    s.Quantity AS Item_Quantity,
    p.Category AS Product_Category,
    p.Subcategory AS Product_Subcategory,
    
    -- Detalhes do Cliente (DIM_Customer)
    c.Region AS Customer_Region
    
FROM FACT_Orders o
-- Junções usando 'Id' como chave de Pedido
JOIN DIM_Delivery d ON o.Id = d.Id
JOIN DIM_Shopping s ON o.Id = s.Id 
JOIN DIM_Customer c ON o.Id = c.Id
-- Junção especial: Usa o nome do produto
JOIN DIM_Products p ON s.Product = p.Product_Name;