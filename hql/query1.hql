# Find users with highets withdrawal, sorting the output by number of transactions
select cif,sum(amount) as total_txn_value,count(cif) as num_txns
from realtimebank.customer_txns
where txn_code='W' 
group by cif 
order by count(cif) DESC;
