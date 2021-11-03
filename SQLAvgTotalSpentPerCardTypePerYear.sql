--SELECT * FROM Banking.[account]
--SELECT * FROM Banking.[card]
----SELECT * FROM Banking.[client]
--SELECT * FROM Banking.[disp]
----SELECT * FROM Banking.[district]
----SELECT * FROM Banking.[loan]
--SELECT TOP 100 * FROM Banking.[trans]


SELECT DISTINCT type, amount_spent_per_year/(num_card_holders) as AvgSpentInKorunaPerYear, amount_spent_per_year/(57*num_card_holders) as AvgSpentInPoundsPerYear, num_card_holders
FROM
(
SELECT c.type, SUM(amount)/5 AS amount_spent_per_year, COUNT(DISTINCT c.card_id) as num_card_holders
FROM Banking.[card] as c
INNER JOIN Banking.[disp] as disp
ON c.disp_id = disp.disp_id 
INNER JOIN Banking.[trans] as tr
ON tr.account_id = disp.account_id
WHERE tr.type IN ('VYDAJ','VYBER') AND tr.operation = 'VYBER'
GROUP BY  c.type 
) as t
GROUP BY type, amount_spent_per_year, num_card_holders


