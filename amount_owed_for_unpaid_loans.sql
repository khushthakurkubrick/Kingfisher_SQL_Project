select *, ((amount - tot_paid)/amount)*100 as pct_missing
from
(
select account_id, amount, duration, amount/duration as raw_payments, payments, sum(payments) as tot_paid, avg(t.balance) as avg_balance
from
(
	select l.account_id, t.date, l.amount, l.duration, l.payments as monthly_due, t.amount as payments, max(t.date) over (partition by t.account_id) as date_end, t.balance
	from banking.trans as t
	join banking.loan as l
	on t.account_id = l.account_id and t.amount = l.amount/l.duration
	where status = 'A'
) as t
group by account_id, amount, duration, payments
) as x
order by pct_missing
