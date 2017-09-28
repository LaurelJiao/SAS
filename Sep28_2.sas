/*one to one match; dataset*/
data dads;
input famid name $inc;
datalines;
2 art 220 
1 bill 300
3 paul 250
;
run;

data faminc;
input famid faminc96 faminc97 faminc98;
datalines;
3 750 760 770
1 400 406 302
2 380 488 202
;
run;


proc sql;
create table dadfaml as 
select * from dads, faminc 
where dads.famid = faminc.famid
order by dads.famid;
quit;

title "dadfaml";
proc print data = dadfaml;
run;

/*one to many merge*/

data dads;
input fid name $inc;
datalines;
2 art 220 
1 bill 300
3 paul 250
;
run;

data kids;
input famid kidname $ birth age wt sex $;
datalines;
1 beth 1 9 60 f
1 bob 2 6 40 m
1 barb 3 3 20 f
2 andy 1 8 80 m
2 al 2 6 50 m
2 ann 3 2 29 f
3 pete 1 6 50 m
4 pam 2 4 40 f
3 phil 3 2 20 m
;
run;

proc sql;
create table dadkids2 as 
select *
from dads, kids
where dads.fid = kids.famid
order by dads.fid, kids.famid;
quit;

/* produce distinct values in a column using sql*/
data places;
/* $12. char type with length no more than 12 */
input pid city $12.;
datalines;
1 losangeles
2 orlando
3 london
4 nyc
5 boston
6 paris
7 washingtondc
8 losangeles
9 orlando
10 london
;
run;

proc sql;
create table distinct_city as
select distinct city
from places;
quit;





