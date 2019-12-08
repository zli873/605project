# split one file into different locations

rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 1){
 a  = as.character(args[1])
 
} else {
  cat('usage: Rscript split.R <datadirectory>\n', file=stderr())
  stop()
}

ul <- c(1558,1727,1770,1824,1731,1561,1025,1933,
        2005,2192,2246,2247,2249,2250,2251,2316)

df = read.csv(a)
df <- df[,c('location','P1','P2')]
for(i in ul){
  sub_df <- df[df$location == i,]
  write.table(sub_df,file = paste(unlist(strsplit(a,'.csv|_'))[1],'-loc-',i,'.csv',sep = ''),
              row.names=F,quote=F,col.names=FALSE, sep=",")
}


