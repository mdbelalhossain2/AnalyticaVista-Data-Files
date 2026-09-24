*******************************************************************************
* AnalyticaVista
* Complete Beginner's Guide to Stata 2026 | Learn Stata in 1 Hour
* Reconstructed Companion Do-File
*
* Dataset: NHANES II (Stata example dataset)
* Video: Complete Beginner's Guide to Stata 2026
*
* Reconstructed from the published video's transcript and organized so it can
* run from a fresh Stata session. The demonstration-only "drop obese" command
* shown during the video is omitted because obese does not exist initially.
*******************************************************************************

clear all
set more off

* PART 1: INTRODUCTION TO STATA (00:00)
display 2 + 2

* PART 2: UNDERSTANDING THE STATA INTERFACE (02:37)
* Demonstration of Command, Results, Variables, History, Data Editor,
* and Do-file Editor. No additional analysis command required.

* PART 3: IMPORTING, SAVING & EXPORTING DATA (08:48)
* Excel, CSV, and Stata files were demonstrated through point-and-click menus.
* Local file paths are not included because they are computer-specific.

* PART 4: UNDERSTANDING THE DATASET (15:35)
webuse nhanes2, clear
describe
codebook age
codebook, compact
summarize
summarize age
summarize age, detail
summarize bmi, detail

* PART 5: EXPLORING VARIABLES (21:36)
tabulate sex
tabulate diabetes

* PART 6: DATA CLEANING BASICS (24:26)
misstable summarize
tabulate race
duplicates report

* PART 7: CREATING & MANAGING VARIABLES (28:07)
generate obese = bmi >= 30
label variable obese "Obesity status"
tabulate obese
label define obese_lbl 0 "Not obese" 1 "Obese"
label values obese obese_lbl
tabulate obese
tabulate age
recode age (20/39=1) (40/59=2) (60/79=3), generate(agecat)
tabulate agecat

* PART 8: DESCRIPTIVE STATISTICS (36:03)
summarize age bmi bpsystol
tabulate sex diabetes, row
tabstat bmi, by(sex)

* PART 9: GRAPHS & DATA VISUALIZATION (40:54)
histogram bmi
graph bar bmi, over(sex)
scatter bmi age

* PART 10: BASIC STATISTICAL TESTS (45:15)
tabulate diabetes sex, chi2
ttest bpsystol, by(sex)
correlate bpsystol age
regress bpsystol age

* PART 11: DO-FILES & REPRODUCIBLE RESEARCH (52:33)
* The video demonstrates selecting History commands, sending them to the
* Do-file Editor, saving/reopening the file, executing selections, and comments.

*******************************************************************************
* END
*******************************************************************************
