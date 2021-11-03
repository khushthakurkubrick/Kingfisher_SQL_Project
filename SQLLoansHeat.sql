-- number of unpaid loans 
select a2 as district, status, count(*) as num_of_loans
from banking.loan
inner join banking.account
on banking.account.account_id = banking.loan.account_id
inner join banking.district
on banking.account.district_id = banking.district.a1
WHERE status in ('b', 'd')
group by a2, status



-- number of paid loans 
select a2 as district, status, count(*) as num_of_loans
from banking.loan
inner join banking.account
on banking.account.account_id = banking.loan.account_id
inner join banking.district
on banking.account.district_id = banking.district.a1
WHERE status in ('a', 'c')
group by a2, status

