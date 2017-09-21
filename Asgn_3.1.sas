
libname comp "Q:\Data-ReadOnly\COMP";

* Only get the data in these years;
%let fyearlist =(1971 1974 1979 1984 1988 1990 1995 1999 2002 2005 2008 2012 2015);

* keep these variables;
%let vars = fyear gvkey ch ivst rect invt aco act ppent ivaeq ivao intan ao at dlc ap txp lco lct dltt lo txditc mib lt
			pstk ceq teq dv sale cogs xsga oibdp xint nopi spi pi txt mii ib dvp cstke xido ni ibc dpc xidoc txdc esubc sppiv fopo
			fopt recch invch apalch txach aoloch oancf ivch siv capx sppe aqc ivstch ivaco ivncf sstk prstkc dv dltis dltr dlcch fiao fincf
			exre chech fsrco fuseo wcapc at sale dlc dltt dltis dltr sstk prstkc at seq ppent mkvalt siv;

/* Read the data */
data one;
set comp.funda;
if indfmt = 'INDL' and datafmt = 'STD' and popsrc = 'D' and consol = 'C';
if scf = 4 or scf = 5 or scf = 6 or scf = . then delete;
if 4900 < sich < 4999 then delete;
if 6000 < sich < 6999 then delete;
if COMPST ne 'AB';

if scf = 1 then do
invests = capx + ivch + aqc + fuseo - sppe - siv;
cwc = wcapc + chech + dlcch;
icf = ibc + xidoc + dpc + txdc + esubc + sppiv + fopo + fsrco;
end;

if scf = 2 or 3 then do
invests = capx + ivch + aqc + fuseo - sppe - siv;
cwc = -wcapc + chech + dlcch;
icf = ibc + xidoc + dpc + txdc + esubc + sppiv + fopo + fsrco;
end;

if scf = 7 then do
invests = capx+ivch+aqc-sppe-siv-ivstch-ivaco;
cwc =  -RECCH-INVCH-APALCH-TXACH-AOLOCH+CHECH-FIAO-DLCCH;
icf = IBC+XIDOC+DPC+TXDC+ESUBC+SPPIV+FOPO+EXRE;
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


keep &vars invests cwc icf fd ndi nei nef noisp ofo stic na bvd ndi nei gdioverna dlcoverna cldoverna ltdoverat bl tan mkvaoverat pro
dvoverna cpinvestoverna cwcoverna icfoverna fdoverna ndioverna neioverna nefoverna sale logsales;
where fyear in &fyearlist;
run;

* Sort the data by year;
proc sort data = one;
by fyear;
run;

 ods pdf file = "\\prism.nas.gatech.edu\rjiao7\Documents\Desktop\SAS\assginment3.1.pdf";
* descriptive data;
proc means data = one n mean p25 p50 p75 stddev min max;
by fyear;
run; 

* correlation;
/* variables for corr calculation;
dvoverna = dv / na;
cpinvestoverna = invests / na;
cwcoverna = cwc / na;
icfoverna = icf / na;
fdoverna = fd / na;
gdioverna;
ndioverna = ndi / na;
neioverna = nei / na;
nefoverna = nef / na;
bl ;
tan;
mkvaoverat;
logsales =log(sales);
*pro;
*/
proc corr data = one;
var dvoverna cpinvestoverna cwcoverna icfoverna fdoverna gdioverna ndioverna neioverna nefoverna
bl tan mkvaoverat logsales pro;
run;

ods pdf close;
