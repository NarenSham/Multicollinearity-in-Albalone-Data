install.packages("corrplot")
require(corrplot)
rm(list=ls())

df<-read.csv("/Users/narensham/Documents/Data Analysis/Stat Computing/Abalone.data",header=F)
names(df)=c("Sex","Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
            "Shell weight","Rings")



summary(df)

indep<-df[c("Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
            "Shell weight")]
dep<-df[c("Rings")]

cor(indep,dep)

indep<-df[c("Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
            "Shell weight","Rings")]
dep<-df[c("Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
          "Shell weight","Rings")]

corr<-cor(indep,dep)

corrplot(corr,method="number")

attach(df)
model1<-lm(Rings~Diameter+Height+`Whole weight`+`Shucked weight`+`Viscera weight`+`Shell weight`)

summary(model1)
