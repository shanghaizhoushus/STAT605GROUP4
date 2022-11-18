setwd("C:/Users/Qizhou Huang/Downloads")
nameList = list.files("earthquake")
dataList = list()
len = length(nameList)
setwd("C:/Users/Qizhou Huang/Downloads/earthquake")
for (i in 1:len){
  dataList[[i]] = read.csv(nameList[i])
}
relation1 = data.frame(magn = numeric(1100), bigger = numeric(1100), year = numeric(1100))

for (j in 1:22){
  for (i in 1:50){
    relation1$magn[50 * (j - 1) + i] = 4.8 + 0.1 * i
    relation1$bigger[50 * (j - 1) + i] = sum(as.numeric(dataList[[j]]$magnitude > relation1$magn[50 * (j - 1) + i]))
    relation1$year[50 * (j - 1) + i] = j
  }
}
relation1$logbigger = log(relation1$bigger + 1)
relation1 = relation1[relation1$logbigger > 0, ]
plot(relation1$magn, relation1$logbigger, pch = 16)
model = lm(logbigger ~ magn, data = relation1)
abline(model, col = "red",lwd = 2)
