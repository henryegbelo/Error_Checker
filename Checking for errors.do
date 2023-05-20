
/********************************************************************************/
//clear
* Version: v2.1

/********************************************************************************/
// Set the working directory
cd "C:\Users\Henry\OneDrive\Documents\CBT SCALE_UP\ROUND 4\1ST BATCH"

/********************************************************************************/
// Load the dataset
cd "C:\Users\Henry\OneDrive\Documents\CBT SCALE_UP\ROUND 4\1ST BATCH"
use "CRS-PVHH_3rd_Cleaning.dta", clear
set more off

/********************************************************************************/
// Close open logs
capture: log close

/********************************************************************************/
// Start a new log file
log using FINAL_checks, text replace

/********************************************************************************/
// Update variables

// Check for inconsistency in 'relationship' variable and update
capture: count if relationship == "other"
capture: replace relationship = "11" if relationship == "other"

// Check for inconsistency in 'maritalstatus' variable and update
capture: count if maritalstatus == "other"
capture: replace maritalstatus = "6" if maritalstatus == "other"

// Check for inconsistency in 'grade' variable and update
capture: count if grade == "other"
capture: replace grade = "19" if grade == "other"

// Check for inconsistency in 'b5labour' variable and update
capture: count if b5labour == "other"
capture: replace b5labour = "14" if b5labour == "other"

// Check for inconsistency in 'educationalqualification' variable and update
capture: count if educationalqualification == "other"
capture: replace educationalqualification = "13" if educationalqualification == "other"

// Update other variables as needed

/********************************************************************************/
// Format dataset

// Convert variables to appropriate types
destring agey, replace
destring maritalstatus, replace
destring relationship, replace
destring grade, replace
// ... continue destringing and converting other variables as needed

/********************************************************************************/
// Error checks

// Check for inconsistency in 'sex' variable
tab sex, missing

// Check for members without sex/gender specified
list hhmnsrrno m_name sex if sex == .

// Check for inconsistency in 'relationship' variable
tab relationship, missing

// Check for members without relationship specified
list hhmnsrrno relationship if relationship == .

// Check for inconsistency in 'maritalstatus' variable
tab maritalstatus, missing

// Check for members without marital status specified
list hhmnsrrno maritalstatus if maritalstatus == .

// Check for inconsistency in 'grade' variable
tab grade, missing

// Check for members without grade specified
list hhmnsrrno grade if grade == .

// Check for inconsistency in 'b5labour' variable
tab b5labour, missing

// Check for members without b5labour specified
list hhmnsrrno b5labour if b5labour == ""

// Check for inconsistency in 'educationalqualification' variable
tab educationalqualification, missing

// Check for members without educational qualification specified
list hhmnsrrno educationalqualification if educationalqualification == .

/********************************************************************************/
// Generate additional variables

// Calculate the average age
egen avg_age = mean(agey)

// Generate additional variables as needed

/********************************************************************************/
// Save the dataset with the updated variables
save "CRS-PVHH_Updated2.dta", replace

/********************************************************************************/
// Generate summary statistics

// Generate summary statistics for numerical variables
summarize agey
summarize grade

// Generate summary statistics for categorical variables
tabulate maritalstatus
tabulate relationship
tabulate b5labour

/********************************************************************************/
// End of script

/*
This script performs data cleaning and analysis tasks in Stata. Let's go through each section:

1. **Set the working directory:**
   - Sets the working directory to the specified path.

2. **Load the dataset:**
   - Loads the dataset from the specified Stata file.
   - Sets the option "more off" to disable additional output prompts.

3. **Close open logs:**
   - Closes any existing log files.

4. **Start a new log file:**
   - Starts a new log file named "FINAL_checks.txt", replacing any existing log file.

5. **Update variables:**
   - Checks for inconsistencies in specific variables and updates them accordingly.
   - For example, if the "relationship" variable contains "other", it is replaced with "11".

6. **Format dataset:**
   - Converts variables to their appropriate types using the "destring" command.
   - Additional variables may be destringed and converted as needed.

7. **Error checks:**
   - Performs various error checks to identify inconsistencies or missing values in specific variables.
   - Lists observations with missing or inconsistent values for the respective variables.

8. **Generate additional variables:**
   - Calculates additional variables based on the existing data.
   - For example, the average age is calculated using the "egen" command and stored in the "avg_age" variable.

9. **Save the dataset with the updated variables:**
   - Saves the dataset with the updated variables to a new Stata file named "CRS-PVHH_Updated2.dta", replacing any existing file.

10. **Generate summary statistics:**
    - Generates summary statistics for numerical variables using the "summarize" command.
    - Generates frequency tables for categorical variables using the "tabulate" command.

11. **End of script:**
    - Marks the end of the script.