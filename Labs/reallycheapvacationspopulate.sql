rem
rem Really Cheap Vacations create table with constraints solution
rem This scripts populates the data with some interesting data 
rem suitable for group exercises or lab construction.
rem
-- script can be run multiple times, the script starts by dropping the tables

spool c:/cprg250s/rcvpopulatetable.txt

DELETE rcv_tour_destination;
DELETE rcv_destination;

DELETE rcv_tour_customer;
DELETE rcv_vacation_tour;
DELETE rcv_rating;



DELETE rcv_customer;
DELETE rcv_agent_training;

DELETE rcv_agent;
DELETE rcv_training;



set def off
-- insert data into rcv_destination
-- European Destinations

insert into rcv_destination values (1, 'Skip the Line Ticket: Eiffel Tower Summit Priority Access with Host', 'Paris', 'France', null, 102.99); 
insert into rcv_destination values (2, 'Gourmet Dinner & Sightseeing Cruise', 'Paris', 'France', null, 114.99);
insert into rcv_destination values (3, 'Bateaux Parisiens Seine River Cruise', 'Paris', 'France', null, 75.75);
insert into rcv_destination values (4, 'Bateaux Parisiens Seine River Gourmet Dinner & Sightseeing Cruise', 'Paris', 'France', null, 162.73);
insert into rcv_destination values (5, 'Normandy D-Day Beaches & American Cemetery Trip from Paris', 'Paris', 'France', null, 439.43);
insert into rcv_destination values (6, 'Disneyland Paris 1-Day Ticket', 'Paris', 'France', null, 76.90);
insert into rcv_destination values (7, 'French Riviera in One Day', 'Nice', 'France', null, 89.26);
insert into rcv_destination values (8, 'Nice Small-Group Walking Food Tour with Local Specialties & Wine Tasting', 'Nice', 'France', null, 96.13);
insert into rcv_destination values (9, 'Nice Local Vineyards Small Group Half Day E-Bike Tour with Wine Tasting', 'Nice', 'France', null, 109.86);
insert into rcv_destination values (10, 'French Riviera Famous Cities Scoot Coupe Self Drive Tour from Nice','Nice', 'France', null, 96.13);
insert into rcv_destination values (11, 'Barcelona in One Day: Sagrada Familia, Park Guell & Old Town with Hotel Pick-up', 'Barcelona', 'Spain', null, 196.96);
insert into rcv_destination values (12, 'Interactive Spanish Cooking Experience in Barcelona', 'Barcelona', 'Spain', null, 72.76);
insert into rcv_destination values (13, '360 degree Barcelona SkyWalk: Old Town Walking, Helicopter flight & Sailing Small Group', 'Barcelona', 'Spain', null, 597.76);
insert into rcv_destination values (14, 'Girona and Dali Museum Small Group Tour with Hotel Pick-up from Barcelona', 'Barcelona', 'Spain', null, 136.76);
insert into rcv_destination values (15, 'Sunset Jazz Cruise in Barcelona', 'Barcelona', 'Spain', null, 49.95);

-- US Destinations

insert into rcv_destination values (16, 'San Andreas Fault Jeep Tour from Palm Desert', 'Palm Desert', 'United States', 'CA', 197.04);
insert into rcv_destination values (17, 'Modern & More Bike Tours Palm Springs', 'Palm Springs', 'United States', 'CA', 49.95);
insert into rcv_destination values (18, 'Earthquake Canyon Express Downhill Bicycle Adventure', 'Mecca', 'United States', 'CA', 157.63);
insert into rcv_destination values (19, 'Beginner Group Rock Climbing in Joshua Tree National Park', 'Joshua Tree', 'United States', 'CA', 275.56);
insert into rcv_destination values (20, 'ATV / UTV Riding - 28-Mile Jackrabbit Tour for 2 Riders', 'Helendale', 'United States', 'CA', 760.22);
insert into rcv_destination values (21, 'Palm Springs Windmill Tours', 'Palm Springs', 'United States', 'CA', 69.23);
insert into rcv_destination values (22, 'Private French-Inspired Cooking Class with a Fun Local in Palm Springs, CA', 'Palm Springs', 'United States', 'CA', 139.24);
insert into rcv_destination values (23, 'Disneyland 2-Day Park Hopper Ticket', 'Anahiem', 'United States', 'CA', 413.79);
insert into rcv_destination values (24, 'Private Surf Lesson Newport Beach, California', 'Newport Beach', 'United States', 'CA', 179.55);
insert into rcv_destination values (25, 'Private Dolphin and Whale Watching Tour in Newport Beach', 'Newport Beach', 'United States', 'CA', 492.60);

-- Canadian Destinations
insert into rcv_destination values (26, 'Lake Louise & Yoho N.P & Moraine Lake 1-Day Tour from Calgary or Banff', 'Calgary', 'Canada', 'AB', 146.32);
insert into rcv_destination values (27, 'Calgary Stampede - Chuckwagon Races and Grandstand Show', 'Calgary', 'Canada', 'AB', 251);
insert into rcv_destination values (28, 'Calgary Stampede - Day pass Rodeo','Calgary', 'Canada', 'AB', 131);
insert into rcv_destination values (29, 'Calgary to Royal Tyrell Museum | Drumheller | Badland – Private Sightseeing Tour', 'Drumheller', 'Canada', 'AB', 287.99);
insert into rcv_destination values (30, 'Calgary City Sightseeing Tour', 'Calgary', 'Canada', 'AB', 214.36);
insert into rcv_destination values (31, '2-Hour Horseback Trail Ride in Kananaskis', 'Kananaskis', 'Canada', 'AB', 131.25);
insert into rcv_destination values (32, 'Voyageur Canoe Tour', 'Banff', 'Canada', 'AB', 63);
insert into rcv_destination values (33, 'Blackshale Suspension Bridge & Sightseeing Tour', 'Kananaskis', 'Canada', 'AB',155);
insert into rcv_destination values (34, 'Rocky Mountaineer - 3 Day Train Adventure', 'Calgary', 'Canada', 'AB', 570.99);
insert into rcv_destination values (35, 'Heritage Park - the 1883 experience', 'Calgary', 'Canada', 'AB', 79.99);
insert into rcv_destination values (36, 'Cycling the Bow', 'Calgary', 'Canada', 'AB', 39.94);
insert into rcv_destination values (37, 'Familia Sagrada Guided Tour', 'Barcelona', 'Spain', null, 70.03);
insert into rcv_destination values (38, 'Rock climbing at COP', 'Calgary', 'Canada', 'AB', 59.95);
insert into rcv_destination values (39, 'Sulfur Mountain Gondola and Banff Hot Springs', 'Banff', 'Canada', 'AB', 121.00);
insert into rcv_destination values (40, 'Palm Springs On/Off City Tour', 'Palm Springs', 'United States', 'CA', 29.95);
insert into rcv_destination values (41, 'Palm Springs Art Museum Guided Tour', 'Palm Springs', 'United States', 'CA', 39.95);


set def on


-- insert data into rcv_rating
insert into rcv_rating values ('E', 'Easy - a few activites, leisurely pace');
insert into rcv_rating values ('M', 'Moderate - a max of 2-3 activites per week');
insert into rcv_rating values ('B', 'Busy - 3-4 activities per week');
insert into rcv_rating values ('X', 'Extreme - lots of high energy activities ');

-- insert data into rcv_vacation_tour
insert into rcv_vacation_tour values (1, 'Paris Highlights', 'EU', 'E');
insert into rcv_vacation_tour values (2, 'Paris Culture Tour', 'EU', 'M');
insert into rcv_vacation_tour values (3, 'France in 4 Days', 'EU', 'B');
insert into rcv_vacation_tour values (4, 'Calgary Highlights', 'CA', 'M');
insert into rcv_vacation_tour values (5, 'Calgary Stampede', 'CA', 'B');
insert into rcv_vacation_tour values (6, 'Palm Springs Adventure', 'US', 'X');
insert into rcv_vacation_tour values (7, 'Palm Springs Highlights', 'US', 'M');
insert into rcv_vacation_tour values (8, 'European Vacation', 'EU', 'B');
insert into rcv_vacation_tour values (9, 'Rocky Mountain Experience', 'CA', 'M');
insert into rcv_vacation_tour values (10, 'Sights of Barcelona', 'EU', 'M');
insert into rcv_vacation_tour values (11, 'Calgary Adventure', 'CA', 'X');

-- insert data into rcv_tour_destination
-- Paris Highlights
insert into rcv_tour_destination values (1, 1, 1);
insert into rcv_tour_destination values (1, 2, 2);
insert into rcv_tour_destination values (1, 3, 3);
insert into rcv_tour_destination values (1, 6, 4);


-- Paris Culture Tour
insert into rcv_tour_destination values (2, 2, 1);
insert into rcv_tour_destination values (2, 3, 2);
insert into rcv_tour_destination values (2, 5, 3);
insert into rcv_tour_destination values (2, 4, 4);

-- France in 4 Days
insert into rcv_tour_destination values (3, 1, 1);
insert into rcv_tour_destination values (3, 5, 2);
insert into rcv_tour_destination values (3, 8, 3);
insert into rcv_tour_destination values (3, 9, 4);

-- Calgary Highlights (Moderate)
insert into rcv_tour_destination values (4, 30, 1);
insert into rcv_tour_destination values (4, 39, 2);
insert into rcv_tour_destination values (4, 35, 3);

-- Calgary Stampede (Busy)
insert into rcv_tour_destination values (5, 27, 1);
insert into rcv_tour_destination values (5, 28, 2);
insert into rcv_tour_destination values (5, 30, 3);

-- Palm Springs Adventure (Extreme)
insert into rcv_tour_destination values (6, 16, 1);
insert into rcv_tour_destination values (6, 18, 2);
insert into rcv_tour_destination values (6, 19, 3);
insert into rcv_tour_destination values (6, 20, 4);

-- Palm Springs Highlights (Moderate)
insert into rcv_tour_destination values (7, 40, 1);
insert into rcv_tour_destination values (7, 41, 2);
insert into rcv_tour_destination values (7, 21, 3);
insert into rcv_tour_destination values (7, 16, 4);

-- European Vacation (Busy)
insert into rcv_tour_destination values (8, 1, 1);
insert into rcv_tour_destination values (8, 5, 2);
insert into rcv_tour_destination values (8, 7, 3);
insert into rcv_tour_destination values (8, 13, 4);
insert into rcv_tour_destination values (8, 37, 5);

-- Rocky Mountain Experience (Moderate)
insert into rcv_tour_destination values (9, 30, 1);
insert into rcv_tour_destination values (9, 31, 2);
insert into rcv_tour_destination values (9, 32, 3);
insert into rcv_tour_destination values (9, 34, 4);
insert into rcv_tour_destination values (9, 39, 5);


-- Sights of Barcelona (Moderate)
insert into rcv_tour_destination values (10, 11, 1);
insert into rcv_tour_destination values (10, 13, 2);
insert into rcv_tour_destination values (10, 15, 3);
insert into rcv_tour_destination values (10, 12, 4);

-- Calgary Adventure (Extreme)
insert into rcv_tour_destination values (11, 36, 1);
insert into rcv_tour_destination values (11, 38, 2);
insert into rcv_tour_destination values (11, 29, 3);
insert into rcv_tour_destination values (11, 35, 4);

-- insert data into rcv_agent
insert into rcv_agent values (1, 'Ethan', 'Hunt', 'II', 'US', 4);
insert into rcv_agent values (2, 'Anna', 'Chapman', 'III', 'EU', 5);
insert into rcv_agent values (3, 'Alicia', 'Hubermann', 'I', 'CA', 2);
insert into rcv_agent values (4, 'Valerie', 'Plume', 'IV', 'US', 3);

-- insert data into rcv_training
insert into rcv_training values (1, 'Customer Relations', 1);
insert into rcv_training values (2, 'Touring Europe', 1);
insert into rcv_training values (3, 'Touring Canada', 1);
insert into rcv_training values (4, 'Touring the US', 3);
insert into rcv_training values (5, 'Building client relationships', 1);
insert into rcv_training values (6, 'Dealing with difficult customers', 2);

-- insert data into rcv_agent_training


insert into rcv_agent_training values (1, 1, to_date('01-may-22 12:00 pm', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (1, 4, to_date('01-sep-22 8:00 am', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (1, 5, to_date('08-may-22 12:00 pm', 'dd-Mon-yy hh:mi pm'));

insert into rcv_agent_training values (2, 1, to_date('01-may-22 12:00 pm', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (2, 2, to_date('02-oct22 12:00 pm', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (2, 5, to_date('08-may-22 12:00 pm', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (2,6, to_date('01-oct22 12:00 pm', 'dd-Mon-yy hh:mi pm'));

insert into rcv_agent_training values (4,1, to_date('01-may-22 12:00 pm', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (4,4, to_date('01-sep-22 8:00 am', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (4,5, to_date('08-may-22 12:00 pm', 'dd-Mon-yy hh:mi pm'));
insert into rcv_agent_training values (4, 6, to_date('01-oct22 12:00 pm', 'dd-Mon-yy hh:mi pm'));


-- insert data into rcv_customer

insert into rcv_customer values (1, 'Penny', 'Hofstadter', '760.123.3846', '2249 Main', 'Santa Susana', 'CA', 1);
insert into rcv_customer values (2, 'Sheldon', 'Cooper', '212.234.2344', '123 Gramercy Lane', 'New York', 'NY', 1);
insert into rcv_customer values (3, 'Amy', 'Folwer', '213.483.2733', '34 Liberty Strip', 'Los Angeles', 'CA', 2);
insert into rcv_customer values (4, 'Lionel', 'Messie', '935.343.1126', '234 Bellmar', 'Barcelona', Null, 2);
insert into rcv_customer values (5, 'Bernadette', 'Rostenkowski-Wolowitz', '310.285.9000', '9601 Wilshire Blvd', 'Beverly Hills', 'CA', 4);
insert into rcv_customer values (6, 'Raj', 'Koothrappali', '310.285.9002', '12 W Palm Beach Dr', 'Beverly Hills', 'CA', 4);


-- 1 Paris Highlights July 31 - August 14 [1,2]
insert into rcv_tour_customer values (1, 1, to_date('31-Jul-22', 'dd-Mon-yy'), to_date('14-Aug-22', 'dd-Mon-yy'));
insert into rcv_tour_customer values (1, 2, to_date('31-Jul-22', 'dd-Mon-yy'), to_date('14-Aug-22', 'dd-Mon-yy'));

-- 1 Paris Highlights August 14 - 28 [4]
insert into rcv_tour_customer values (1, 4, to_date('14-Aug-22', 'dd-Mon-yy'), to_date('28-Aug-22', 'dd-Mon-yy'));

-- 2 Paris Culture Tour, Oct 1 - 15 [4]
insert into rcv_tour_customer values (2, 4, to_date('01-Oct-22', 'dd-Mon-yy'), to_date('15-Oct-22', 'dd-Mon-yy'));

-- 3 France in 4 Days, August 23 - 26 [3]
insert into rcv_tour_customer values (3, 3, to_date('23-Aug-22', 'dd-Mon-yy'), to_date('26-Aug-22', 'dd-Mon-yy'));

-- 4 Calgary Highlights Aug 1 - 5 [1,2], 8 - 12 [3]
insert into rcv_tour_customer values (4, 1, to_date('01-Aug-22', 'dd-Mon-yy'), to_date('05-Aug-22', 'dd-Mon-yy'));
insert into rcv_tour_customer values (4, 2, to_date('01-Aug-22', 'dd-Mon-yy'), to_date('05-Aug-22', 'dd-Mon-yy'));

insert into rcv_tour_customer values (4, 3, to_date('08-Aug-22', 'dd-Mon-yy'), to_date('12-Aug-22', 'dd-Mon-yy'));

-- 5 Calgary Stampede July 8 - 17 [1,2,3,5,6]

insert into rcv_tour_customer values (5, 1, to_date('08-Jul-22', 'dd-Mon-yy'), to_date('17-Jul-22', 'dd-Mon-yy'));
insert into rcv_tour_customer values (5, 2, to_date('08-Jul-22', 'dd-Mon-yy'), to_date('17-Jul-22', 'dd-Mon-yy'));
insert into rcv_tour_customer values (5, 3, to_date('08-Jul-22', 'dd-Mon-yy'), to_date('17-Jul-22', 'dd-Mon-yy'));
insert into rcv_tour_customer values (5, 5, to_date('08-Jul-22', 'dd-Mon-yy'), to_date('17-Jul-22', 'dd-Mon-yy'));
insert into rcv_tour_customer values (5, 6, to_date('08-Jul-22', 'dd-Mon-yy'), to_date('17-Jul-22', 'dd-Mon-yy'));

-- 6 PS Adventure Feb 18 - 26, 2023 [5,6]
insert into rcv_tour_customer values (6, 5, to_date('18-Feb-23', 'dd-Mon-yy'), to_date('26-Feb-23', 'dd-Mon-yy'));
insert into rcv_tour_customer values (6, 6, to_date('18-Feb-23', 'dd-Mon-yy'), to_date('26-Feb-23', 'dd-Mon-yy'));

-- 7 PS Highlights Jan 2 - 8 [5, 6]
insert into rcv_tour_customer values (7, 5, to_date('02-Jan-23', 'dd-Mon-yy'), to_date('08-Jan-23', 'dd-Mon-yy'));
insert into rcv_tour_customer values (7, 6, to_date('02-Jan-23', 'dd-Mon-yy'), to_date('08-Jan-23', 'dd-Mon-yy'));

-- 8 European Vacation July 10 - 24 [3]
insert into rcv_tour_customer values (8, 3, to_date('10-Jul-22', 'dd-Mon-yy'), to_date('24-Jul-22', 'dd-Mon-yy'));

-- 9 Rocky Mountain Experience July 10 - 24 [4]
insert into rcv_tour_customer values (9, 4, to_date('10-Jul-22', 'dd-Mon-yy'), to_date('24-Jul-22', 'dd-Mon-yy'));

-- 10 Sights of Barcelona Aug 28 - Sep 4 [3]
insert into rcv_tour_customer values (10, 3, to_date('28-Aug-22', 'dd-Mon-yy'), to_date('04-Sep-22', 'dd-Mon-yy'));
commit;

spool off








 

