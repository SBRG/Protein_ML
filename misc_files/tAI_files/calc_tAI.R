#!/usr/bin/Rscript

# Pass in directores
args <- commandArgs(trailingOnly=TRUE)

if (length(args)!=2) {
  stop("Two arguments must be supplied (WORKING_DIR and TAI_DIR)")
}

# Set directories
working_dir <- args[1]
tai_dir <- args[2]

# Run tAI according to the README
source(paste(tai_dir,"tAI.R",sep=""))
eco.trna <- scan(paste(working_dir,"bl21.trna",sep=""))
eco.ws <- get.ws(tRNA=eco.trna, sking=1)
eco.m <-
  matrix(scan(paste(working_dir,"prEST_tAI.m",sep="")),
  ncol=61, byrow=T)
eco.m <- eco.m[,-33]
eco.tai <- get.tai(eco.m, eco.ws)
write.csv(eco.tai,file=paste(working_dir,"prEST_tAI.csv",sep=""))
print("tAI calculated and stored in prEST_tAI.csv")
