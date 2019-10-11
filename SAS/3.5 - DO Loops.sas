*************	P	R	O	G	R	A	M		H	E	A	D	E	R	*****************
*****************************************************************************************
*																						*
*	PROGRAM:	3.5 - DO Loops.sas                                                      *
*	PURPOSE:	Illustrate material in Chapter 3.5                                      *
*	AUTHOR:		Jud Blatchford															*
*	CREATED:	2017-08-01																*
*	                                                                                    *
*	COURSE:		BIOS 6680 - Data Management Using SAS                                   *
*	DATA USED:	[Enter data set name(s)]                                                *
*	SOFTWARE:	SAS (r) Proprietary Software 9.4 (TS1M4)								*
*	MODIFIED:	DATE		BY	REASON													*
*				----------	---	-------------------------------------------------------	*
*               2018-10-16  PJB Added TOC & Comprehension Checks                        *
*               2019-09-20  PJB Added LEAVE & CONTINUE Statements and Minor edits       *
*	                                                                                    *
*   CONTENTS:                                                                           *
*   	Section 3.5.0 - The OUTPUT Statement                                            *
*   	Section 3.5.1 - Constructing DO Loops                                           *
*   	Section 3.5.2 - Nesting DO Loops                                                *
*   	Section 3.5.3 - Additional Material                                             *
*   	Section 3.5.4 - Solutions                                                       *
*	                                                                                    *
*****************************************************************************************
***********************************************************************************; RUN;




*	SECTION 3.5.0 - The OUTPUT Statement   *; RUN;

*	At the end of each DATA step are implicit OUTPUT and RETURN statements
	
	The OUTPUT statement instructs SAS to send the contents of the PDV
		to the output data set when it encounters the statement
	When an OUTPUT statement is included, SAS will no longer implicitly output at
		the end of the DATA step!


*	Illustration 1 - Creating a Data Set Using Assignment Statements   *; RUN;

*	We know how to create a data set using In-Stream data
	Using assignment statements, values within a single observation can be created
		OUTPUT statements may be used to create multiple observations

	Goal:  Create a data set containing the 2016, 2017, and 2018 home run leaders

	Method 1:  Using In-Stream Data   *;
DATA WORK.HRLeaders1;
	INFILE DATALINES;
	INPUT	Season
			Player $
			HR	;
	DATALINES;
2016 Trumbo 47
2017 Stanton 59
2018 Davis 48
;

PROC PRINT DATA = WORK.HRLeaders1;
	RUN;

*	Method 2:  Using the OUTPUT statement   *;
DATA WORK.HRLeaders2;
	LENGTH Player $ 7;
	Season=2016; Player='Trumbo'; HR=47;	OUTPUT;
	Season=2017; Player='Stanton'; HR=59;	OUTPUT;
	Season=2018; Player='Davis'; HR=48;		OUTPUT;
	RUN;

PROC PRINT DATA = WORK.HRLeaders2;
	RUN;


*	Illustration 2 - Using the OUTPUT Statement in a Forecast   *; RUN;

*	Suppose we expect each child's height to increase by 3% in the upcoming year

	Task:  Create a report showing both 1) the current year's height,
			2) the forecasted height for each child

	This will illustrate that we will double the number of rows by using the
		OUTPUT statement   *;
DATA WORK.Heights;
	SET SASHelp.Class;
	FORMAT Height 3.;

	* Create a variable 'Year' with the current year's value *;
	Year = YEAR(TODAY());
	OUTPUT;

	* Increments the value of 'Year' and creates forecasted value of 'Height' *;
	Year + 1;
	Height + Height * 0.03;
	OUTPUT;

	RUN;

PROC PRINT DATA = WORK.Heights;
	BY	Name;
	ID	Name;
	VAR Year Height;
	RUN;




*	SECTION 3.5.1 - CONSTRUCTING DO LOOPS   *; RUN;

*	Recall:  A DO group is a group of statements which are all executed inside
				IF/THEN processing when the "IF" expression is true

	DO loops are different than DO groups :)   *;

/*	The syntax for a DO loop is as follows:

	DO index-variable = specification;
		SAS statements;
	END;								*/

*	The DO statement does 2 things:
		1) Starts the DO loop, and 
		2) Sets the condition for exiting the loop

	The END statement is the bottom of the loop *;


*	Illustration 1 - How SAS Processes the DO Loop   *; RUN;

DATA	WORK.Illus;
	DO X = 1 TO 3;
		Y	= X**2;
		PUTLOG	_ALL_; * Writes the values at the bottom of each loop to the log *;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;
*	Note:  X = 4 in the output data set because:
			1) SAS increments the index value at the bottom of the loop
			2) Goes to the top of the loop, and
			3) THEN tests if the index value meets the specification!
		If it is out of the specified range, SAS exits the DO loop.
		So the index value will always be out of range when the DO loop stops executing!

	Note:  There is still an implicit OUTPUT statement at the end of the DATA step   *;


*	Illustration 2 - Using Explicit OUTPUT Statements   *; RUN;

*	It is common to want output produced within each loop of the DO loop
	This is generated by using the OUTPUT statement

	Note:  The implicit OUTPUT statement is no longer in effect
			because we're using an explicit OUTPUT statement!   *;
DATA	WORK.Illus;
	DO	X = 1 TO 10;
		Y = X**2;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 3 - Uusing a DO Loop to Create Variable Values    *; RUN;

*	Give the index variable a meaningful name if it's a variable you want in
		your output data set!   *;
DATA	WORK.Illus;
	DO	Month = 1 TO 12;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 4 - Values for the Index Variable May Be Anything Desired   *; RUN;

*	The index values may start and end at any value
		(i.e. the index variable doesn't have to start at 1)   *;
DATA	WORK.Illus;
	DO	Year = 1990 TO 2020;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 5 - Specifying the Optional BY Index-Variable Option   *; RUN;

*	The BY option in a DO statement allows for incrementing by values
		other than the default value of 1

	Goal:  Generate a list of years for the modern olympics   *;
DATA	WORK.Illus;
	DO	Year = 1896 TO 2020 BY 4;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


* ----------------------------- *
|   Comprehension Check 3.5.1   |
* ----------------------------- *
	Task:  Create a data set named 'Subjects' with a variable named 'SubjID'
			The values of 'SubjID' should be as follows:
		Obs	SubjID
		---	------
		1	101
		2	201
		3	301
		4	401
		...	...
		16	1601   *;
DATA WORK.Subjects;
	DO [enter-specifications-here];
		[enter-statement-here];
	END;
	RUN;

PROC PRINT DATA = WORK.Subjects;
	RUN;


*	Illustration 6 - Specifying an Item List   *; RUN;

*	The index variable values may be specified using a comma-delimited list
	Note:  When there are no more items in the list, SAS stop executing the DO loop   *;
DATA	WORK.Illus;
	DO	Year = 2010, 2011, 2012, 2013, 2014;
		YrsAgo = YEAR(TODAY()) - Year;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 7 - Item List Specifications   *; RUN;

*	The item list may be in any order (i.e. increasing is not required)
		and may be any values (i.e. same interval is not required)   *;
DATA	WORK.Illus;
	DO	Year = 1906, 2001, 1998, 1954;
		YrOfMLB	= Year - 1876 + 1;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 8 - Character Item Lists   *; RUN;

*	Character values must simply be quoted (and still comma-delimited)
	Note:  Alphabetical order is not required   *;
DATA	WORK.Illus;
	DO	Day = 'Mon', 'Tue', 'Wed', 'Thu', 'Fri';
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 9 - Loop Start, End, and Increment Conditions May be Anything   *; RUN;

DATA	WORK.Illus;
	DO	i = 4 TO 25 BY 8;
		LoopCnt + 1;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 10 - Flexibility in Specifying Index Values   *; RUN;

DATA	WORK.Illus;
	DO	i = 2, 7, 8, 10 TO 30 BY 5, -16, 35;
		LoopCnt + 1;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 11 - Loops may Decrement   *; RUN;
DATA	WORK.Illus;
	DO	i = 9 TO 4 BY -2;
		LoopCnt + 1;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 12 - A Loop Which Won't Execute   *; RUN;

*	The loop specificatins must be true (make sense) to start the loop   *;
DATA	WORK.Illus;
	DO	i = 9 TO 4 BY 1;
		LoopCnt + 1;
		OUTPUT;
	END;
	RUN;
*	When interpreting the DO statement, SAS thinks:
	1.  I'm going up (because of the +1 increment)
	2.	I'm going to stop at 4 (because of the end point specified)
	3.	I'm starting at 9
	Conclusion:  I'm already past the stopping point, therefore I don't need to execute!	*;	

* There's nothing to print because no data set was created! *;


*	Illustration 13 - Index Variable Inside the Loop (Caution!)   *; RUN;

*	The index variable value may be changed within the loop (I don't recommend this)
		This can be confusing (need a good reason to do something like this!)   *;

*	Note:  The ending value of i is beyond 10 (the typical value of i when SAS exits the loop)   *;
DATA	WORK.Illus;
	DO	i = 1 TO 10 BY 1;
		LoopCnt + 1;
		i + LoopCnt;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 14 - Using a DO Loop to Save Repetitive Statements   *; RUN;

*	Goal:  Calculate the total interest earned when money is compounded monthly for 1 year

	Notice that to calculate this could require that I use 12 identical statements   *;
DATA	WORK.Illus;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	Interest	+ (StartingAmt + Interest)*InterestRate/12;
	FORMAT	StartingAmt Interest DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;

DATA	WORK.Efficient;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO	i = 1 TO 12;
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
	END;
	FORMAT	StartingAmt Interest DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.Efficient;
	RUN;

*	Point to remember:  What makes a DO loop extremely useful is it's ability to perform the same
		operation repetitively, once for each value of the index variable.
		The value will be more apparent when DO loops are combined with arrays (3.6)!	*;


*	Illustration 15 - Using a DO Loop with an Input Data Set   *; RUN;

*	Goal:  Compare interest earned over 5 years for a range of interest rates   *;
DATA	WORK.Scenarios;
	INFILE	DATALINES;
	INPUT	ScenarioNum
			InterestRate;
	DATALINES;
1 0.03
2 0.04
3 0.05
4 0.06
5 0.07
;

DATA	WORK.RateResults;
	RETAIN	ScenarioNum StartingAmt Years InterestRate;
	SET	WORK.Scenarios;

	Interest	= 0; * Sets interest to 0 at the start of each DATA step iteration *;
	StartingAmt	= 1000;
	Years	= 5;
	DO	i = 1 TO 12*Years; * Note:  The end value can be an expression *;
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
	END;
	DROP	i; * What value would i have if we kept it? *;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.RateResults;
	RUN;


*	Illustration 16 - Example of Using a DO Loop   *; RUN;

*	Recall Section 2.6.2, Illustration 2 in which we used the Single-Trailing @ to create
		multiple observations from a single record.
	Extension:  Suppose that
		1)	We don't know how many subjects there are in a group and it's too long to count
		2)	There are not the same # of subjects in each row
	Using an iterative DO loop would be a great strategy to loop through each subject!
	First, we need to figure out how many subjects there are (use the COUNTW function)   *;
DATA	WORK.Illus;
	INFILE	DATALINES	DELIMITER = ':,';
	INPUT	Treatment	:$21. @;

	SubjCnt = COUNTW(_INFILE_, ':,') - 1; * To count the subjects in each row *;

	DO i = 1 TO SubjCnt;
		INPUT	pt_id	@;
		OUTPUT;
	END;

	DROP	SubjCnt i;
	DATALINES;
Gemcitabine + MUJ018: 892,694,64,70,917,82,695,194,80,469,795,901,471
Gemcitabine + Placebo: 43,1,556,469,268,823,651,390,184,624,42,339,58,480,125,837,498
;

PROC PRINT DATA = WORK.Illus;
	RUN;




*	SECTION 3.5.2 - NESTING DO LOOPS   *; RUN;


*	Illustration 1 - Nesting 2 DO loops   *; RUN;

*	Note:  Each DO statement needs a corresponding END statement   *;
DATA	WORK.Illus;
	DO i = 1 TO 3; * Outer loop executes 3 times *;
		DO j = 1 TO 5; * Inner loop executes 5 times per outer loop (15 times total) *;
			OUTPUT;
		END;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;
*	Note:  Every observation is created within a single iteration of the DATA step *;

*	This is the same as above, but includes PUTLOG statements to help understanding   *;
DATA	WORK.Illus;
	PUTLOG	'** START OF OUTER LOOP **';
	DO i = 1 TO 3; * Outer loop executes 3 times *;
			PUTLOG	'Outer Loop: ' i=;
		PUTLOG		'                ** START OF INNER LOOP **';
		DO j = 1 TO 5; * Inner loop executes 5 times per outer loop (15 times total) *;
			OUTPUT;
			PUTLOG	'                Inner Loop: ' j=;
		END;
		PUTLOG		'                ** END OF INNER LOOP **';
		PUTLOG '.';
	END;
		PUTLOG	'** END OF OUTER LOOP **';
	PUTLOG	'How many times has the DATA step looped?  ' _N_=;
	RUN;


*	Illustration 2 - Nested DO Loops Example   *; RUN;

*	Goal:  Create all months nested within a sequence of years   *;
PROC FORMAT;
	VALUE	MonNm	1	= 'January'
					2	= 'February'
					3	= 'March'
					4	= 'April'
					5	= 'May'
					6	= 'June'
					7	= 'July'
					8	= 'August'
					9	= 'September'
					10	= 'October'
					11	= 'November'
					12	= 'December'	;
	RUN;

DATA	WORK.Illus;
	DO Year = 2017 TO 2020;
		DO	Month = 1 TO 12;
			OUTPUT;
		END;
	END;
	FORMAT	Month MonNm.;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;


*	Illustration 3 - Nesting 3 DO loops Example   *; RUN;

*	Goal:  Create a template for study visits
	Scenario:	1)	The study will be conducted at 4 sites
				2)	The study will enroll 15 subjects per site
				3)	Each subject will have a baseline visit (Month 0) and monthly follow-up visits for 6 months

	Use Alt + [ (or ]) to toggle between DO and END keywords (to check if each "DO" has a matchind "END")!   *;
PROC FORMAT;
	VALUE	SiteCd
				1	= 'University of Colorado'
				2	= 'Baylor Medical Center'
				3	= 'Dana Farber Cancer Institute'
				4	= 'Mayo Clinic';
	RUN;

DATA	WORK.Illus;
	ATTRIB	SiteCd		LABEL = 'Study Site'	FORMAT = SiteCd.
			USubjID		LABEL = 'Subject ID'
			VisitMon	LABEL = 'Visit Month'	;
	DO	SiteCd	=	1 TO 4;
		DO	USubjID	= SiteCd*100 + 1	TO	SiteCd*100 + 15;
			DO	VisitMon	= 0 TO 6;
				OUTPUT;
			END;
		END;
	END;
	RUN;

PROC PRINT DATA = WORK.Illus;
	RUN;




*	SECTION 3.5.3 - ADDITIONAL MATERIAL   *; RUN;

*	DO loops may be executed conditionally where the loop will stop when
		a specified condition is met   *;


*	Illustration 1 - Using the DO UNTIL Statement   *; RUN;

*	SAS executes the loop until the condition specified in the expression is true

	Note:  SAS evaluates the condition at the bottom of the DO loop
			Therefore, SAS will always execute a DO UNTIL loop at least once
			Be careful not to write an expression that never becomes true (you'll have an infinite loop!)

	Goal:  Determine how many months it would take to earn $1,000 in interest   *;
DATA	WORK.Illus;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO UNTIL (Interest >= 1000);
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
		OUTPUT;
	END;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	
*	Note:  There is no longer an index variable created   *;

PROC PRINT DATA = WORK.Illus;
	RUN;

*	Adding a variable to count loops (if that is what you are trying to answer!)	*;
DATA	WORK.Illus;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO UNTIL (Interest >= 1000);
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
		Month	+ 1;
		OUTPUT;
	END;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.Illus NOOBS;
	VAR	Month Interest;
	RUN;


*	Illustration 2 - Using the DO WHILE Statement   *; RUN;

*	SAS executes the loop while the expression is true

	Note:  SAS evaluates the condition at the top of the DO loop
			Therefore, if the expression is initially false, SAS will never execute the DO WHILE loop
			Be careful not to write an expression that always stays true (you'll have an infinite loop!)

	Goal:  Determine how many months it would take to earn $1,000 in interest   *;
DATA	WORK.Illus;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO WHILE (Interest < 1000);
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
		Month	+ 1;
		OUTPUT;
	END;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.Illus NOOBS;
	VAR	Month Interest;
	RUN;


*	Illustration 3 - Combining an Iterative DO Loop with a Conditional Clause   *; RUN;

*	This can help prevent the occurrence of an infinite loop
	Combining with a DO UNTIL clause   *;
DATA	WORK.DOUNTIL_AllObs;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO Month = 1 TO 100	UNTIL (Interest >= 1000);
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
		OUTPUT;
	END;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.DOUNTIL_AllObs NOOBS;
	VAR	Month Interest;
	RUN;

*	Combining with a DO WHILE clause   *;
DATA	WORK.DOWHILE_AllObs;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO Month = 1 TO 100 WHILE (Interest < 1000);
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
		OUTPUT;
	END;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.DOWHILE_AllObs NOOBS;
	VAR	Month Interest;
	RUN;


*	Illustration 4 - Comparing DO UNTIL and DO WHILE results   *; RUN;

*	Only the final observation (i.e. total interest accumulated) will be kept
	Using the DO UNTIL statement   *;
DATA	WORK.DOUNTIL_LastObs;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO Month = 1 TO 100	UNTIL (Interest >= 1000);
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
	END;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.DOUNTIL_LastObs;
	RUN;


*	Using the DO WHILE statement
	NB:  DO WHILE increments the index value, THEN tests the condition at the top of the loop   *;
DATA	WORK.DOWHILE_LastObs;
	StartingAmt		= 1000;
	InterestRate	= 0.12;
	DO Month = 1 TO 100 WHILE (Interest < 1000);
		Interest	+ ((StartingAmt + Interest)*InterestRate/12);
	END;
	FORMAT	StartingAmt Interest	DOLLAR10.2
			InterestRate PERCENT5.;
	RUN;	

PROC PRINT DATA = WORK.DOWHILE_LastObs;
	RUN;


*	Illustration 5 - CONTINUE and LEAVE Statements   *; RUN;

*	The CONTINUE statement stops processing the current DO-loop iteration and resumes
		processing the next iteration (i.e. it doesn't leave the loop)

	The LEAVE statement stops processing the current loop and resumes with the next statement
		in the sequence (i.e. typically the DATA step)

	Creating an example data set below   *;
DATA WORK.Employees;
	INFILE	DATALINES;
	INPUT	Name $
			StartDt :DATE9.
			EndDt	:DATE9.;
	FORMAT	StartDt EndDt WORDDATX.;
	DATALINES;
Ann 16APR2018 .
Bob	01JUL2018 30JUN2019
Cam 23NOV2018 02JAN2019
;

*	Goal:  Determine
			1) How many days each employee has been employed, and
			2) How many work days (non-weekend) they were employed for   *;
DATA WORK.Days;
	SET WORK.Employees;

	* Reset the accumulating variables to 0 for each employee *;
	DaysEmployed = 0;
	WorkDays = 0;

	DO ThisDay = StartDt TO TODAY();

		* Increment the total days, unless the current date is later than
			an employees end date (in which case we want to exit the DO loop!) *;
		IF MISSING(EndDt)=0 AND ThisDay > EndDt THEN LEAVE;
		DaysEmployed+1;

		* Increment the count of work days, unless the current date is a weekend date (values of 1 or 7),
			in which case we want to skip to the next iteration of the DO loop *;
		IF WEEKDAY(ThisDay) IN(1,7) THEN CONTINUE;
		WorkDays+1;

	END;

	DROP ThisDay;
	RUN;

PROC PRINT DATA = WORK.Days;
	RUN;




*	SECTION 3.5.4 - SOLUTIONS   *; RUN;


* ----------------------------- *
|   Comprehension Check 3.5.1   |
* ----------------------------- *
	Task:  Create a data set named 'Subjects' with a variable named 'SubjID'
			The values of 'SubjID' should be as follows:
		Obs	SubjID
		---	------
		1	101
		2	201
		3	301
		4	401
		...	...
		16	1601   *;
DATA WORK.Subjects;
	DO SubjID = 101 to 1601 BY 100;
		OUTPUT;
	END;
	RUN;

PROC PRINT DATA = WORK.Subjects;
	RUN;




;	*';	*";	*/;	QUIT;	RUN;
*	End of Program   *; RUN;

