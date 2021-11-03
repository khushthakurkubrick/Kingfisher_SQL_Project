select a3, sum(a4) as total_inhabitants, sum(cast(a14 as float)/1000*a4) as num_entrepeneur
, sum(cast(a14 as float)/1000*a4)/sum(a4)*100 as percentage_entrepeneur
from banking.district
group by a3




