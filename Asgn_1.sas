options ls = 70 nodate nocenter;

libname path "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data";

/* Import data*/
filename data1 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2012_q10.zip" member = "q1_2012_all.csv";
filename data2 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2012_q2.zip" member = "q2_2012_all.csv";
filename data3 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2012_q3.zip" member = "q3_2012_all.csv";
filename data4 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2012_q4.zip" member = "q4_2012_all.csv";
filename data5 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2013_q1.zip" member = "q1_2013_all.csv";
filename data6 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2013_q2.zip" member = "q2_2013_all.csv";
filename data7 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2013_q3.zip" member = "q3_2013_all.csv";
filename data8 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2013_q4.zip" member = "q4_2013_all.csv";
filename data9 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2014_q1.zip" member = "q1_2014_all.csv";
filename data10 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2014_q2.zip" member = "q2_2014_all.csv";
filename data11 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2014_q3.zip" member = "q3_2014_all.csv";
filename data12 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2014_q4.zip" member = "q4_2014_all.csv";
filename data13 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2015_q1.zip" member = "q1_2015_all.csv";
filename data14 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2015_q2.zip" member = "q2_2015_all.csv";
filename data15 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2015_q3.zip" member = "q3_2015_all.csv";
filename data16 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2015_q4.zip" member = "q4_2015_all.csv";
filename data17 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2016_q1.zip" member = "q1_2016_all.csv";
filename data18 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2016_q2.zip" member = "q2_2016_all.csv";
filename data19 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2016_q3.zip" member = "q3_2016_all.csv";
filename data20 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2016_q4.zip" member = "q4_2016_all.csv";
filename data21 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2017_q1.zip" member = "q1_2017_all.csv";
filename data22 ZIP "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\Data\individual_security_2017_q2.zip" member = "q2_2017_all.csv";

data DataCollection1;
infile data1 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection2;
infile data2 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection3;
infile data3 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;


data DataCollection4;
infile data4 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection5;
infile data5 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection6;
infile data6 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection7;
infile data7 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection8;
infile data8 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection9;
infile data9 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection10;
infile data10 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection11;
infile data11 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;


data DataCollection12;
infile data12 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection13;
infile data13 firstobs = 2 dsd dlm=",";

input Date	Security$	Ticker$	McapRank	TurnRank	VolatilityRank	PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;


data DataCollection14;
infile data14 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection15;
infile data15 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection16;
infile data16 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection17;
infile data17 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;


data DataCollection18;
infile data18 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

data DataCollection19;
infile data19 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;


data DataCollection20;
infile data20 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;


data DataCollection21;
infile data21 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;


data DataCollection22;
infile data22 firstobs = 2 dsd dlm=",";

input Date Security$ Ticker$ McapRank TurnRank VolatilityRank PriceRank LitVol OrderVol Hidden TradesForHidden 
HiddenVol TradeVolForHidden	Cancels	LitTrades OddLots TradesForOddLots OddLotVol TradeVolForOddLots;

run;

/* Separate Stock and ETF data */

DATA stockdata;
  SET DataCollection1 DataCollection2 DataCollection3 DataCollection4 DataCollection5 DataCollection6 DataCollection7 DataCollection8 DataCollection9 DataCollection10
DataCollection11 DataCollection12 DataCollection13 DataCollection14 DataCollection15 DataCollection16 DataCollection17 DataCollection18 DataCollection19 DataCollection20
DataCollection21 DataCollection22;

Trades = Hidden + TradesForHidden + Cancels +  LitTrades + OddLots + TradesForOddLots ;
TradeVol = LitVol + OrderVol + HiddenVol + TradeVolForHidden + OddLotVol + TradeVolForOddLots;
Cancel_to_Trade= Cancels/LitTrades;
Trade_to_Order_Volume = 100*LitVol/OrderVol;
Hidden_Rate = 100*Hidden/TradesForHidden;
Hidden_Volume = 100*HiddenVol/TradeVolForHidden;
Oddlot_Rate=100*OddLots/TradesForOddLots;
Oddlot_Volume=100*OddLotVol/TradeVolForOddLots;

keep Security Cancels Trades LitTrades OddLots Hidden TradesForHidde OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume;

if Security = 'Stock';
run;

DATA ETFdata;
  SET DataCollection1 DataCollection2 DataCollection3 DataCollection4 DataCollection5 DataCollection6 DataCollection7 DataCollection8 DataCollection9 DataCollection10
DataCollection11 DataCollection12 DataCollection13 DataCollection14 DataCollection15 DataCollection16 DataCollection17 DataCollection18 DataCollection19 DataCollection20
DataCollection21 DataCollection22;

Trades = Hidden + TradesForHidden + Cancels +  LitTrades + OddLots + TradesForOddLots ;
TradeVol = LitVol + OrderVol + HiddenVol + TradeVolForHidden + OddLotVol + TradeVolForOddLots;
Cancel_to_Trade= Cancels/LitTrades;
Trade_to_Order_Volume = 100*LitVol/OrderVol;
Hidden_Rate = 100*Hidden/TradesForHidden;
Hidden_Volume = 100*HiddenVol/TradeVolForHidden;
Oddlot_Rate=100*OddLots/TradesForOddLots;
Oddlot_Volume=100*OddLotVol/TradeVolForOddLots;

keep Security Cancels Trades LitTrades OddLots Hidden TradesForHidde OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume;

if Security = 'ETF';
run;


/*ods pdf file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\Asgn_1\SAS Asgn_1 Report.pdf";
/* Compute mean p25 p50 p75 stdev */

proc means data = stockdata n mean p25 p50 p75 std;
by security
title 'Descriptive Stats for Stock data during past 22Q ';
run;

proc means = etfdata n mean p25 p50 p75 std;
by security
title 'Descriptive Stats for ETF data during past 22Q ';
run;

/*Randomly sample 100 stocks and plot the descriptive stats for this group over time. Note, its not security 
by security plot, but the descriptive stats for the sample of these 100 firms that are sampled in the 2012Q1*/
data Stock2012Q1 ETF2012Q1;
set DataCollection1;

Date = input(put(Date,z8.),yymmdd10.);
format Date yymmdd10.;
Trades = Hidden + TradesForHidden + Cancels +  LitTrades + OddLots + TradesForOddLots ;
TradeVol = LitVol + OrderVol + HiddenVol + TradeVolForHidden + OddLotVol + TradeVolForOddLots;
Cancel_to_Trade= Cancels/LitTrades;
Trade_to_Order_Volume = 100*LitVol/OrderVol;
Hidden_Rate = 100*Hidden/TradesForHidden;
Hidden_Volume = 100*HiddenVol/TradeVolForHidden;
Oddlot_Rate=100*OddLots/TradesForOddLots;
Oddlot_Volume=100*OddLotVol/TradeVolForOddLots;

keep date Security Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume;

if Security = 'Stock' then output Stock2012Q1;
if Security = 'ETF' then output ETF2012Q1;
run;


proc surveyselect data = Stock2012Q1
method = srs n = 100
out = random_stock;
strata date;
run;

proc sort data = random_stock;
by date;
run;

proc means data = random_stock;
var Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume;
by date;
output out = mean_random_stocks mean = ;
output out = p25_random_stocks p25 = ;
output out = p50_random_stocks p50 = ;
output out = p75_random_stocks p50 = ;
output out = std_random_stocks stddev = ;
run;



/*Randomly sample 100 ETFs and plot the descriptive stats for this group over time. Note, its not security by security plot, 
but the descriptive stats for the sample of these 100 ETFs that are sampled in the 2012Q1 */

proc surveyselect data = ETF2012Q1
method = srs n = 100
out = random_ETF;
strata date;
run;

proc sort data = random_etf;
by date;
run;

proc means data = random_etf;
var Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume;
by date;
output out = mean_random_etf mean = ;
output out = p25_random_etf p25 = ;
output out = p50_random_etf p50 = ;
output out = p75_random_etf p50 = ;
output out = std_random_etf stddev = ;
run;

/*plot*/

title "Plot of mean data random stock";
proc gplot data = Mean_random_stocks;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;

title "Plot of mean data random ETF";
proc gplot data = Mean_random_etf;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;

title "Plot of p25 data random stock";
proc gplot data = p25_random_stocks;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;

title "Plot of p25 data random ETF";
proc gplot data = p25_random_etf;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;


title "Plot of p50 data random stock";
proc gplot data = p50_random_stocks;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;

title "Plot of p50 data random ETF";
proc gplot data = p50_random_etf;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;


title "Plot of p75 data random stock";
proc gplot data = p75_random_stocks;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;



title "Plot of p75 data random ETF";
proc gplot data = p75_random_etf;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;



title "Plot of Std data random stock";
proc gplot data = Std_random_stocks;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;


title "Plot of Std data random ETF";
proc gplot data = std_random_etf;
	symbol1 i = spline v = circle h = 2;
	symbol2 i = spline v = circle h = 2;
	symbol3 i = spline v = circle h = 2;
	symbol4 i = spline v = circle h = 2;
	symbol5 i = spline v = circle h = 2;
	symbol6 i = spline v = circle h = 2;
	symbol7 i = spline v = circle h = 2;
	symbol8 i = spline v = circle h = 2;
	symbol9 i = spline v = circle h = 2;
	symbol10 i = spline v = circle h = 2;
	symbol11 i = spline v = circle h = 2;
	symbol12 i = spline v = circle h = 2;
	symbol13 i = spline v = circle h = 2;
	symbol14 i = spline v = circle h = 2;
	symbol15 i = spline v = circle h = 2;
	symbol16 i = spline v = circle h = 2;
	symbol17 i = spline v = circle h = 2;
	symbol18 i = spline v = circle h = 2;
/*Cancels Trades LitTrades OddLots Hidden TradesForHidden OrderVol TradeVol LitVol OddLotVol HiddenVol TradeVolForHidden 
Cancel_to_Trade Trade_to_Order_Volume Hidden_Rate Hidden_Volume Oddlot_Rate Oddlot_Volume */
	plot Cancels * date = 1
		Trades * date = 2
		LitTrades * date = 3
		OddLots * date = 4
		Hidden * date =5
		TradesForHidden * date = 6
		OrderVol * date = 7
		TradeVol * date = 8
		LitVol * date = 9
		OddLotVol *date = 10
		HiddenVol * date = 11
		TradesForHidden * date = 12
		Cancel_to_Trade * date = 13
		Trade_to_Order_Volume * date = 14
		Hidden_Rate * date = 15
		Hidden_Volume * date = 16
		Oddlot_Rate * date = 17
		Oddlot_Volume * date = 18 /
		overlay;
run;




/* Analysis

Generally, number of trades and volumes in ETF are much higher than those in stocks data. Considering the
structures of ETF, the risk has already been diverstified and is more preferable to the investors.

By comparing the plots of the statistics on ETF and Stocks, we could clearly observe that the volatilily 
of stocks is much higher than ETF in each variables. 

Similarly, other variables of stocks data also express higher movements than the ETF data. While the mean
of stocks data is generally higher than that of ETF, there is several significant outliers in ETF at particular
date. 


*/
