
-- together 
select A2 as districtname, A3 as region, A15 as crimes95, A16 as crime96 from banking.district
group by A2, A3, A15, A16
order by A15 desc, A16 desc 

-- 95
select  A2 as districtname, A3 as region, A15 as crimes95 from banking.district
group by A2, A3, A15
order by A15 desc

--96 
select A2 as districtname, A3 as region, A16 as crime96 from banking.district
group by A2, A3, A16
order by A16 desc 
