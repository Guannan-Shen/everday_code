%LET CourseRoot = /folders/myfolders/BIOS 6680 - SAS;

LIBNAME CanSrc  "&CourseRoot/Cancer RCT/Data/1_Source";
LIBNAME CanImpt "&CourseRoot/Cancer RCT/Data/2_Import";

LIBNAME HypSrc  "&CourseRoot/Hypertension Study/Data/1_Source";
LIBNAME HypImpt "&CourseRoot/Hypertension Study/Data/2_Import";



DATA	CanImpt.Scans;
	SET	CanSrc.Scans;
	RUN;

DATA	CanImpt.Sites;
	INFILE	DATALINES	DELIMITER = ',';
	INPUT	SiteCd
			SiteAbrv	:$4.
			SiteNm		:$35.	;
	DATALINES;
1,NJCC,New Jersey Cancer Center
2,OICR,Oregon Institute of Cancer Research
;

LIBNAME NJCCLabs XLSX "&CourseRoot/Cancer RCT/Data/1_Source/Laboratory.xlsx";

DATA	CanImpt.Laboratory_2015;
	SET	NJCCLabs.NJCC___2015;
	RUN;

DATA	CanImpt.Laboratory_2016;
	SET	NJCCLabs.NJCC___2016;
	RUN;

LIBNAME NJCCLabs CLEAR;

PROC IMPORT
		DATAFILE	= "&CourseRoot/Cancer RCT/Data/1_Source/Lab Data.xls"
		OUT			= CanImpt.Lab_Data_Pt1
		DBMS		= XLS
		REPLACE		;
	SHEET	= 'Pt_1';
	RUN;

PROC IMPORT
		DATAFILE	= "&CourseRoot/Cancer RCT/Data/1_Source/Lab Data.xls"
		OUT			= CanImpt.Lab_Data_Pt2
		DBMS		= XLS
		REPLACE		;
	SHEET	= 'Pt_2';
	RUN;

PROC IMPORT
		DATAFILE	= "&CourseRoot/Cancer RCT/Data/1_Source/Lab Data.xls"
		OUT			= CanImpt.Lab_Data_Pt3
		DBMS		= XLS
		REPLACE		;
	SHEET	= 'Pt_3';
	RUN;

PROC IMPORT
		DATAFILE	= "&CourseRoot/Cancer RCT/Data/1_Source/Lab Data.xls"
		OUT			= CanImpt.Lab_Data_Pt4
		DBMS		= XLS
		REPLACE		;
	SHEET	= 'Pt_4';
	RUN;

PROC IMPORT
		DATAFILE	= "&CourseRoot/Cancer RCT/Data/1_Source/Lab Data.xls"
		OUT			= CanImpt.Lab_Data_Pt5
		DBMS		= XLS
		REPLACE		;
	SHEET	= 'Pt_5';
	RUN;

DATA	CanImpt.DM;
	INFILE	"&CourseRoot/Cancer RCT/Data/1_Source/DM.txt";
	INPUT	@1	ID		2.
			@3	GENDER	$6.
			@9	ETHNIC	$22.
			@35	RACE	$16.
			@51	DOB		MMDDYY10.;
	RUN;

DATA	CanImpt.Address;
	INFILE	"&CourseRoot/Cancer RCT/Data/1_Source/Address.csv"	DELIMITER = ','	MISSOVER	DSD;
	INPUT	ID			:$3.
			First		:$10.
			Middle		:$10.
			Last		:$20.
			Street_Num
			Street_Name	:$30.
			Zip
			HOME		:$14.
			CELL		:$12.	;
	RUN;

DATA	CanImpt.Arms;
	INFILE	"&CourseRoot/Cancer RCT/Data/1_Source/Arms.dat"	DELIMITER = '|';
	INPUT	Subject_ID	:$4.
			START_DATE	:DATE9.
			Treat		:$9.	@@;
	RUN;

DATA	CanImpt.groups;
	INFILE	"&CourseRoot/Cancer RCT/Data/1_Source/groups.dat"	DELIMITER = ':,';

	INPUT	Treatment	:$21.
			pt_id		@;
		OUTPUT;

	INPUT	pt_id	@;
		OUTPUT;

	IF	_N_ = 1 THEN DO; * This is because the 1st record has 3 subjects, but the 2nd record only has 2 *;
		INPUT	pt_id;
		OUTPUT;
	END;

	RUN;
	
DATA	CanImpt.Demographics;
	INFILE	"&CourseRoot/Cancer RCT/Data/1_Source/Demographics.dat"	N = 2; * Specifies the number of records to keep in the input buffer *;
	INPUT		patient	2
				gender	3
				Hisp	4
				race	5
			#2	@1	BirthDt		$ 1-10	/* #2 instructs SAS to read from the 2nd record */
				@11	OnStudy		MMDDYY6.;
	RUN;
	
	
DATA	CanImpt.PatInfo;
	INFILE	"&CourseRoot/Cancer RCT/Data/1_Source/PatInfo.dat"	N = 3	DLMSTR='::'	MISSOVER DSD;
	INPUT		pat			:$4.
				pat_name	:$30.
			/	Address		:$50.
			#3	Phone_H		:$13.
				Phone_C		;
	RUN;