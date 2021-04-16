--
--  Clean up the Residential Real Estate Database
--

set termout on
set feedback on
prompt Cleaning up Residential Real Estate Database.  Please wait ...
set termout off
set feedback off


drop table Branch		cascade constraint;
drop table Staff 		cascade constraint;
drop table Payroll    		cascade constraint;
drop table Property   		cascade constraint;
drop table Property_Features  	cascade constraint;
drop table Inspection    	cascade constraint;
drop table Advertise	   	cascade constraint;
drop table Client   		cascade constraint;
drop table Buyer  		cascade constraint;
drop table Renter   		cascade constraint;