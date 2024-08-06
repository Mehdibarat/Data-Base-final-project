create schema baxi;

create table Baxi.Customer(
fname		    varchar(25)	  					 	              NOT NULL,
lname		    varchar(25)			   			 		   	              ,
sex 		    enum('male','female') 			 	              NOT NULL,
age             int                                               NOT NULL
       check(age >= 15 and age < 100)                                     ,
phone_number    char(13)				 				          NOT NULL,
reg_time   	    datetime              DEFAULT current_timestamp   NOT NULL,
email           varchar(60) 										      ,
wallet          int 	              DEFAULT 0		    		          
    check(wallet >= 0)													  ,
primary key(phone_number)                                                );

create table baxi.Customer_Address(
label 			varchar(15)		                          NOT NULL,
location		float			                          NOT NULL,
cphone_number   char(13)  		                          NOT NULL,
primary key(label ,location ,cphone_number) 	                  ,
foreign key(cphone_number) references baxi.Customer(phone_number)
        on update cascade  		on delete cascade                );

create table baxi.Driver(
fname                        varchar(25)                            NOT NULL,
lname                        varchar(25)                            NOT NULL,
ident_code                   int                                    NOT NULL,
sex                          enum('male','female') 	                NOT NULL,
age                          int                                    NOT NULL
	   check(age >= 18 and age < 100)                                       ,
national_id                  char(15)                               NOT NULL,
sheba_number                 char(30)                               NOT NULL,
distance                     float         DEFAULT 0                        
       check(distance >= 0)                                                 ,
wallet                       int           DEFAULT 0                        
	check(wallet >= -50)													,
score                        float         DEFAULT 5 
       check(score >= 0 and score <= 5)                                     ,
phone_number                 char(13)				                NOT NULL,
national_card_scan           blob                               /*NOT NULL*/,
certificate_scan             blob                               /*NOT NULL*/,
identifier_national_id       char(15)                           /*NOT NULL*/,
prof_image                   blob                               /*NOT NULL*/,
disability_type              varchar(60)   DEFAULT 'no'                     ,
certificate_type             enum('level 1','level 2','level 3','motorcycle','special') 
                                                                    NOT NULL,
certificate_date             date                                   NOT NULL,
act_permission               boolean       DEFAULT 0                NOT NULL,
location                     float                                          ,
zoom_size                    float         DEFAULT 5                        ,
interest_rate                float                                          ,
unique(ident_code)                                                          , 
unique(sheba_number)                                                        ,
primary key(national_id) 	                                                ,
foreign key(identifier_national_id) references baxi.Driver(national_id)
        on update cascade  		on delete restrict                          );

create table baxi.Employee(
fname                 varchar(25)	  			       				NOT NULL,
lname                 varchar(25)	                           				,
employeement_date     datetime        DEFAULT current_timestamp     NOT NULL,
personnel_id          char(15)                         				NOT NULL,                                     
sheba_number          char(30)                         				NOT NULL,
salary                int             DEFAULT 0                				,
username              varchar(25)  			           				NOT NULL,
pass                  varchar(25)      				   				NOT NULL,
skill_level           enum('junior' ,'mid level' ,'senior')    
                                      DEFAULT 'junior'         ,
degree                enum('diploma','adv diploma','bachelor','master','doc','pos doc')
																	NOT NULL,
prof_image            blob                        			    /*NOT NULL*/,
position              enum('dep manager', 'simple','programmer') 
                                                    				NOT NULL,
department            enum('it' ,'financial' ,'development' , 'marketing' , 'support' ,'human resources' ,'etc') 
									 DEFAULT 'etc'             				,
age                   int                              				NOT NULL
	   check(age >= 18 and age < 100)                           				,
national_id                  char(15)                  				NOT NULL,
unique(username)                                               				,
unique(sheba_number)										   				,
unique(national_id)											   				,
primary key(personnel_id)									  				); 

create table baxi.Judicial_Confirmation(
judicial_letter_file                         blob                    	    /*NOT NULL*/,
judicial_Confirmation_letter_date            date                  			    NOT NULL,
judicial_Confirmation_number                 char(25)                           NOT NULL,
employee_personnel_id                        char(15)              				NOT NULL,
driver_national_id                           char(15)                			NOT NULL,
jtime                                        datetime   DEFAULT current_timestamp       ,
primary key(employee_personnel_id,driver_national_id)                       	 		,
foreign key(driver_national_id) references baxi.Driver(national_id)
		on update cascade  		on delete restrict                            			,
foreign key(employee_personnel_id) references baxi.Employee(personnel_id)
		on update cascade  		on delete restrict                            		   );
        
create table baxi.Confirmation(
certificate_confirmation_date     date 		                      	NOT NULL,
final_confirmation_date           date 			                  	NOT NULL,
ctime                             datetime 	DEFAULT current_timestamp     	,
certificate_number                char(25)                          NOT NULL,
car_inspection_date               date                            	NOT NULL,
employee_personnel_id             char(15)                        	NOT NULL,
driver_national_id                char(15)                        	NOT NULL,
primary key(employee_personnel_id,driver_national_id)                     	,
foreign key(driver_national_id) references baxi.Driver(national_id)
		on update cascade  		on delete restrict                          ,
foreign key(employee_personnel_id) references baxi.Employee(personnel_id)
		on update cascade  		on delete restrict                         );
        
create table baxi.BaxiBox_Motorcycle(
bbmname                 varchar(25)	  					      NOT NULL,
production_year         int                                   NOT NULL
	check((production_year >= 1365 and production_year <= 1410) or 
		  (production_year >= 1980 and production_year <= 2030))      ,
capacity                int                                   NOT NULL
	check(capacity <= 150)											  ,
plaque                  char(8)                               NOT NULL,
motorcycle_card_scan    blob                              /*NOT NULL*/,
driver_national_id      char(15)                        	  NOT NULL,
primary key(plaque)                                                   ,
foreign key(driver_national_id) references baxi.Driver(national_id)
		on update cascade  		on delete cascade                    );

create table baxi.BaxiBar_Car(
bbcname 				varchar(25)                           	    NOT NULL,
production_year 		int     							  		NOT NULL	
	check((production_year >= 1365 and production_year <= 1410) or 
		  (production_year >= 1980 and production_year <= 2030))       	    ,
color                   varchar(20)                           		NOT NULL,
plaque                  char(8)                               		NOT NULL,
capacity                int                                   		NOT NULL
	check(capacity <= 7000)  												,
fuel_type               enum('petrol' ,'gasoil' , 'hybrid' ,'electric','gas'),
car_card_scan           blob                                    /*NOT NULL*/,
driver_national_id      char(15)                        	        NOT NULL,
car_type                enum('sedan','truck')                       NOT NULL,
primary key(plaque) 														,
foreign key(driver_national_id) references baxi.Driver(national_id)
		on update cascade  		on delete cascade                    	   );
        
create table baxi.Baxi_Car(
bcname 					varchar(25)                           		NOT NULL,
production_year 		int     							  		NOT NULL
	check((production_year >= 1365 and production_year <= 1410) or 
		  (production_year >= 1980 and production_year <= 2030))       	    ,
color                   varchar(20)                           		NOT NULL,
plaque                  char(8)                               		NOT NULL,
capacity                int                                   		NOT NULL
	check(capacity <= 10)													,
fuel_type               enum('petrol' ,'gasoil' , 'hybrid' ,'electric')		,
car_card_scan           blob                                    /*NOT NULL*/,
driver_national_id      char(15)                        	        NOT NULL,
car_type                enum('sedan','truck')                       NOT NULL,
primary key(plaque) 														,
foreign key(driver_national_id) references baxi.Driver(national_id)
		on update cascade  		on delete cascade                    	   );
        
create table baxi.Trip(
cost              	int              				           	NOT NULL,
distance          	float        DEFAULT 0                      NOT NULL,
req_time   	      	datetime     DEFAULT current_timestamp   	NOT NULL,
delay_time        	datetime                        				    ,
origin_city       	varchar(25)                              	NOT NULL,
origin_location   	float 								        NOT NULL,
id                	char(25)								   	NOT NULL,
trip_confirmation 	enum('accept','deny')						NOT NULL,
cphone_number       char(13)  		                       		NOT NULL,
primary key(id ,cphone_number) 											,
foreign key(cphone_number) references baxi.Customer(phone_number)
        on update cascade  		on delete restrict                 	   );
        
create table baxi.BaxiBar_Service(
product_cost 				int 											,
product_weight 				int										NOT NULL,
product_type 				enum('breakable','unbreakable')			NOT NULL,
destination_location 		float							        NOT NULL,
destination_city 			varchar(25)								NOT NULL,
trip_id 					char(25)   								NOT NULL,
cphone_number   			char(13)  		                     	NOT NULL,
primary key(trip_id ,cphone_number) 										,
foreign key(cphone_number,trip_id) references baxi.Trip(cphone_number,id)
        on update cascade  		on delete cascade     					   );
        
create table baxi.BaxiBox_Service(
product_cost 				int 											,
moving_cost					int										NOT NULL,
product_weight 				int										NOT NULL
	check(product_weight <= 150)											,
user_help 					enum('yes' ,'no') 	DEFAULT 'no'		NOT NULL,
insurance_cost 				int					DEFAULT 0			NOT NULL,
destination_location 		float							        NOT NULL,
destination_city 			varchar(25)								NOT NULL,
product_type 				enum('breakable','unbreakable')			NOT NULL,
trip_id 					char(25)   								NOT NULL,
cphone_number   			char(13)  		                     	NOT NULL,
primary key(trip_id ,cphone_number) 										,
foreign key(cphone_number,trip_id) references baxi.Trip(cphone_number,id)
        on update cascade  		on delete cascade     					   );
        
create table baxi.Baxi_Service(
round_trip                  enum('yes' ,'no') 	DEFAULT 'no'		NOT NULL,
trip_id 					char(25)   								NOT NULL,
cphone_number   			char(13)  		                     	NOT NULL,
primary key(trip_id ,cphone_number) 										,
foreign key(cphone_number,trip_id) references baxi.Trip(cphone_number,id)
        on update cascade  		on delete cascade     					   );
        
create table baxi.Destination_Baxi_Service(
destination_city 			varchar(25)								NOT NULL,
destination_location 		float								    NOT NULL,
trip_id 					char(25)   								NOT NULL,
cphone_number   			char(13)  		                     	NOT NULL,
primary key(destination_city ,destination_location ,trip_id ,cphone_number)	,
foreign key(cphone_number,trip_id) references baxi.Baxi_Service(cphone_number,trip_id)
        on update cascade  		on delete cascade     					   );

create table baxi.Transactions(
card_number      					char(17)											,
cost			 					int											NOT NULL,
transaction_time 					datetime       DEFAULT current_timestamp			,
id 				 					char(25)						    		NOT NULL,
tracking_number 					char(25)									NOT NULL,
transaction_status 					enum('success' , 'failure' ,'unknown' ,'in progres')	
												   DEFAULT 'unknown'	  		NOT NULL,
transaction_type 					enum('deposit','withdraw')                  NOT NULL,
cphone_number 						char(13)											,
employee_personnel_id       		char(15)                       						,
driver_national_id          		char(15)                    						,
unique(employee_personnel_id, driver_national_id, cphone_number)                		,
primary key(id) 																		,
foreign key(employee_personnel_id) references baxi.Employee(personnel_id)
		on update cascade  		on delete restrict                   					,
foreign key(driver_national_id) references baxi.Driver(national_id)
		on update cascade  		on delete restrict             		    	    		,
foreign key(cphone_number) references baxi.Customer(phone_number)
        on update cascade  		on delete restrict                      	    	   ); 
        
create table baxi.Accept_Payment(
score_to_driver             float         DEFAULT 2.5 
       check(score_to_driver >= 0 and score_to_driver <= 5)                 ,
withdrawal_type             enum('cash','direct')                   NOT NULL,
score_to_customer           float         DEFAULT 2.5 
       check(score_to_customer >= 0 and score_to_customer <= 5)             ,
estimate_time               time                               	    NOT NULL,
start_trip_time             datetime                                NOT NULL,
end_trip_time               datetime                                NOT NULL,
details                     varchar(150)                                    ,
tracking_steps              enum('intercepted','not intercepted')           ,
trip_id 					char(25)   								NOT NULL,
cphone_number   			char(13)  		                     	NOT NULL,
transaction_id 				char(25)	         				    NOT NULL,
driver_national_id 			char(15)								NOT NULL,
primary key(trip_id ,cphone_number) 										,
foreign key(transaction_id) references baxi.Transactions(id)                    
        on update cascade  		on delete restrict                          ,
foreign key(driver_national_id) references baxi.Driver(national_id)				
		on update cascade 		on delete restrict                          ,
foreign key(cphone_number,trip_id) references baxi.Trip(cphone_number,id)					
        on update cascade  		on delete restrict     					   );
        
create table baxi.Weak_point(
driver_weak_point          varchar(100)                               NOT NULL,
driver_national_id         char(15)						              NOT NULL,
primary key(driver_weak_point,driver_national_id)                             , 
foreign key(driver_national_id) references baxi.Accept_Payment(driver_national_id)				
		on update cascade 		on delete cascade                            );

create table baxi.strengh_point(
driver_strengh_point       varchar(100)						          NOT NULL,
driver_national_id         char(15)                                   NOT NULL,
primary key(driver_strengh_point,driver_national_id)                          , 
foreign key(driver_national_id) references baxi.Accept_Payment(driver_national_id) 				
		on update cascade 		on delete cascade                            );
        
create table baxi.Company_Deposit(
reward                      boolean        DEFAULT 0                ,
fuel_share                  boolean        DEFAULT 0                , 
employee_personnel_id       char(15)                        NOT NULL,
transaction_id 				char(25)					    NOT NULL,
driver_national_id          char(15)                    	NOT NULL,
primary key(transaction_id)                                         , 
foreign key(employee_personnel_id) references baxi.Employee(personnel_id)
		on update cascade  		on delete restrict                  ,
foreign key(driver_national_id) references baxi.Driver(national_id)
		on update cascade  		on delete restrict                 );
        
      
	
   