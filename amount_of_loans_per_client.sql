SELECT * FROM Banking.[account]
SELECT * FROM Banking.[card]
SELECT * FROM Banking.[client]
SELECT * FROM Banking.[disp]
SELECT * FROM Banking.[district]
SELECT * FROM Banking.[loan]
SELECT TOP 100 * FROM Banking.[trans]

SELECT DISTINCT c.client_id, count(loan_id) AS loancnt
FROM banking.client as c
full outer join
banking.disp as d
ON c.client_id = d.client_id
full outer join
banking.loan as l
ON 
l.account_id = d.account_id
GROUP BY c.client_id
order by c.client_id 

