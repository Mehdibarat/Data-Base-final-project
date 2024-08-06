use baxi;

-- Q1
select Driver.*
from Driver, Baxi_Car  
where national_id = driver_national_id and bcname = 'pride' and color = 'blue';


-- Q2
select Driver.*
from Driver join Baxi_Car on national_id = driver_national_id 
where  sex = 'female' and age > 30 and  color = 'blue' and car_type = 'sedan';


-- Q3
select fname, lname, judicial_Confirmation_letter_date, judicial_Confirmation_number, certificate_confirmation_date, certificate_number
from Driver, BaxiBar_Car, Confirmation, Judicial_Confirmation 
where Driver.national_id = BaxiBar_Car.driver_national_id and Driver.national_id = Confirmation.driver_national_id 
	  and Driver.national_id = Judicial_Confirmation.driver_national_id and car_type = 'truck';


-- Q4
select distinct Customer.*
from Customer, Customer_Address
where  wallet >= 50000 and  phone_number in (select cphone_number
				                             from Customer, Customer_Address
					                         where Customer.phone_number = Customer_Address.cphone_number
                                             group by cphone_number
                                             having count(*) >= 2);
                                             

-- Q5
select date(req_time)
from Trip, Customer, Baxi_Service
where Customer.phone_number = Trip.cphone_number and Trip.id = Baxi_Service.trip_id 
	  and Trip.cphone_number = Baxi_Service.cphone_number and round_trip = 'yes' 
      and age <= 18 and age >= 15 
group by date(req_time) 
order by count(*) asc
limit 1;


-- Q6
select fname, lname, national_id, wallet 
from Driver join Accept_Payment on Driver.national_id = Accept_Payment.driver_national_id
where start_trip_time >= '2024-01-01 00:00:00' and  start_trip_time < '2024-01-02 00:00:00'
group by fname, lname, national_id, wallet 
having count(*) >= 2;


-- Q7
select fname, lname, sum(Transactions.cost)
from Customer, Trip, Accept_Payment, Transactions
where Customer.phone_number = Trip.cphone_number and Trip.id = Accept_Payment.trip_id and Trip.cphone_number = Accept_Payment.cphone_number 
      and Transactions.id = Accept_Payment.transaction_id and timediff(end_trip_time , start_trip_time) > '02:00:00' 
	  and start_trip_time >= date_sub(now(), interval 1 week)
group by phone_number, fname, lname;


-- Q8
select fname, lname, age
from Driver, BaxiBar_Car, Accept_Payment
where Driver.national_id = BaxiBar_Car.driver_national_id and car_type = 'truck' and disability_type = 'deafness'
      and fuel_type = 'gas' and Driver.national_id = Accept_Payment.driver_national_id and  age > all(select avg(age) as age
																								      from Driver) 
group by national_id, fname, lname, age
having count(*) > all (select count(*)
				   from Driver, Baxi_Car, Accept_Payment 
                   where Driver.national_id = Baxi_Car.driver_national_id and Driver.national_id = Accept_Payment.driver_national_id 
						 and capacity >= 4
                   group by national_id);


-- Q9
select plaque, fname, lname
from  Driver, BaxiBar_Car, Accept_Payment, Trip, BaxiBar_Service
where Driver.national_id = BaxiBar_Car.driver_national_id and Driver.national_id = Accept_Payment.driver_national_id
	  and Accept_Payment.cphone_number = Trip.cphone_number and Accept_Payment.trip_id = Trip.id
      and Trip.cphone_number = BaxiBar_Service.cphone_number and Trip.id = BaxiBar_Service.trip_id
      and product_type = 'breakable' and product_cost <= 50000000;                  


-- Q11
select fname, lname, phone_number
from Customer join Transactions on Transactions.cphone_number = Customer.phone_number
where phone_number in (select Trip.cphone_number
					   from Trip, Accept_Payment
                       where  Accept_Payment.cphone_number = Trip.cphone_number and Accept_Payment.trip_id = Trip.id 
							  and timediff(end_trip_time , start_trip_time) > '01:00:00'
                       group by Trip.cphone_number     
                       having count(*) <= 2)
group by fname, lname, phone_number                       
having sum(cost) > 100000;


-- Q12
select count(case when tracking_steps = 'intercepted' then 1 end) * 100.0 / count(*)
from Accept_Payment;


-- Q13
select count(*)
from Employee
where degree in ('bachelor','master','doc','pos doc') and salary > 5000000 
	  and employeement_date <= date_sub(now(), interval 1 year) and position not in ('dep manager' );


-- Q14
select fname, lname, bcname, sum(cost)
from Driver, Baxi_Car, Transactions, Accept_Payment
where Driver.national_id = Baxi_Car.driver_national_id and Driver.national_id = Transactions.driver_national_id
	  and Driver.national_id = Accept_Payment.driver_national_id and withdrawal_type = 'cash' and production_year < 2009
group by fname, lname, bcname      
order by count(*) asc
limit 3;


-- Q15
select (count(T.id) - count(Trip.id)) * 100.0 / count(Trip.id)
from Trip as T, Accept_Payment join Trip  on Trip.cphone_number = Accept_Payment.cphone_number and Trip.id = Accept_Payment.trip_id
where Trip.origin_city = 'shar ray' and t.origin_city = 'shar ray';    
  
  
-- Q16
select Driver.*
from BaxiBox_Motorcycle, Accept_Payment, Driver
where Driver.national_id = Accept_Payment.driver_national_id and Driver.national_id = BaxiBox_Motorcycle.driver_national_id
      and timediff(end_trip_time , start_trip_time) < estimate_time 
order by timestampdiff(second, estimate_time, timediff( end_trip_time , start_trip_time)) desc
limit 10;


-- Q20
select Driver.*
from Driver, Baxi_Car, Confirmation, Judicial_Confirmation
where Driver.national_id = Baxi_Car.driver_national_id and Driver.national_id = Confirmation.driver_national_id
	  and Driver.national_id = Judicial_Confirmation.driver_national_id and car_type = 'sedan' 
      and certificate_confirmation_date >= date_sub(now(), interval 2 month) and judicial_Confirmation_letter_date >= DATE_SUB(now(), interval 2 month)
      and Driver.national_id in (select Accept_Payment.driver_national_id
								 from Accept_Payment, Trip, Customer
								 where Trip.cphone_number = Accept_Payment.cphone_number and Trip.id = Accept_Payment.trip_id
									   and Customer.phone_number = Trip.cphone_number and sex = 'male'
								 GROUP BY driver_national_id
								HAVING COUNT(*) <= 3)
      and Driver.national_id in (select Accept_Payment.driver_national_id
								 from Trip join Accept_Payment on Trip.cphone_number = Accept_Payment.cphone_number and Trip.id = Accept_Payment.trip_id
			                     where req_time >= '2024-01-01 00:00:00' and  req_time < '2024-02-22 00:00:00' and score_to_driver > 3
								 GROUP BY driver_national_id);

