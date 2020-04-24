-- part 1
create table Carriers(cid varchar(7) primary key, name varchar(83) not null);

create table Months(mid int primary key, month varchar(20) not null);

create table Weekdays(did int primary key, day_of_week varchar(20) not null);

create table Flights(
fid int primary key,
month_id int not null references Months, -- 1-12
day_of_month int not null, -- 1-31
day_of_week_id int not null references Weekdays, -- 1-7, 1 = Monday, 2 = Tuesday, etc
carrier_id varchar(7) not null references Carriers,
flight_num int not null,
origin_city varchar(34) not null,
origin_state varchar(47) not null,
dest_city varchar(34) not null,
dest_state varchar(46) not null,
departure_delay int not null, -- in mins
taxi_out int not null, -- in mins
arrival_delay int not null, -- in mins
canceled int not null, -- 1 means canceled
actual_time int not null, -- in mins
distance int not null, -- in miles
capacity int not null,
price int not null);

-- part 2
CREATE EXTERNAL DATA SOURCE cse414blob
WITH (  TYPE = BLOB_STORAGE,
    		LOCATION = 'https://cse414.blob.core.windows.net/flights'
);

-- part3
bulk insert Carriers from 'carriers.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'cse414blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

bulk insert Months from 'months.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'cse414blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

bulk insert Weekdays from 'weekdays.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'cse414blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

-- Import for the large Flights table
-- This last import might take a little under 5 minutes on the provided server settings

bulk insert Flights from 'flights-small.csv'
with (ROWTERMINATOR = '0x0a',
DATA_SOURCE = 'cse414blob', FORMAT='CSV', CODEPAGE = 65001, --UTF-8 encoding
FIRSTROW=1,TABLOCK);

SELECT count(*) from Flights