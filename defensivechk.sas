   
%macro defensivechk(reqparmlst=, reqvardsn=, reqvarlst=);
	
	%local _err i param_name param_value variable_name;
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
	Flag for premature macro termination
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 

	%let _err = N;
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
 1.	Macro parameter checks
	Iterate through parameters
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 

	%do i = 1 %to %sysfunc(countw(&reqparmlst., %str( )));
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
		Sub-select macro name
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 

		%let param_name = %scan(&reqparmlst., &i., %str( ));
		
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
		Sub-select macro value
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 

		%let param_value = &%scan(&reqparmlst., &i., %str( )).;
		
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
		Check whether required parameters are empty
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 

		%if %length(&param_value.) = 0 %then %do;
			%put %str(ERR)%str(OR: &param_name. is a required parameter and should not be NULL);
			%let _err = Y;
		%end;
		
	%end;
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
	2. Check whether required dataset exist 
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 
	
    %if %length(&reqvardsn.) ne 0 %then %do;	
		%if (%sysfunc(exist(&reqvardsn.))) = 0 %then %do;
			%put %str(ERR)%str(OR: Dataset &reqvardsn. is required and should be present);
			%let _err = Y;
		%end;
	%end;
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
	3.	Check if variable exists
		Iterate through variables
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 

	%do i = 1 %to %sysfunc(countw(&reqvarlst., %str( )));
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
		Sub-select variable name
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 
	
		%let variable_name = %scan(&reqvarlst., &i., %str( ));
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
		Check whether required variables are exist in input dataset
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 
		
		%if %varexist(&reqvardsn,&variable_name) = 0 %then %do;
			%put %str(ERR)%str(OR: &variable_name. is a required variable and should be present in input dataset &reqvardsn.);
			%let _err = Y;
		%end;
		
	%end;
	
/*--------------------------------------------------------------------------------------------------------------------------------------------------/     
	Stop macro if one of the parameters/variables broke the requirements
/--------------------------------------------------------------------------------------------------------------------------------------------------*/ 

	%if "&_err." = "Y" %then %abort;

%mend defensivechk;
