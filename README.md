Neurology Clinic Database
=======================================================================
I present you Neurology Clinic Database in MySQL, which was created after studies about problems and situations that can occur in this kind of clinic. Relations between tables are intentional and allow to:  
- checking clinic workers  
- checking clinic patients  
- adding appointments with examination results  
- adding prescription and no prescription medicines with quantity and doses  
- checking patient's medical history  
- adding oppinions of other doctors  
- ICD-10-CM Codes usage, which are International Statistical Classification of 
Diseases and Related Health Problems  

To avoid problems with adding incomplete data I've created procedures for predicted situations.

DDL file contains code that creates tables and keys  
DML file contains code and data for few tables e.g. profession, country of birth  
Procedures file contains porcedures to data adding  
Examples\_of\_procedures\_usage file contains examples with adding data  
VIEWS file contains code that creates views consisting of data from several tables accordig to the situation  
Clinic\_Database\_Diagram shows relations between tables  


Warning!
------------------------------------------------------------------------------------------------------------------------
All names, surnames, dates and addresses are fictious!

Author
------------------------------------------------------------------------------------------------------------------------
- Jaroslaw Juszczak

Licence
------------------------------------------------------------------------------------------------------------------------
This project is licensed under the MIT Licence.
