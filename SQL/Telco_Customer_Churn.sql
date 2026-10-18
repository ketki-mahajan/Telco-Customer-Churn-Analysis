CREATE DATABASE telco_churn;

USE telco_churn;

select count(*) as total_customers
from telco_customer_churn;

select count(*) as churned_customers
from telco_customer_churn
where churn = 'Yes';

select count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*), 2)
as churn_rate_percent
from telco_customer_churn;

select contract, count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*), 2)
as churn_rate_percent
from telco_customer_churn
group by contract
order by churn_rate_percent desc;

select InternetService, count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*), 2)
as churn_rate_percent
from telco_customer_churn
group by InternetService
order by churn_rate_percent desc;

select PaymentMethod, count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*), 2)
as churn_rate_percent
from telco_customer_churn
group by PaymentMethod
order by churn_rate_percent desc;


select
case
when tenure <= 12 then '0-1 year'
when tenure <= 24 then '1-2 year'
when tenure <= 48 then '2-4 year'
when tenure <= 60 then '4-5 year'
else '5+ years'
end as tenure_group,
count(*) as total_customers,
sum(case when churn = 'yes' then 1 else 0 end) as churned_customers,
round(sum(case when churn = 'yes' then 1 else 0 end) * 100.0 / count(*), 2)
as churn_rate_percent
from telco_customer_churn
group by tenure_group
order by churn_rate_percent desc;


select
churn,
count(*) as total_customers,
round (avg(MonthlyCharges), 2) as avg_monthly_charges,
round (avg(TotalCharges), 2) as avg_total_charges
from telco_customer_churn
group by churn;























































