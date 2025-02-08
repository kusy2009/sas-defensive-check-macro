%macro varexist(ds, var);
    %local dsid rc ;
    /*----------------------------------------------------------------------
    Use SYSFUNC to execute OPEN, VARNUM, and CLOSE functions.
    -----------------------------------------------------------------------*/
    %let dsid = %sysfunc(open(&ds));

    %if (&dsid) %then %do;
        %if %sysfunc(varnum(&dsid,&var)) %then 1;
        %else 0 ;
        %let rc = %sysfunc(close(&dsid));
    %end;
    %else 0;

%mend varexist;
