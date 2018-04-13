%web_drop_table(F1);
FILENAME REFFILE '/folders/myfolders/6612_logis_longitu/HW6/file1_FEV1.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=F1;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=F1;
RUN;

%web_open_table(F1);
%web_drop_table(F2);
FILENAME REFFILE '/folders/myfolders/6612_logis_longitu/HW6/file2_FEV1.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=F2;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=F2;
RUN;

%web_open_table(F2);

PROC GLM DATA=F2;
	title "Model 1: no within subject correlation";
	CLASS trt current_smoker race;
	MODEL FEV1=trt pack_years current_smoker emphysema race height bmi/SOLUTION;
	RUN;

PROC GLM DATA=F1;
	title "Model2: delta FEV1 and adjusting for baseline FEV1";
	CLASS current_smoker race;
	MODEL delta_FEV1=pre_FEV1 pack_years current_smoker emphysema race height 
		bmi/SOLUTION;
	RUN;

PROC MIXED DATA=F2;
	title "Model3: Random intercept and slope";
	CLASS ID current_smoker race;
	MODEL FEV1=trt pack_years current_smoker emphysema race height bmi/SOLUTION;
	RANDOM INT trt /TYPE=UN SUBJECT=ID G GCORR;
RUN;

PROC MIXED DATA=F2;
	title "Model4: Random intercept";
	CLASS ID trt current_smoker race;
	MODEL FEV1=trt pack_years current_smoker emphysema race height bmi/SOLUTION;
	RANDOM INT /TYPE=UN SUBJECT=ID G GCORR;
RUN;
