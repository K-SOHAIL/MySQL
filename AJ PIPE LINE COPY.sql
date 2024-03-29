--AJ_PIPELINE_CODE--

--SET THE CONTEXT
USE DATABASE "PIPELINING"


create table patients
(
  PATIENTID INT,
  FIRST_NAME VARCHAR(100),
  CITY VARCHAR(100),
  REGISTRATIONYEAR INT

);

SHOW COLUMNS IN patients;


create or replace storage integration s3_int
type = external_stage
storage_provider = s3
enabled = true
storage_aws_role_arn = 'arn:aws:iam::603266779554:role/patients-datasnowpipe-injection'
storage_allowed_locations = ('s3://pipelinepatient/');

desc integration s3_int;

--create the stage
create or replace stage PATIENTS_SNOW_STAGE
url = 's3://pipelinepatient/' -- name of the bucket which you have created
---credentials = (aws_key_id = '' aws_secret_key = '')
file_format = CSV
storage_integration = s3_int;

list @PATIENTS_SNOW_STAGE;

SHOW STAGES;

--CREATE SNOWPIPE THAT RECOGNISES CSV THAT ARE INGESTED FROM EXTERNAL STAGE AND COPIES THE DATA INTO PATIENTS TABLE
--The AUTO_INGEST=true parameter specifies to read event notifications sent from an S3 bucket to an SQS queue when new data is ready to load.

CREATE OR REPLACE PIPE PATIENTS_SNOWPIPE AUTO_INGEST = TRUE AS
COPY INTO patients
FROM @PATIENTS_SNOW_STAGE
FILE_FORMAT = CSV;

SHOW PIPES;

SELECT * FROM PATIENTS;
select count(*) from patients;

alter pipe PATIENTS_SNOWPIPE refresh;





select system$pipe_status('PATIENTS_SNOWPIPE');


CREATE OR REPLACE TABLE AJ_HEALTHCARE(
PATIENTID VARCHAR)