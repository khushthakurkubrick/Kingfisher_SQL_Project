select account_id, max(balance) as maxbalance, min(balance) as minbalance from banking.trans
group by account_id
order by max(balance) desc
--order by min(balance)


-- lowest balance at any given time belongs to account 3326
-- higheset balance at any given time belongs to account 10520
-- we need to sort them out by date which i'm struggling with














