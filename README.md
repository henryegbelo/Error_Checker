# Error_Checker
Checking for Data errors in STATA
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
