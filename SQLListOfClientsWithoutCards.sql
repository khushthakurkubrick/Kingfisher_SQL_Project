SELECT client_id FROM Banking.[client]
EXCEPT
SELECT cl.client_id 
FROM Banking.[card] as ca
INNER JOIN Banking.[disp] as disp
ON disp.disp_id = ca.disp_id
INNER JOIN Banking.[client] as cl
ON disp.client_id = cl.client_id



