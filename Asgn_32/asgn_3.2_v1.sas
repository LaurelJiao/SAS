
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
if fyear = 0 then delete;
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

/* drop extreme value */
/* get rid of value > mean+2stdev */
data one;
set one;
if abs(current_ratio) > 500 then delete;
if abs(quick_ratio) > 500 then delete;
if abs(de_ratio) > 1000 then delete;
if abs(i_cov) > 500 then delete;
if abs(fundso) > 10000 then delete;

if abs(dio) > 1000 or abs(dpo) > 1000 or abs(dso) > 1000 then delete;
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
* variables for ploting (dumb, huh?);
%let var1 = current_ratio;
%let var2 = quick_ratio;
%let var3 = de_ratio;
%let var4 = i_burden;
%let var5 = i_cov;
%let var6 = lev;
%let var7 = pm;
%let var8 = z_score;
%let var9 = o_score;
%let var10 = dso;
%let var11= dio;
%let var12 = dpo;
%let var13 = ta_turnover;
%let var14 = in_turnover;
%let var15 = re_turnover;
%let var16 = roa;
%let var17 = roe;
%let var18 = cycle;

* plot mean data;
%macro plot(file, yvalue);
%do i = 1 %to 18;
proc sgplot data = &file;
xaxis type = discrete values = (1950 to 2015 by 5);
series x = &yvalue y = &&var&i;
run;
%end;
%mend;

*plot baaffm;
%macro plotbaaffm;
%do i = 1 %to 18;
proc sgplot data = baaffm_left;
xaxis type = discrete values = (1950 to 2015 by 5);
series x = fyear y = baaffm;
series x = fyear y = &&var&i;
run;
%end;
%mend;

*plot cfsi;
%macro plotcfsi;
%do i = 1 %to 18;
proc sgplot data = cfsi_left;
xaxis type = discrete values = (1995 to 2015 by 1);
series x = fyear y = cfsi;
series x = fyear y = &&var&i;
run;
%end;
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
/* cfsi; */
%handle_year(file = cfsi, output = cfsi_year);
run;


/* calculate descriptive data and plots */
ods pdf file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_32\assginment3.2.pdf";
/* descriptive data;*/
proc means data = one n mean p25 p50 p75 stddev min max;
output out = means_data mean = ;
output out = medians_data median = ;
by fyear;
where fyear ^= 0;
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

proc means data = usrec_left n mean p25 p50 p75 stddev min max;
*output out = usrec_1_stat mean = ;
where usrec = 1 and fyear ^=0;
run; 

proc means data = usrec_left n mean p25 p50 p75 stddev min max;
*output out = usrec_1_stat mean = ;
where usrec = 0 and fyear ^=0;
run; 

%join_wt_one(left = medians_data, right = baaffm_year, output = baaffm_left);
%join_wt_one(left = medians_data, right = cfsi_year, output = cfsi_left);

*plot means;
title " mean for funda";
%plot(means_data, fyear);
*plot median;
title "median for funda";
%plot(medians_data,fyear);
* plot baafm with one;
title "plot of financial data with spread";
%plotbaaffm;
* CFSI ;
title "plot of financial data with cfsi";
%plotcfsi;

ods pdf close;
