libname crsp "Q:\Data-ReadOnly\CRSP";

/* required variable */
%let vars = ret price spread vol;
%let var1 = ret;
%let var2 = price;
%let var3 = spread;
%let var4 = vol;

/* plotting macro */
%macro plot;
%do i = 1 %to 4;
title "plot the daily averages of &&var&i over time period";
proc sgplot data = dsf_mean;
series x = date y = &&var&i;
run;
%end;
%mend;
/*	load data crsp_dsf */
data dsf;
set crsp.dsf;
fyear = year(date);
spread = askhi - bidlo;
price = abs(prc);
if fyear < 2005 then delete;
if fyear > 2014 then delete;
keep permno fyear ret price spread vol date; 
run;


/* sort by ticker */
proc sort data = dsf;
by permno;
run;

/* sort by year */
data dsf_year;
set dsf;
run;

proc sort data = dsf_year;
by fyear;
run;

/* descriptive data for variables */
proc means data = dsf_year n mean p25 p50 p75 std min max nway;
output out = dsf_mean mean = ;
var &vars;
by date;
run;

/* plot the average variable over time */
title "plot the daily averages of the variable over sample period ";
proc sgplot data = dsf_mean;
series x = date y = ret /y2axis;
series x = date y = price;
series x = date y = spread;
series x = date y = vol;
run;
/* plot each variable separately */
%plot;
/* read the market return data */
/* sprtrn */
data dsi;
set crsp.dsi;
fyear = year(date);
if fyear < 2005 then delete;
if fyear > 2014 then delete;
keep date fyear sprtrn;
run;
/* merge them*/
proc sql;
create table dsf_merged as
select *
from dsf, dsi
where dsf.date = dsi.date
order by dsf.permno;
quit;


/* linear regression for beta */
proc reg noprint outest = regbeta;
model ret = sprtrn;
by permno;
run;

/* rename the beta */
data reg_result;
set regbeta;
beta = sprtrn;
keep permno intercept beta;
run;

/* calculate the volatility */
proc means data = dsf_merged std noprint;
output out = dsf_merged_std std = ;
var ret sprtrn;
by permno;
run;

/* merge the beta with volatility */
proc sql;
create table dsf_merged_std_beta as
select dsf_merged_std.permno, intercept, ret, sprtrn, beta
from dsf_merged_std, reg_result
where dsf_merged_std.permno = reg_result.permno
order by dsf_merged_std.permno;
quit;
/* compute the iosyncratic volatility */
data dsf_isovol;
set dsf_merged_std_beta;
isovol = ret - beta*sprtrn;
keep permno intercept ret sprtrn beta isovol;
run;
/* sort the data basied on systematic vol */
proc sort data = dsf_isovol out = dsf_sys_sorted;
by sprtrn;
run;

/* quintile portfolio */
proc rank data = dsf_isovol out = dsf_quintile groups = 5;
var sprtrn;
ranks rank1;
run;



