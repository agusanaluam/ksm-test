SELECT 
    tb.customerNumber,
    count(tb.productLine) total_production_line
FROM
    (select 
        o.customerNumber, 
        o.orderNumber, 
        od.productCode, 
        p.productLine 
    from orders o 
    LEFT join orderdetails od 
        on o.orderNumber=od.orderNumber 
    LEFT join products p 
        on od.productCode=p.productCode 
    WHERE p.productLine = "Classic Cars" 
    ORDER BY o.customerNumber) as tb 
GROUP BY tb.customerNumber 
HAVING count(tb.productLine) > 23;


