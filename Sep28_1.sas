libname COE "C:\Users\rjiao7\Downloads";
libname SAVE "C:\Users\rjiao7\Downloads";

data plot_mean;
set SAVE.plot_mean;
run;

data usrec;
infile '\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_32\usrec.csv' delimiter = ',' dsd firstobs = 2;
* position-wise importing;
input date $1-4 @12 usrec;
run;
/*convert character-type to numerical-type fyear*/
data usrec_numerical;
set usrec;
fyear = input(date, 4.);
run;

data combine_plot_mean_wt_usrec;
merge plot_mean  usrec_numerical;
by fyear;
run;

%let all_ratios = current_ratio quick_ratio debt_to_equity_ratio;

title "Descriptive stats for NBER recession = 1 and NBER recession = 0";
proc mean data = combine_plot_mean_wt_usrec n mean p25 p50 p75 std min max nway;
/*loop through this usrec data??*/
class usrec;
var &all_ratios;
output out = usrec_statstics;
run;

/*load baaffm*/
data baaffm;
infile '\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_32\baaffm.csv' delimiter = ',' dsd firstobs = 2;
* position-wise importing;
input date $1-4 @12 baaffm;
run;

data baaffm_numerical;
set baaffm;
fyear = input(date, 4.);
run;

data combine_plot_mean_wt_baaffm;
merge plot_mean  baaffm_numerical;
by fyear;
/*if _STAT_ ne 'mean' then delete;*/
run;

title "plot baa_spread with current_ratio";
proc sgplot data = combine_plot_mean_wt_baaffm;
series x = fyear y = Current_ratio / markers y2axis;
series x = fyear y = baaffm / markers;
run;

/*SQL*/
