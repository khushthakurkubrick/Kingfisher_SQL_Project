select num_loans, count(table_a.account_id) from
(select account_id, count(*) as num_loans from banking.loan
group by account_id) as table_b
right outer join 
(select banking.disp.account_id from banking.client inner join banking.disp
on banking.client.client_id = banking.disp.client_id) as table_a
on table_b.account_id = table_a.account_id
group by num_loans

-- 4542 acocunts have 0 loans ever in the time studied, and 827 accounts have 1 loan
-- no accounts have 2 loans

