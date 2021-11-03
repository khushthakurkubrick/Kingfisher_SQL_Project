-- number of unpaid loans & unemployment rate  in 95 and 96
select * from
(select a3 as region, status, count(*) as num_of_loans
from banking.loan
inner join banking.account
on banking.account.account_id = banking.loan.account_id
inner join banking.district
on banking.account.district_id = banking.district.a1
group by a3, status
having status in ('b', 'd')) as table_a

inner join 

(SELECT DISTINCT A3 as Region, CAST( (AVG(A12)+ avg(A13))/2 AS DECIMAL(10,2)) 
As UnempRate95and96
FROM banking.district
GROUP BY A3) as table_b
on table_a.region = table_b.region




-- number of paid loans & unemployment rate  in 95 and 96
select * from
(select a3 as region, status, count(*) as num_of_loans
from banking.loan
inner join banking.account
on banking.account.account_id = banking.loan.account_id
inner join banking.district
on banking.account.district_id = banking.district.a1
group by a3, status
having status in ('a', 'c')) as table_a

inner join 

(SELECT DISTINCT A3 as Region, CAST( (AVG(A12)+ avg(A13))/2 AS DECIMAL(10,2)) 
As UnempRate95and96
FROM banking.district
GROUP BY A3) as table_b
on table_a.region = table_b.region