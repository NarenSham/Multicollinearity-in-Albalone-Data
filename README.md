# Multicollinearity-in-Albalone-Data
Anomalies in Data Analysis

---
title: "Albalone Data Set Analysis"
author: "Narendran Shamasundara(shamasnn)"
date: "2/24/2018"
output: html_document
---

```{r, include=FALSE}
require(corrplot)
rm(list=ls())
```

## Albalone 

The data set that I chose for the linear model is about the mollusk data belonging to the genus Haliotis. Albalones are small or really large snails commonly reffered to as sea ears or muttonfish. The data is obtained from the UCI machine learning repository. 

I am building a linear model that could determine the number of rings present on the shell of this mollusk, an indicator of its age. This process is tedious and would require microspcopic manual intervention to count the rings. Here, we will devise a linear model that will determine the number of rings through independant variables such as Length of the mollusk, its height, whole weight, shucked weight, visceral weight and shell weight.


```{r}
df<-read.csv("/Users/narensham/Documents/Data Analysis/Stat Computing/Abalone.data",header=F)
names(df)=c("Sex","Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
            "Shell weight","Rings")
head(df) # A peek at the dataset
```

## Building a model

We consider the number of rings to be our dependant variable and the rest of the weights, heights and diameter to be the independant variable.


```{r}

attach(df)
model1<-lm(Rings~Diameter+Height+`Whole weight`+`Shucked weight`+`Viscera weight`+`Shell weight`)

summary(model1)

```

The model shows high correlation with all the independant variables selected. It is observed that there is a negative correlation of the number of rings with the Viscreal weight and the shucked weight, which means that as the visceral weight decreases, the number of rings and in turn the age of the mollusk increases.

The length, diameter and height of the increase linearly with the number of rings in the albalone, and so does the weight of the same.

#Multicollinearity

We try to determine the correlation of each of the variables with the rings of the albalone.

```{r}
indep<-df[c("Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
            "Shell weight")]
dep<-df[c("Rings")]

cor(indep,dep)
```
It is observed that all variables are correlated and the shell weight show sthe most correlation.

Now let us determine the multicollinearity of the dataset. Multicollinearity is a phenomenon in which one predictor variable in a multiple regression model can be linearly predicted from the others with a substantial degree of accuracy.

```{r}
indep<-df[c("Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
            "Shell weight")]
dep<-df[c("Length","Diameter","Height","Whole weight","Shucked weight","Viscera weight",
          "Shell weight")]

corr<-cor(indep,dep)

corrplot(corr,method="number")

```

It is seen that there is high multicollinearity between the independant variables considered in our model. 
