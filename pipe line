USE "AJ_DEMODATABASE"

CREATE TABLE PATIENTS (
PATIENTID INT,
FIRST_NAME VARCHAR (100),
CITY VARCHAR (100),
REGISTRATIONYEAR INT
);

create or replace storage integration s3_int
type = external_stage
storage_provider = s3
enabled = true
storage_aws_role_arn = 'arn:aws:iam::603266779554:role/patients-datasnowpipe-injection_mks'
storage_allowed_locations = ('s3://patients-datasnowpipe/');

desc integration s3_int;




create or replace stage patients_sow_stage
url = 's3://patients-datasnowpipe'
-----credentials = (aws_key_id = 'AKIAYY5MARGROOO6ZHUM' aws_secret_key = 'oyphpwSJSq/0gHiLGjFu1pQyuYcn9r6TZgbZ5pDq')
file_format = csv
storage_integration = s3_int;


list @patients_sow_stage;

show stages;

create or replace pipe patients_snowpipe auto_ingest = true as
copy into "AJ_DEMODATABASE"."PUBLIC"."PATIENTS"
from @patients_sow_stage
file_format = (type = 'csv' );

show pipes ; 

select * from patients ;

alter pipe patients_snowpipe refresh


CREATE DATABASE PIPELINING; 

USE PIPELINING;

