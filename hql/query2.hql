#Number of transactions per user
select cif,count(cif) as num_txns from realtimebank.customer_txns group by cif;
