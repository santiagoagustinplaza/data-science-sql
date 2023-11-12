-- Retrieve the current timezone setting
SELECT current_setting('timezone');

-- Create a table named 'demo' with timestamp columns 'tz_demo' and 'ntz_demo'
create table demo(
    tz_demo timestamptz,
    ntz_demo timestamp
);

-- Insert data into the 'demo' table
insert into 
    demo(tz_demo, ntz_demo) 
values
    ('2023-01-01 15:30:00 -0700', '2023-01-01 15:30:00');

-- Select all records from the 'demo' table
select * 
from demo;

-- Perform various time zone conversions and retrieve related information
select 
    tz_demo at time zone 'America/Denver',
    timezone('America/Denver', tz_demo),
    -- If you have an NTZ then you'll need to convert and specify a timezone
    timezone('America/Los_Angeles', ntz_demo::timestamptz at time zone 'America/New_York')
from demo;

-- Retrieve information about different date and time functions
select
    'current_date' as date_function,
    current_date::varchar
union all
select
    'current_time' as date_function,
    current_time::varchar
union all
select
    'current_timestamp' as date_function,
    current_timestamp::varchar
union all
select
    'now' as date_function,
    now()::varchar
union all
select
    'now_timezone_convert' as date_function,
    timezone('UTC', now())::timestamp::varchar
union all
select
    'localtime' as date_function,
    localtime::varchar
union all
select
    'localtimestamp',
    localtimestamp::varchar
union all
select
    'timeofday' as date_function,
    TIMEOFDAY();