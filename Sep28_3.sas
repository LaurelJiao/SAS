libname RA "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data";
filename q2_2012 zip "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2012_q2.zip" member = "q2_2012_all.csv";

%let regvar = date security$ ticker$ mcaprank cancels littrades;

/*read data*/
data data_1;
infile q2_2012 delimiter = ',' dsd firstobs = 2;
input &regvar;
run;

/* select etf from the file*/
data testdata_etf;
set work.data_1;
if security = 'ETF';
run;

/*calculate metrics for all etfs*/
data test_data_etf_metrics;
set work.testdata_etf;
cancel_to_trade = cancels/littrades;
run;

proc univariate data = test_data_etf_metrics;
var cancel_to_trade;
run;

/* list of etf tickers*/
data etf_tickers;
set data_1;
if date = 20120402 and security = 'ETF';
run;

proc surveyselect data = etf_tickers method = srs n = 100 out = sample_etf_tickers;
run;

/* select all etf from 2012_qtrl that are part of the 100 samples*/
proc sql;
create table sample_etfs(label = 'sample etfs') as
select * from work.test_data_etf_metrics 
where ticker in (select ticker from sample_etf_tickers);
quit;
