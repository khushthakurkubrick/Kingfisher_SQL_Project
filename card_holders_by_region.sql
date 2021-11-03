select a3, count(*) as num_cards from banking.card
inner join banking.disp
on banking.card.disp_id = banking.disp.disp_id
inner join banking.account
on banking.account.account_id = banking.disp.account_id
inner join banking.district
on banking.district.A1 = banking.account.district_id
group by a3
