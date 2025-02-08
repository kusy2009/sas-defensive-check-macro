# SAS Defensive Check Macro

This repository contains a SAS macro designed to perform defensive checks on macro parameters, datasets, and variables. It ensures that the necessary items are defined before further data processing, and if any required items are missing or incorrect, it will provide error messages and can abort execution.

## Overview

The **`defensivechk`** macro performs the following checks:
1. **Macro Parameter Checks**: Ensures required parameters are passed and not null.
2. **Dataset Existence Check**: Verifies if the specified dataset exists.
3. **Variable Existence Check**: Checks if the specified variables exist within the dataset.

If any check fails, the macro will abort further execution and display an error message.

### **Dependency**
The `defensivechk` macro uses the `varexist` macro, which is sourced from the [SAS Community](https://www.sas.com/en/community.html). This macro checks whether a specified variable exists in a dataset, and it returns `1` if the variable exists, and `0` if it does not.

## Installation

### Clone the Repository

Start by cloning this repository to your local machine:

git clone https://github.com/kusy2009/sas-defensive-check-macro.git

### Place SAS Macros in Your Working Directory

After cloning, ensure that the following files are in your SAS working directory, or reference them in your SAS program:
- `defensivechk.sas`: The main macro for performing defensive checks.
- `varexist.sas`: The dependency macro from SAS Community (checks variable existence).

## Usage

The `defensivechk` macro checks if required parameters are defined, if the specified dataset exists, and if the specified variables exist within the dataset. The syntax is as follows:

%defensivechk(reqparmlst=, reqvardsn=, reqvarlst=);

#### Parameters:
- **`reqparmlst`**: A space-separated list of required macro parameters that must be defined.
- **`reqvardsn`**: The name of the required dataset.
- **`reqvarlst`**: A space-separated list of required variables that must exist in the dataset.

### Example Usage:

%defensivechk(reqparmlst=param1 param2, reqvardsn=dataset_name, reqvarlst=var1 var2);
This example checks if `param1` and `param2` are passed into the macro, if the dataset `dataset_name` exists, and if the variables `var1` and `var2` are present in the dataset.

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## Notes

- **Error Handling**: The `defensivechk` macro will stop execution and provide an error message if any required parameter or variable is missing.
- **Performance Considerations**: While efficient for smaller datasets, performance may degrade if you are working with large datasets or a large number of variables.
- **Dependency**: The `varexist` macro used by `defensivechk` is sourced from the [SAS Community](https://www.sas.com/en/community.html) and checks whether a variable exists in a specified dataset.

## Directory Structure

sas-defensive-check-macro/
├── defensivechk.sas        # Defensive check macro
├── varexist.sas            # Variable existence check macro (from SAS Community)
├── LICENSE                 # MIT License
├── README.md               # This file

### **How to Contribute or Report Issues**

- **Contributions**: Feel free to fork the repository, make changes, and create a pull request. Provide a description of what changes you made.
- **Issues**: If you encounter a bug or need a new feature, open an issue in the GitHub repository.
