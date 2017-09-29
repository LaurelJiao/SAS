libname crsp "Q:\Data-ReadOnly\CRSP";

/* required variable */
%let vars = ret price spread vol;
%let var1 = ret;
%let var2 = price;
%let var3 = spread;
%let var4 = vol;

/* load data raw_dsf */
data raw_dsf;
set crsp.dsf;
run;

/* load dsf in sample priod*/
data dsf;
set raw_dsf;
fyear = year(date);
spread = abs(ask) - abs(bid);
price = abs(prc);
if fyear >2004 and fyear <2016;
keep cusip permno permco fyear ret price spread vol date; 
run;

/* load raw dsi */
data raw_dsi;
set crsp.dsi;
run;

/* load dsi in sample priod*/
data dsi;
set crsp.dsi;
fyear = year(date);
if fyear >2004 and fyear <2016;
keep date fyear sprtrn;
run;
/* sort by ticker */
proc sort data = dsf out= dsf_cusip;
by cusip;
run;

/* sort by year */
proc sort data =dsf out=dsf_fyear;
by fyear;
run;

/* eliminate outliers*/
data dsf_fyear;
set dsf_fyear;
if spread > 5 then spread = .;
run;

/* storing to pdf */
ods pdf file = "P:\SAS\asgn4\asgn4_output.pdf";
/* descriptive data for variables */
proc means data = dsf_fyear n mean p25 p50 p75 std min max nway;
output out = dsf_mean mean = ;
var &vars;
by date;
run;

/* plotting macro */
%macro plot0;
%do i = 1 %to 4;
title "plot the daily averages of &&var&i over time period";
proc sgplot data = dsf_mean;
series x = date y = &&var&i;
run;
%end;
%mend;
/* plot the average variable over time */
title "plot the daily averages of the variable over sample period ";
proc sgplot data = dsf_mean;
series x = date y = ret /y2axis;
series x = date y = price;
series x = date y = spread;
series x = date y = vol;
run;
/* plot each variable separately */
%plot0;
ods pdf close;

/* merge the s&p market return sprtrn with dsf*/
proc sql;
create table dsf_merged as
select *
from dsf, dsi
where dsf.date = dsi.date
order by dsf.cusip;
quit;

/* linear regression for beta */
proc reg noprint outest = regbeta;
model ret = sprtrn;
by cusip;
run;

/* rename the beta */
data reg_result;
set regbeta;
beta = sprtrn;
run;

/* calculate the total and systematic volatility */
proc means data = dsf_merged std noprint;
output out = dsf_merged_std std = ;
var ret sprtrn;
by cusip;
run;

/* merge the beta with volatility */
proc sql;
create table dsf_merged_std_beta as
select *
from dsf_merged_std, reg_result
where dsf_merged_std.cusip = reg_result.cusip
order by dsf_merged_std.cusip;
quit;
/* compute the iosyncratic volatility */
data dsf_isovol;
set dsf_merged_std_beta;
isovol = ret - beta*sprtrn;
run;
/* sort the data basied on systematic vol */
proc sort data = dsf_isovol out = dsf_sys_sorted;
by sprtrn;
run;

/* quintile portfolio */
proc rank data = dsf_isovol out = dsf_sys_quintile groups = 5;
var sprtrn;
ranks rank0;
run;

/* merge the quintile portfolio with original one */
proc sql;
create table dsf_sys_portfolio as
select dsf.cusip, dsf.permno, dsf.ret, dsf.price, dsf.spread, dsf.vol, dsf_sys_quintile.rank0
from dsf,dsf_sys_quintile
where dsf_sys_quintile.cusip = dsf.cusip
order by dsf_sys_quintile.rank0;
quit;

/* plotting macro */
%macro plot1;
%do i = 1 %to 4;
title "plot the daily averages of &&var&i in different quintile group";
proc sgplot data = dsf_sys_portfolio_mean;
series x = rank0 y = &&var&i/markers;
run;
%end;
%mend;
/* storing to pdf */
ods pdf file = "P:\SAS\asgn4\asgn4_output.pdf";

/* compute the descriptive statistics for the systematic vol quintile portfolio for analysis*/
proc means data = dsf_sys_portfolio n mean p25 p50 p75 std min max nway;
output out = dsf_sys_portfolio_mean mean = ;
var &vars;
by rank0;
run;

/* plot them for analysis*/
%plot1;
ods pdf close;

/* sort the data basied on idiosyncratic vol */
proc sort data = dsf_isovol out = dsf_isovol_sorted;
by isovol;
run;

/* quintile portfolio */
proc rank data = dsf_isovol out = dsf_isovol_quintile groups = 5;
var isovol;
ranks rank0;
run;

/* merge the quintile portfolio with original one */
proc sql;
create table dsf_isovol_portfolio as
select dsf.cusip, dsf.permno, dsf.ret, dsf.price, dsf.spread, dsf.vol, dsf_isovol_quintile.rank0
from dsf,dsf_isovol_quintile
where dsf_isovol_quintile.cusip = dsf.cusip
order by dsf_isovol_quintile.rank0;
quit;

/* plotting macro */
%macro plot2;
%do i = 1 %to 4;
title "plot the daily averages of &&var&i in different quintile group";
proc sgplot data = dsf_isovol_portfolio_mean;
series x = rank0 y = &&var&i/markers;
run;
%end;
%mend;

/* compute the descriptive statistics for the systematic vol quintile portfolio for analysis*/
proc means data = dsf_sys_portfolio n mean p25 p50 p75 std min max nway;
output out = dsf_isovol_portfolio_mean mean = ;
var &vars;
by rank0;
run;

/* plot them for analysis */
%plot2;
