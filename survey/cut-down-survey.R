# As I did not want to host the survey data on GitHub,
# I have provided the code to download and cut down the survey data here

library(haven)

# URL for the 2022/23 Partcipation Survey data
url <- "https://beta.ukdataservice.ac.uk/Umbraco/Surface/Discover/GetDownload?studyNumber=9126&fileName=9126spss_8A3227D7D6847C3FD25E610A44C6D3FF220F7ED050F44C7E767AFE8235F673F0_V1.zip"
destfile <- "9126spss.zip"
download.file(url, destfile, mode = "wb")

# This assumes that your wd is the parent directory of the survey directory
# If it is not, you will need to change the exdir argument
unzip(destfile, exdir = "survey")

# Load the survey data
# The survey is *very* large, so we only load the columns we need
survey_orig <- read_sav("survey/UKDA-9126-spss/spss/spss25/participation_2022-23_annual_data_open.sav")
survey_data <- survey_orig[c("finalweight","WELLB1","WELLB1_NET","CARTS1_004","CARTS1A_d","emdidc19")]

# Export the survey data
write_sav(survey_data, "survey/ukda-9126-cut-down.sav")