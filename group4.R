rm(list=ls())

args = (commandArgs(trailingOnly=TRUE))

data<-read.csv(args)
frequency<-rep(0,31)
mag<-seq(5,8,0.1)
for (i in 1:31) {
  frequency[i]<-sum(data$magnitude>mag[i])+0.001
}
input<-data.frame(fre=log(frequency),magnitude=mag)
fit<-lm(fre~magnitude,data=input)
output<-summary(fit)$coef
write.csv(output,paste(args,"out",sep = "."))
