library("oro.dicom")
library(base)
library(knitr)
library(ANTsR)
library(fslr)
library(stringr)

if (!require(devtools)){
  install.packages("devtools")
}
library(devtools)
install.packages("oro.nifti")
#install.packages("oro.dicom")
devtools::install_github("muschellij2/fslr")
devtools::install_github("stnava/ITKR")
devtools::install_github("stnava/ANTsR")
devtools::install_github("muschellij2/extrantsr")
