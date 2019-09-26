*************	P	R	O	G	R	A	M		H	E	A	D	E	R	*****************
*****************************************************************************************
*																						*
*	PROGRAM:	Prg 1 - Import Data Into SAS - Hypertension Study.sas                   *
*	PURPOSE:	Create SAS data sets from all source data files                         *
*	AUTHOR:		Jud Blatchford															*
*	CREATED:	2018-09-18																*
*	                                                                                    *
*	COURSE:		BIOS 6680 - Data Management Using SAS                                   *
*	DATA USED:	Source.Scans                                                            *
*	SOFTWARE:	SAS (r) Proprietary Software 9.4 (TS1M5)								*
*	MODIFIED:	DATE		BY	REASON													*
*				----------	---	-------------------------------------------------------	*
*				20YY-MM-DD	PJB															*
*	                                                                                    *
*****************************************************************************************
***********************************************************************************; RUN;


*   Instructions:
    1)  Change the path in the %LET statement to the location of the BIOS 6680 course root folder
    2)  Submit the %LET and LIBNAME statements below   *;
*	Note:  Forward slashes are used for portability across operating environments   *;

%LET CourseRoot = /folders/myfolders/BIOS 6680 - SAS;

LIBNAME HypSrc  "&CourseRoot/Hypertension Study/Data/1_Source";
LIBNAME HypImpt "&CourseRoot/Hypertension Study/Data/2_Import";



*	Importing SAS Data    *;
DATA HypImpt.ndi;
    SET HypSrc.NDI;
    RUN;


*	Importing In-stream Data   *;

DATA HypImpt.States;
    INFILE DATALINES DELIMITER = ",";
    INPUT StateNum
          StateCd  :$2.
          StateNm  :$20. ; 
    DATALINES;
15,IA,Iowa
24,MS,Mississippi
44,UT,Utah
;

*	Importing Microsoft Excel Data   *;

*	Importing 'Utah Vitals.xlsx'   *;

* The XLSX engine is used for x64 linux .xlsx file *;

LIBNAME UV XLSX "&CourseRoot/Hypertension Study/Data/1_Source/Utah Vitals.xlsx";

DATA	HypImpt.Utah_Vitals_2010;
	SET	UV.vitals10;
	RUN;

DATA	HypImpt.Utah_Vitals_2011;
	SET	UV.vitals11;
	RUN;

DATA	HypImpt.Utah_Vitals_2012;
	SET	UV.vitals12;
	RUN;

DATA	HypImpt.Utah_Vitals_2013;
	SET	UV.vitals13;
	RUN;

DATA	HypImpt.Utah_Vitals_2014;
	SET	UV.vitals14;
	RUN;	
	
*	Importing 'VIT_IA.xls'   *;

PROC IMPORT
        DATAFILE =  "&CourseRoot/Hypertension Study/Data/1_Source/VIT_IA.xls"
        OUT = HypImpt.VIT_IA
        DBMS = XLS
        REPLACE ;
     RUN;


*	Importing Column-Aligned Raw Data   *;

DATA HypImpt.UT_Records;
     INFILE "&CourseRoot/Hypertension Study/Data/1_Source/UT_Records.dat";
     INPUT  
           ID         1-9
           Inits    $ 11-16
           CitySt   $ 20-43
           ZipCode  $ 44-48
      @50  GenderCode $1.
      @51  EthnicityCode $1.
      @52  RaceCode $1.
      @54  BirthYear 4.
      @60  BirthMonth 2.
      @62  BirthDay 2. ;
     RUN;

*	Importing Delimited Raw Data   *;

DATA		HypImpt.IowaResidents;
	INFILE	"&CourseRoot/Hypertension Study/Data/1_Source/IowaResidents.csv"
			DSD;
	INPUT	SSN			:$11.
			Initials		:$4.
			City		:$20.
			State		:$4.
			ZipCd
			Sex			:$6.
			Ethnicity	:$12.
			Race		:$5.
			BirthDt		MMDDYY10.	;
	FORMAT  BirthDt MMDDYY10. ;
    RUN;


*	Importing Raw Data In Uncommon Structures   *;

DATA HYPIMPT.Mississippi_VS ;
    INFILE "/folders/myfolders/BIOS 6680 - SAS/Hypertension Study/Data/1_Source/Mississippi VS.dat" 
            DELIMITER = ":";
    INPUT 
           SSN :$11.
           VISITDATE :MMDDYY10. 
           HEIGHT
           WEIGHT
           SBP
           DBP @@;
    FORMAT VISITDATE MMDDYY10.  ;     
    RUN;

DATA HYPIMPT.MS_Citizens ;
    INFILE "/folders/myfolders/BIOS 6680 - SAS/Hypertension Study/Data/1_Source/MS Citizens.txt" 
            DELIMITER = "|" N = 2;
    INPUT  SocSecNum :$11.
           FirstInit :$2.
          MiddleInit :$2.
           LastInit  :$2.
           CityState :$35. 
          ZipCd      :$5.
        #2 Gender    :$6.
           Eth       :$22.
          Racial     :$16.
           DOB       :$9.;  
    RUN;

DATA WORK.HW7;
    INFILE DATALINES ;
    INPUT League $ @;
    IF League = 'American' THEN   INPUT Team $
                                @31 Wins
                                @34  Losses ;
    DATALINES;
National  New York Mets       19 12
American  Toronto Blue Jays   19 13
American  Boston Red Sox      17 12
National  St Louis Cardinals  13 11
;


;	*';	*";	*/;	QUIT;	RUN;
*	End of Program   *; RUN;

