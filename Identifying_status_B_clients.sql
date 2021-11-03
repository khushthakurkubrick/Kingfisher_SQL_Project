select * from banking.loan
where status = 'B'
-- 31 of 682 loans were unpaid after contract expiry

select avg(amount) as avgamountloanunpaid from banking.loan
where status = 'B'
select avg(amount) as avgamountloanpaid from banking.loan
where status = 'A'
-- average loan unpaid (B) was 140720, avereage loan paid (A) was 91641

select avg(amount) as avgloancurrentlyindebt from banking.loan
where status = 'D'
select avg(amount) as avgloanoksofar from banking.loan
where status = 'C'
-- average loan for clients currently in debt was 249284, average loan for clients
-- who are on track to pay their off was 171410.
-- therefore bank needs to stop lending out such big amounts of money, or do better
-- risk stratifications

select year(date), count(*) as num_unpaidloans from banking.loan
where status = 'B'
group by year(date)

-- loans given out at 1994 comprised of the most unpaid loans... why?
--other years were in general pretty stable 


select duration, count(*) as num_unpaidloans from banking.loan
where status = 'B'
group by duration

select duration, count(*) as num_paidloans from banking.loan
where status = 'A'
group by duration

-- short loans were more risky than longer loans 
-- but there were more short loans than long

select tableA.duration, num_unpaidloans,num_paidloans, 
(cast(num_unpaidloans as float))/(cast (num_paidloans as float))*100 as percentageunpaid from
(select duration, count(*) as num_unpaidloans from banking.loan
where status = 'B'
group by duration) as tableA
inner join 
(select duration, count(*) as num_paidloans from banking.loan
where status = 'A'
group by duration) as tableB
on tableA.duration = tableB.duration

--percentage of unpaid loans were highest in the 36 months category,
-- lowest in the 12 month category.

select year(loanenddate) as year, count(*) as unpaidloan_atenddate from
(select *, dateadd(month, duration, date) as loanenddate from banking.loan
where status = 'B') as tablea
group by year(loanenddate)

-- people struggled the most to pay off loans in 1997 and 1998.

















