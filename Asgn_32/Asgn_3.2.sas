
libname comp "Q:\Data-ReadOnly\COMP";

* keep these variables;
%let vars1 = current_ratio quick_ratio de_ratio cycle i_burden i_cov lev pm z_score o_score fundso;
%let vars2 = dso dio dpo ta_turnover in_turnover re_turnover roa roe i;
%let vars0 = fyear gvkey;
* by catagory;
%let ls = current_ratio quick_ratio de_ratio;
%let activity = dso dio dpo cycle;
%let asset_u = ta_turnover in_turnover re_turnover;
%let leverage = i_burden i_cov lev;
%let profit = roa roe pm;
%let scores = z z_a z_b z_c z_d z_e o o_a o_b o_c o_d o_e o_f fundso g h i;

/* Read the data */
data one;
set comp.funda;
if indfmt = 'INDL' and datafmt = 'STD' and popsrc = 'D' and consol = 'C';
/*if scf = 4 or scf = 5 or scf = 6 or scf = . then delete;*/
/*if 4900 < sich < 4999 then delete;*/
/*if 6000 < sich < 6999 then delete;*/
/*if COMPST ne 'AB';*/

* compute the variables;
current_ratio = act/lct;
quick_ratio = (che + rect)/lct;
de_ratio = lt/teq;
i_burden = (oiadp - xint)/oiadp;
i_cov = oiadp/xint;
lev = at/teq;
pm = oiadp/sale;
z_a = (act - lct)/at;
z_b = re/at;
z_c = oiadp/at;
z_d = (prcc_f*csho)/lt;
z_e = sale/at;
o_a = log(at);
o_b = lt/at;
o_c = (act-lct)/at;
o_d = lct/act;
o_e = ni/at;
o_f = (pi+dp)/lt;
fundso = pi + dp;
g = 0;
if o_b ge 1 then g = 1;
h = 1;
if lag(ni) le 0 and lag2(ni) le 0 then h = 1;

* variables requires lag;
if gvkey eq lag(gvkey) then do;
dso = (((rect + lag1(rect))/2)/sale)*365;
dio = (((invt + lag1(invt))/2)/cogs)*365;
dpo = (((ap + lag1(ap))/2)/cogs)*365;
ta_turnover = sale/((at + lag1(at))/2);
in_turnover = cogs/((invt + lag1(invt))/2);
re_turnover = sale/((rect + lag1(rect))/2);
roa = oiadp/((at + lag1(at))/2);
roe = ni/((teq + lag1(teq))/2);
i = (ni - lag1(ni))/(abs(ni) + abs(lag1(ni)));
end;
z_score = 1.2*z_a + 1.4*z_b + 3.3*z_c + 0.6*z_d + 0.99*z_e;
o_score = -1.32 - 0.407*o_a + 6.03*o_b -1.43*o_c + 0.0757*o_d - 2.37*o_e -1.83*o_f - 1.72*g + 0.285*h -0.521*i;
cycle = dio + dso - dpo;
keep &vars0 &vars1 &vars2;

array change _numeric_;
do over change;
if change =. then change = 0;
end;
run;

/** Sort the data by year;*/
proc sort data = one;
by fyear;
run;

/* read csv file; */
%macro import(file = , output = test, dbms_opt = );

proc import datafile = &file
out = &output
dbms = &dbms_opt replace;

%mend;

/* macro for handling date join */
%macro handle_year(file = , output = ,);

data &output;
set &file;
year = year(date);
keep year &file date;

array change _numeric_;
do over change;
if change =. then change = 0;
end;

proc sort data = &output;
by year;

%mend;

%macro join_wt_one(left = , right = , output = ,);
proc sql;
create table &output as
select *
from &left as l left join
	&right as r
	on l.fyear = r.year;
%mend;

/* import three csv */
%import(file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_32\BAAFFM.csv", output = BAAFFM, dbms_opt = csv);
%import(file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_32\CFSI.csv", output = CFSI, dbms_opt = csv);
%import(file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_32\USREC.csv", output = USREC, dbms_opt = csv);
run;
/* usrec */
%handle_year(file = usrec, output = usrec_year);
run;
%join_wt_one(left = one, right = usrec_year, output = usrec_left);
/* baafm; */
%handle_year(file = baaffm, output = baaffm_year);
run;
%join_wt_one(left = one, right = baaffm_year, output = baaffm_left);
/* cfsi; */
%handle_year(file = cfsi, output = cfsi_year);
run;
%join_wt_one(left = one, right = cfsi_year, output = cfsi_left);

/* calculate descriptive data and plots */
ods pdf file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_32\assginment3.2.pdf";
/* descriptive data;*/
proc means data = one n mean p25 p50 p75 stddev min max;
output out = means_data mean = ;
by fyear;
run; 


/* correlation;*/
proc corr data = one;
var &ls;
run;
proc corr data = one;
var &activity;
run;
proc corr data = one;
var &asset_u;
run;
proc corr data = one;
var &leverage;
run;
proc corr data = one;
var &profit;
run;

* plot mean data;
title "plot of mean data of funda";
proc sgplot data = means_data;
yaxis label = 'financial data';
xaxis type = discrete;
series x = fyear y = current_ratio;
series x = fyear y = quick_ratio;
series x = fyear y = de_ratio;
series x = fyear y = i_burden;
series x = fyear y = i_cov;
series x = fyear y = lev;
series x = fyear y = pm;
series x = fyear y = z_score;
series x = fyear y = o_score;
series x = fyear y = fundso;
series x = fyear y = dso;
series x = fyear y = dio;
series x = fyear y = dpo;
series x = fyear y = ta_turnover;
series x = fyear y = in_turnover;
series x = fyear y = re_turnover;
series x = fyear y = roa;
series x = fyear y = roe;
series x = fyear y = cycle;
run;

* USREC descriptive data;
proc means data = usrec_left n mean p25 p50 p75 stddev min max;
*output out = usrec_1_stat mean = ;
by fyear;
where usrec = 1;
run; 

proc means data = usrec_left n mean p25 p50 p75 stddev min max;
*output out = usrec_1_stat mean = ;
by fyear;
where usrec = 0;
run; 


* plot baafm with one;
title "plot of financial data with spread";
proc sgplot data = baaffm_left;
yaxis label = 'financial data';
xaxis type = discrete;
scatter x = baaffm y = current_ratio;
scatter x = baaffm y = quick_ratio;
scatter x = baaffm y = de_ratio;
scatter x = baaffm y = i_burden;
scatter x = baaffm y = i_cov;
scatter x = baaffm y = lev;
scatter x = baaffm y = pm;
scatter x = baaffm y = z_score;
scatter x = baaffm y = o_score;
scatter x = baaffm y = fundso;
scatter x = baaffm y = dso;
scatter x = baaffm y = dio;
scatter x = baaffm y = dpo;
scatter x = baaffm y = ta_turnover;
scatter x = baaffm y = in_turnover;
scatter x = baaffm y = re_turnover;
scatter x = baaffm y = roa;
scatter x = baaffm y = roe;
scatter x = baaffm y = cycle;
run;

title "plot of financial data with cfsi";
proc sgplot data = cfsi_left (where =  (cfsi ^= .));
yaxis label = 'financial data';
xaxis type = discrete;
scatter x = cfsi y = current_ratio;
scatter x = cfsi y = quick_ratio;
scatter x = cfsi y = de_ratio;
scatter x = cfsi y = i_burden;
scatter x = cfsi y = i_cov;
scatter x = cfsi y = lev;
scatter x = cfsi y = pm;
scatter x = cfsi y = z_score;
scatter x = cfsi y = o_score;
scatter x = cfsi y = fundso;
scatter x = cfsi y = dso;
scatter x = cfsi y = dio;
scatter x = cfsi y = dpo;
scatter x = cfsi y = ta_turnover;
scatter x = cfsi y = in_turnover;
scatter x = cfsi y = re_turnover;
scatter x = cfsi y = roa;
scatter x = cfsi y = roe;
scatter x = cfsi y = cycle;
run;

ods pdf close;
