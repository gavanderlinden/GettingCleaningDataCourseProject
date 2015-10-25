# GettingCleaningDataCourseProject
Course project for Coursera Getting and Cleaning Data course

The purpose of this project is to create a tidy data set extracted from the
"Human Activity Recognition Using Smartphones Data Set".

The new data set only contains the mean and standard deviation of the measurements from the original dataset.

## Repository Contents

<table>
<tr><th>File Name</th><th>Description</th></tr>
<tr>
  <td valign=top>README.md</td>
  <td>Documentation explaining the project and how to use files contained in the repository.
  </td>
</tr>
<tr>
  <td valign=top>Codebook.md</td>
  <td>Documentation regarding the original data set and the creation of the tidy data set. 
  </td>
</tr>
<tr>
  <td valign=top>run_analysis.R</td>
  <td>R script to create the tidy data set from the original data.
  </td>
</tr>
<tr>
  <td valign=top>.gitignore</td>
  <td>Gitignore file, instructing git to not add the original data set and generated html files to the repository. 
  </td>
</tr>
<tr>
  <td valign=top>HARUS_Mean_Std_Only.txt</td>
  <td>Created tidy data set file.
  </td>
</tr>
</table>

### prerequisites
1. R version 3.2.2 is installed
2. plyr library (in R execute: install.packages("plyr"))
3. dplyr library (in R execute: install.packages("dplyr"))
4. The original data set from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Unzip folder and put the "UCI HAR Dataset" folder in the same location as the run_analysis.R script.

### Instructions for creating the tidy data set
1. Step 1 - download the raw data from the following link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Step 2 - unzip the raw data in the same folder as the repository
3. Step 3 - run_analysis.R (R -f run_analysis.R)