%web_drop_table(dog);
FILENAME REFFILE '/folders/myfolders/6612_logis_longitu/uni_dog.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=dog;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=dog;
RUN;

proc mixed data=dog;
    title "two-way effects model";
	class id group time;
	model y=group time group*time / solution;
	random intercept / subject=id(group);
	contrast 'linear' time -2 -1 0 1 2;
	contrast 'quadratic' time 2 -1 -2 -1 2;
	contrast 'cubic' time -1 2 0 -2 1;
	contrast 'quartic' time 1 -4 6 -4 1;
	contrast 'CH CL' group*time 1 -1 0 0 0 -1 1 0 0 0 0 0 0 0 0,
	                 group*time 1 0 -1 0 0 -1 0 1 0 0 0 0 0 0 0,
	                 group*time 1 0 0 -1 0 -1 0 0 1 0 0 0 0 0 0,
	                 group*time 1 0 0 0 -1 -1 0 0 0 1 0 0 0 0 0;   
	contrast 'CH CO' group*time 1 -1 0 0 0 0 0 0 0 0 -1 1 0 0 0,
	                 group*time 1 0 -1 0 0 0 0 0 0 0 -1 0 1 0 0,
	                 group*time 1 0 0 -1 0 0 0 0 0 0 -1 0 0 1 0,
	                 group*time 1 0 0 0 -1 0 0 0 0 0 -1 0 0 0 1;  
	contrast 'CL CO' group*time 0 0 0 0 0 1 -1 0 0 0 -1 1 0 0 0,  
	                 group*time 0 0 0 0 0 1 0 -1 0 0 -1 0 1 0 0,
	                 group*time 0 0 0 0 0 1 0 0 -1 0 -1 0 0 1 0,
	                 group*time 0 0 0 0 0 1 0 0 0 -1 -1 0 0 0 1;
	estimate 'CH CL 60' group*time 1 0 -1 0 0 -1 0 1 0 0 0 0 0 0 0/ cl;                 
	estimate 'CH CO 60' group*time 1 0 -1 0 0 0 0 0 0 0 -1 0 1 0 0/ cl;
	estimate 'CL CO 60' group*time 0 0 0 0 0 1 0 -1 0 0 -1 0 1 0 0/ cl;
RUN;