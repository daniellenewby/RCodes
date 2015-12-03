####27Nov14 Extracting files from GEO

rm(list=ls())

library("GEOquery")

path ="/Users/Danielle/Desktop/Samples"
setwd(path)

#extract CEL files from GEO (supplimentary files)

gse_number <- "GSE17190"

files <- getGEOSuppFiles(gse_number)

#places the supplimentary file with raw CEL files into a folder in the directory

#need to unzip to obtain the raw data
untar( paste( gse_number , paste( gse_number , "RAW.tar" , sep="_") , sep="/" ), exdir=gse_number)
cels <- list.files( gse_number , pattern = "[gz]")
sapply( paste( gse_number , cels, sep="/") , gunzip )

#check the cell files are all there
cels

#you can also download data. type "array express" into google > type in GEO number > download data

