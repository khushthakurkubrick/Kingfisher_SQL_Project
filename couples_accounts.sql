


--select *
--from
--(
--select *, lead(type) over (order by d.account_id) as lag_type 
--from banking.client as c
--left outer join banking.disp as d
--on c.client_id = d.client_id
--left outer join banking.account as a
--on a.account_id = d.account_id
--) as t
--where type ='OWNER' and lag_type = 'DISPONENT'


select * from banking.client


select * from banking.account as a
left outer join banking.disp as d
on a.account_id = d.account_id
left outer join banking.client as c
on c.client_id = d.client_id

select * from banking.disp



select frequency, count(frequency)
(




select frequency, count(frequency)
from
(
select *
from
(
select a.account_id, a.district_id, a.frequency, d.type, lead(type) over (order by d.account_id) as lead_type 
from banking.account as a
left outer join banking.disp as d
on a.account_id = d.account_id
) as t
where type ='OWNER' and lead_type = 'DISPONENT'
) as x
group by frequency



--select count(c.client_id) as client_count, d.account_id, birth_
--from banking.client as c
--left outer join banking.disp as d
--on c.client_id = d.client_id
--left outer join banking.account as a
--on a.account_id = d.account_id
--group by d.account_id
