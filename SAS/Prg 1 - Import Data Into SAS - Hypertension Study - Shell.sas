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

%LET    CourseRoot = [fill-in-your-course-root];
LIBNAME HypSrc  "finish-LIBNAME-statement";
LIBNAME HypImpt "finish-LIBNAME-statement";



*	Importing SAS Data    *;



*	Importing In-stream Data   *;



*	Importing Microsoft Excel Data   *;

*	Importing 'Utah Vitals.xlsx'   *;

*	Importing 'VIT_IA.xls'   *;



*	Importing Column-Aligned Raw Data   *;



*	Importing Delimited Raw Data   *;



*	Importing Raw Data In Uncommon Structures   *;



;	*';	*";	*/;	QUIT;	RUN;
*	End of Program   *; RUN;

