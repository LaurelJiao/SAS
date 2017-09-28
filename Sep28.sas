data dads;
input famid name $ inc;
datalines;
2 Art 22000
1 Bill 3000
3 Paul 25000
;
run;

data faminc;
input famid faminc96 faminc97 faminc98;
datalines;
3 750 760 770
1 400 200 800
2 454 463 478
;
run;

proc sort data = dads out = dads_sorted;
by famid;
run;

proc sort data = kids out =kids_sorted;
by famid;
run;

data dadfam;
merge dads_sorted faminc_sorted;
by famid;
run;

proc print data = dadfam;
run;

/* one to many merge */

data dads;
input famid name $ inc;
datalines;
2 art 220
1 bill 300
3 paul 250
4 karl 232
;
run;

data kids;
input famid kidname $birth age wt sex $;
datalines;
1 beth 1 9 60 f
1 bob 2 6 40 m
1 borb 3 3 20 f
2 andy 1 8 80 m
2 al 2 6 50 m
2 ann 3 2 20 f
3 peter 1 6 60 m
3 Pam 2 4 40 f
3 Phil 3 2 20 m
5 sam 2 3 28 f
6 dave 3 2 10 m
;
run;

proc sort data = dads out = dads_sorted;
by famid;
run;

proc sort data = kids out = kids_sorted;
by famid;
run;

/* matching records in one-to-one merge with missmatch */

Data dadkid;
merge dads_sorted kids_sorted;
by famid;
run;



