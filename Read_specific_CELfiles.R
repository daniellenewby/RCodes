#-------------------------------------------------------------------------------------------
#Reading in a subset .CEL files
#-------------------------------------------------------------------------------------------
#This code lets you read in a subset of .CEL files from a larger group
rm(list=ls()) #clear the session

library(affy)
library(class)
library(limma)

#set path to where your .CEL files are stored
#do not have '/' at the end of this path otherwise the code will not work
path = '/Users/All Data'

#read in your phenoData with the CEL files you are going to need
#This contains 1st column - sample names with the title "array", plus a second column (in my example) containing the condition i.e case, control etc the name of this column is not important
phenoTable <- read.table('/PATH/TO/PHENODATA/phenoData.csv', sep=',', header=TRUE)

#create a character vector of the sample CEL file names - your first column must be labelled as 'array'
CELfiles <-as.vector(phenoTable$array)

#most sample names do not have .CEL therefore need to add this in with this step
CELfiles <- paste(CELfiles, ".CEL", sep="")

#normal readAffy however have added in the argument filenames which then only reads in the files in the CELfiles character vector created in previous steps
dataIn <- ReadAffy(filenames=CELfiles, celfile.path=path)

#you can now carry on with the steps with processing in your microarray samples

#END