/* Self computed variable description
invests: investments
cwc:	 change in working capital
icf:	 internal cashflow
fd: 	 financial deficit
ndi:	 net debt issues
nei:	 net equity issues
nef: 	 net external financing
na: 	 net assets
bvd: 	 book value of debt
ndi: 	 net debt issued
nei: 	 net equity issued
nef: 	 total net external financing
dvoverna:	dividend over net asset
cpinvestoverna:	capital investment over net asset
cwcoverna: change of working capital over net asset
icfoverna: internal cash flow over net asset
fdoverna: financial dicit over net asset
gdioverna: gross debt issued over net asset
ndioverna: net debt issued over net asset
neioverna: net equity issued over net asset
nefoverna: net external financing over net asset
bl: book leverage
tan: tangibility
mkvaoverat: market value over book asset
logsales: log of sales
pro: profitability
*/
libname comp "Q:\Data-ReadOnly\COMP";

* Only get the data in these years;
%let fyearlist =(1971 1974 1979 1984 1988 1990 1995 1999 2002 2005 2008 2012 2015);

* keep these variables;
%let vars0 = fyear gvkey;
%let vars = ch ivst rect invt aco act ppent ivaeq ivao intan ao at dlc ap txp lco lct dltt lo txditc mib lt
			pstk ceq teq dv sale cogs xsga oibdp xint nopi spi pi txt mii ib dvp cstke xido ni ibc dpc xidoc txdc esubc sppiv fopo
			fopt recch invch apalch txach aoloch oancf ivch siv capx sppe aqc ivstch ivaco ivncf sstk prstkc dv dltis dltr dlcch fiao fincf
			exre chech fsrco fuseo wcapc at sale dlc dltt dltis dltr sstk prstkc at seq ppent mkvalt siv;
%local i next;
%let i =1;
%do %while (%scan(&vars, &i) ne );
%let next = %scan(&vars, &i);
%let next = next/at;
%let i = %eval(&i + 1);
%end;

%let vars1 = invests cwc icf;

%local i next;
%let i =1;
%do %while (%scan(&vars1, &i) ne );
%let next = %scan(&vars1, &i);
%let next = next/at;
%let i = %eval(&i + 1);
%end;


%let vars2 = fd ndi nei nef noisp ofo stic na bvd ndi nei gdioverna dlcoverna cldoverna ltdoverat bl tan mkvaoverat pro
dvoverna cpinvestoverna cwcoverna icfoverna fdoverna ndioverna neioverna nefoverna sale logsales;


/* Read the data */
data one;
set comp.funda;
if indfmt = 'INDL' and datafmt = 'STD' and popsrc = 'D' and consol = 'C';
if scf = 4 or scf = 5 or scf = 6 or scf = . then delete;
if 4900 < sich < 4999 then delete;
if 6000 < sich < 6999 then delete;
if COMPST ne 'AB';

* Compute the data for different scf type;
if scf = 1 then do
invests = (capx + ivch + aqc + fuseo - sppe - siv)/at;
cwc = (wcapc + chech + dlcch)/at;
icf = (ibc + xidoc + dpc + txdc + esubc + sppiv + fopo + fsrco)/at;
end;

if scf = 2 or 3 then do
invests = (capx + ivch + aqc + fuseo - sppe - siv)/at;
cwc = (-wcapc + chech + dlcch)/at;
icf = (ibc + xidoc + dpc + txdc + esubc + sppiv + fopo + fsrco)/at;
end;

if scf = 7 then do
invests = (capx+ivch+aqc-sppe-siv-ivstch-ivaco)/at;
cwc =  (-RECCH-INVCH-APALCH-TXACH-AOLOCH+CHECH-FIAO-DLCCH)/at;
icf = (IBC+XIDOC+DPC+TXDC+ESUBC+SPPIV+FOPO+EXRE)/at;
end;
* computed variables;
fd = dv + invests + cwc - icf;
ndi = dltis - dltr;
nei = sstk - prstkc;
nef = ndi + nei;
*********************;
noisp = nopi + spi;
ofo = xidoc + txdc + esubc + sppiv + fopo;
stic = ivstch + ivaco;
**************************;
na = at - lct;
bvd = dlc + dltt;
ndi = dltis - dltr;
nei = sstk - prstkc;
gdioverna = dltis/na;
dlcoverna = dlc/na;
cldoverna = ndi / at;
ltdoverat = dltt/at;
bl = (dltt + dlc)/(dltt + dlc + seq);
tan = ppent/at;
mkvaoverat = mkvalt/at;
pro = ni/at;

* variables for correlation calculation;
* all are indicated in the excel file, the commented variables are the ones
that have already been computed;
dvoverna = dv / na;
cpinvestoverna = invests / na;
cwcoverna = cwc / na;
icfoverna = icf / na;
fdoverna = fd / na;
* gdioverna;
ndioverna = ndi / na;
neioverna = nei / na;
nefoverna = nef / na;
* bl ;
* tan;
* mkvaoverat;
logsales = log(SALE);
*pro;

keep &vars0 &vars &vars1 &vars2;
where fyear in &fyearlist;
run;

* Sort the data by year;
proc sort data = one;
by fyear;
run;

* Replacing missing value;
proc stdize data = one reponly missing=0;
run;


ods pdf file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\assginment3.1.pdf";
* descriptive data;
proc means data = data1 n mean p25 p50 p75 stddev min max;
output out = means_data;
by fyear;
run; 
* correlation;
proc corr data = data1;
var dvoverna cpinvestoverna cwcoverna icfoverna fdoverna gdioverna ndioverna neioverna nefoverna
bl tan mkvaoverat logsales pro;
run;

ods pdf close;

