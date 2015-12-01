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

#read in your phenoTable with the CEL files which contains the .CEL samples you are going to need
#The phenoTable file contains: 1st column - sample names with the title "array", plus a second column
#containing the condition i.e case, control for each sample - the name of this column is not important for this script
#you may have more columns in your phenoTable as long as your sample names have the header 'array' the code should work
phenoTable <- read.table('/PATH/TO/PHENOTABLE/phenoTable.csv', sep=',', header=TRUE)

#create a character vector of the sample CEL file names - your phenoTable sample name column must be labelled as 'array'
CELfiles <-as.vector(phenoTable$array)

#in your phenoTable file your sample names do not have .CEL therefore need to add this on for each sample with this step below
CELfiles <- paste(CELfiles, ".CEL", sep="")

#normal readAffy however have added in the argument filenames which then only reads in the files in the CELfiles character 
#vector created in previous steps
dataIn <- ReadAffy(filenames=CELfiles, celfile.path=path)

#you can now carry on with the steps with processing in your microarray samples

#END
