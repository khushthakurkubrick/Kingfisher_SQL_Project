--SELECT * FROM Banking.[account]
--SELECT * FROM Banking.[card]

--
--SELECT * FROM Banking.[district]
--SELECT * FROM Banking.[client]
--SELECT * FROM Banking.[disp]
--SELECT * FROM Banking.[loan]
--SELECT TOP 100 * FROM Banking.[trans]

SELECT client_id FROM Banking.[client]
EXCEPT
SELECT cl.client_id as clients_with_loans
FROM Banking.[loan] as l
INNER JOIN Banking.[disp]
ON l.account_id = disp.account_id
INNER JOIN Banking.[client] as cl
ON disp.client_id = cl.client_id
