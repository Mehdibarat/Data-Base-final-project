use baxi;

-- karim sarabi
INSERT INTO baxi.Driver (fname  , lname    , ident_code , sex   , age, national_id, sheba_number  ,distance, wallet , score, phone_number ,  disability_type, certificate_type, certificate_date, act_permission, location, zoom_size, interest_rate)
VALUE                  ('karim', 'sarabi' , 456789     , 'male', 35 , '65987412' , 'IR2327232143', 9.8    , 20000 , 3.5  , '09903002121',  'deaf'        ,    'level 1'    , '1398-02-03'    , 1             , 7.0     , 4        , 6            );


-- amin ahamdi
INSERT INTO baxi.Driver (fname , lname   , ident_code, sex   , age, national_id, sheba_number  ,distance, wallet , score, phone_number  , identifier_national_id, disability_type, certificate_date , certificate_type, act_permission, location, zoom_size, interest_rate)
VALUES                  ('amin', 'ahmadi', 123456    , 'male', 23 , '055055403', 'IR2327232569', 10.3   , 1000000, 4.2  , '09187007125' , '65987412'            ,  'deaf'        , '1400-09-23'     , 'level 2'       , 1             , 10.0    , 5        , 7            );


-- samine ahmadi
INSERT INTO baxi.Driver (fname   , lname   , ident_code, sex     , age, national_id, sheba_number  ,distance, wallet , score, phone_number  , identifier_national_id, disability_type, certificate_date, certificate_type, act_permission, location, zoom_size, interest_rate)
VALUES                  ('samine', 'ahmadi', 123457    , 'female', 37 , '049066407', 'IR2324597126', 7.1    , 2000000, 3.4  , '09181001111' , '055055403'           ,  'no'          , '1399-06-25'    , 'level 3'       , 1             , 10.0    , 5        , 7            );


-- karim sarabi
INSERT INTO baxi.Baxi_Car (bcname   , production_year, color , plaque   , capacity, fuel_type, driver_national_id, car_type)
VALUES                    ('pride'  , 2008           , 'blue', 'ABC1234', 5       , 'petrol' , '65987412'        , 'sedan' );


-- samine ahmadi
INSERT INTO baxi.Baxi_Car (bcname   , production_year, color , plaque   , capacity, fuel_type, driver_national_id, car_type)
VALUES                    ('samand' , 2006           , 'blue', 'UYG1325', 3       , 'petrol' , '049066407'       , 'sedan' );


-- amin ahmadi
INSERT INTO baxi.BaxiBar_Car (bbcname   , production_year, color  , plaque    , capacity, fuel_type, driver_national_id, car_type)
VALUES                    ('neisan'  , 2007           , 'white', 'AFGJ5869', 100       , 'petrol', '055055403'       , 'truck' );


-- mohammad rafiei
INSERT INTO baxi.Employee (fname     , lname   ,employeement_date ,personnel_id , sheba_number       , salary , username  , pass         , skill_level, degree    , position     , department, age, national_id)
VALUES                    ('mohammad', 'rafiei','2020-06-14'      , '159874'     , 'IR01234567823456', 6000000, 'mohammad', 'password123', 'mid level', 'bachelor', 'dep manager', 'it'      , 25 , '123412345');


-- amin ahmadi                           employee mohammad refiei
INSERT INTO baxi.Judicial_Confirmation (judicial_Confirmation_letter_date, judicial_Confirmation_number, employee_personnel_id, driver_national_id)
VALUES                                 ('2024-03-08'                     , 'JC123456'                  , '159874'          , '055055403'       );



-- amin ahmadi          employee mohmaad refiei
INSERT INTO baxi.Confirmation (certificate_confirmation_date, final_confirmation_date, certificate_number, car_inspection_date, employee_personnel_id, driver_national_id)
VALUES                        ('2022-03-08'                 , '2022-03-10'           , 'CN123456'        , '2022-04-09'       , '159874'             , '055055403' );


-- kazem kazemi
INSERT INTO Baxi.Customer (fname  , lname   , sex   , age, phone_number, email ,wallet)
VALUES                    ('kazem', 'kazemi', 'male', 16 , '09184561221', 'kazem@cust.com' , 70000);


-- kazem kazemi
INSERT INTO baxi.Customer_Address (label, location, cphone_number)
VALUES ('home', 10.12345, '09184561221');


-- kazem kazemi
INSERT INTO baxi.Customer_Address (label, location, cphone_number)
VALUES ('work', 15.12345, '09184561221');


-- kazem kazemi
INSERT INTO baxi.Transactions (cost , id      , tracking_number, transaction_status ,transaction_type, cphone_number )
VALUES                        (70000, '741258', 'TR123456789'  , 'success'          ,'deposit'       , '09184561221');



-- mobina hoseini
INSERT INTO Baxi.Customer (fname   , lname    , sex     , age, phone_number , email             ,wallet)
VALUES                    ('mobina', 'hoseini', 'female', 15 , '09936547891', 'mobina@cust.com' , 40000);


-- mobina hoseini
INSERT INTO baxi.Transactions (cost , id      , tracking_number, transaction_type, cphone_number)
VALUES                        (40000, '459687', 'TR123456748'  , 'deposit'       , '09936547891');


-- mobina hoseini
INSERT INTO baxi.Trip (cost , distance, req_time             , origin_city, origin_location, id           , trip_confirmation, cphone_number)
VALUES                (20000, 10.5    , '2024-01-01 10:00:00', 'City A'   , 10.4           , 'TR123456747', 'accept'         , '09936547891');


-- mobina hoseini
INSERT INTO baxi.Trip (cost , distance, req_time             , origin_city, origin_location, id           , trip_confirmation, cphone_number)
VALUES                (15000, 9.5     , '2024-01-01 16:00:00', 'City A'   , 14.25          , 'TR123456748', 'accept'         , '09936547891');


-- kazem kazemi
INSERT INTO baxi.Trip (cost , distance, req_time             , origin_city, origin_location, id           , trip_confirmation, cphone_number)
VALUES                (18000, 7       , '2024-01-03 10:00:00', 'City A'   , 19.36         , 'TR123456749', 'accept'         , '09184561221');


-- mobina hoseini
INSERT INTO baxi.Baxi_Service (round_trip, trip_id      , cphone_number)
VALUES                        ('yes'     , 'TR123456747', '09936547891');


INSERT INTO baxi.Destination_Baxi_Service(destination_city ,destination_location ,trip_id      ,cphone_number)
VALUES                                   ('City B'         ,12.5                 ,'TR123456747','09936547891');


-- mobina hoseini
INSERT INTO baxi.Baxi_Service (round_trip, trip_id      , cphone_number)
VALUES                        ('yes'     , 'TR123456748', '09936547891');


INSERT INTO baxi.Destination_Baxi_Service(destination_city ,destination_location ,trip_id      ,cphone_number)
VALUES                                   ('City A'         ,17.3                 ,'TR123456748','09936547891');


-- kazem kazemi
INSERT INTO baxi.Baxi_Service (round_trip, trip_id      , cphone_number)
VALUES                        ('yes'     , 'TR123456749', '09184561221');


INSERT INTO baxi.Destination_Baxi_Service(destination_city ,destination_location ,trip_id      ,cphone_number)
VALUES                                   ('City B'         ,12.9                 ,'TR123456749','09184561221');


-- mobina hoseini       driver : karim sarabi
INSERT INTO baxi.Transactions (cost , id      , tracking_number, transaction_type, cphone_number)
VALUES                        (20000, '459690', 'TR123456900'  , 'deposit'       , '09936547891');


-- mobina hoseini             driver : karim sarabi
INSERT INTO baxi.Accept_Payment (score_to_driver, withdrawal_type, score_to_customer, estimate_time        , start_trip_time      , end_trip_time        , trip_id      , cphone_number   , transaction_id, driver_national_id)
VALUES                          (3.5            , 'cash'         , 4.0              , '00:45:00',          '2024-01-01 10:00:00', '2024-03-11 12:45:00', 'TR123456747', '09936547891'   , '459690'      , '65987412'        );


-- mobina hoseini       driver : amin ahmadi
INSERT INTO baxi.Transactions (cost , id      , tracking_number, transaction_type, cphone_number)
VALUES                        (15000, '459700', 'TR123456800'  , 'deposit'       , '09936547891');


-- mobina hoseini             driver : karim sarabi
INSERT INTO baxi.Accept_Payment (score_to_driver, withdrawal_type, score_to_customer, estimate_time        , start_trip_time      , end_trip_time        , trip_id      , cphone_number   , transaction_id, driver_national_id)
VALUES                          (4.5            , 'direct'       , 5.0              , '00:15:00', '2024-01-01 10:00:00', '2024-03-11 13:15:00', 'TR123456748', '09936547891'   , '459700'      , '65987412'        );


-- salim salimi
INSERT INTO Baxi.Customer (fname   , lname    , sex     , age, phone_number , email             ,wallet)
VALUES                    ('salim', 'salimi', 'male', 26 , '09936547814', 'salim@cust.com' , 60000);


-- salim salimi
INSERT INTO baxi.Transactions (cost , id      , tracking_number, transaction_type, cphone_number)
VALUES                        (60000, '459631', 'TR123456257'  , 'deposit'       , '09936547814');


-- salim salimi
INSERT INTO baxi.Trip (cost , distance, req_time             , origin_city, origin_location, id           , trip_confirmation, cphone_number)
VALUES                (17000, 13.5    , '2024-03-11 10:00:00', 'City B'   , 15.1           , 'TR123456474', 'accept'         , '09936547814');


-- salim salimi
INSERT INTO baxi.Trip (cost , distance, req_time             , origin_city, origin_location, id           , trip_confirmation, cphone_number)
VALUES                (15000, 9.5     , '2024-03-11 16:00:00', 'City B'   , 10.11          , 'TR123456869', 'accept'         , '09936547814');


-- salim salimi
INSERT INTO baxi.Baxi_Service (round_trip, trip_id      , cphone_number)
VALUES                        ('yes'     , 'TR123456474', '09936547814');


INSERT INTO baxi.Destination_Baxi_Service(destination_city ,destination_location ,trip_id      ,cphone_number)
VALUES                                   ('City C'         ,13.9                 ,'TR123456474','09936547814');


-- salim salimi
INSERT INTO baxi.Baxi_Service (round_trip, trip_id      , cphone_number)
VALUES                        ('yes'     , 'TR123456869', '09936547814');


INSERT INTO baxi.Destination_Baxi_Service(destination_city ,destination_location ,trip_id      ,cphone_number)
VALUES                                   ('City B'         ,11.1                 ,'TR123456869','09936547814');


-- salim salimi       driver : karim sarabi
INSERT INTO baxi.Transactions (cost , id      , tracking_number, transaction_type, cphone_number)
VALUES                        (17000, '459147', 'TR123456003'  , 'deposit'       , '09936547814');


-- salim salimi             driver : karim sarabi
INSERT INTO baxi.Accept_Payment (score_to_driver, withdrawal_type, score_to_customer, estimate_time        , start_trip_time      , end_trip_time        , trip_id      , cphone_number   , transaction_id, driver_national_id)
VALUES                          (1.5            , 'cash'         , 4.0              , '01:30:00',          '2024-03-11 10:00:00', '2024-03-11 13:45:00', 'TR123456474', '09936547814'   , '459147'      , '049066407'        );


-- salim salimi       driver : amin ahmadi
INSERT INTO baxi.Transactions (cost , id      , tracking_number, transaction_type, cphone_number)
VALUES                        (15000, '44550', 'TR123456800'  , 'deposit'       , '09936547814');


-- salim salimi             driver : karim sarabi
INSERT INTO baxi.Accept_Payment (score_to_driver, withdrawal_type, score_to_customer, estimate_time        , start_trip_time      , end_trip_time        , trip_id      , cphone_number   , transaction_id, driver_national_id)
VALUES                          (4.5            , 'direct'       , 5.0              , '00:15:00', '2024-03-11 10:00:00', '2024-03-11 15:15:00', 'TR123456869', '09936547814'   , '44550'      , '055055403'        );


