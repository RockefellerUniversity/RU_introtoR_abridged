params <-
list(isSlides = "no")

## ----include=FALSE------------------------------------------------------------
suppressPackageStartupMessages(require(knitr))
knitr::opts_chunk$set(echo = TRUE, tidy = T)


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides != "yes"){
  cat("# Introduction to R (part 1)

---
"    
  )
  
}



## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Set Up

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Set Up

---
"    
  )
  
}



## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# What is R?

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# What is R?

---
"    
  )
  
}



## ---- echo=F------------------------------------------------------------------
#potential other r plots
#https://stackoverflow.blog/2017/10/31/disliked-programming-languages/
#https://stackoverflow.blog/2017/10/31/disliked-programming-languages/



## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Data Types in R

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Data Types in R

---
"    
  )
  
}



## ----simpleCalculations_introtoR,prompt=T-------------------------------------
3+1

2*2

sqrt(25)-1


## ----usingFunctions_introtoR--------------------------------------------------
min(2, 4, 6)
sum(2, 4, 6)
max(2, 4, 6)


## ----usingFunctionsSQRT_introtoR----------------------------------------------
?sqrt


## ----usingFunctionsArgOrder_introtoR------------------------------------------
min(5, 4, 6)
min(6, 4, 5)


## ----usingFunctionsSetNames_introtoR,eval=F-----------------------------------
## dir()
## dir(full.names=T)


## ----usingFunctionsDefaultOrder_introtoR,eval=F-------------------------------
## dir(full.names=T)
## # Is equivalent to...
## dir(".", NULL, FALSE, T)


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Variables

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Variables

---
"    
  )
  
}



## ----variablesDefine_introtoR-------------------------------------------------
x <- 10


## ----variableHold_introtoR----------------------------------------------------
x


## ----variableShowForAlterInPlace_introtoR-------------------------------------
x


## ----variableAlterInPlace_introtoR--------------------------------------------
x <- 20
x


## ----variableAsValueTheyContain_introtoR--------------------------------------
x


## ----variableAsValueFromFunTheyContain_introtoR-------------------------------
x + sqrt(25)


## ----variableCreateNewVariable_introtoR---------------------------------------
y <- x + sqrt(25)
y


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Vectors

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Vectors

---
"    
  )
  
}



## ----vectorBasic_introtoR-----------------------------------------------------
x
length(x)


## ----vectorCreate_introtoR----------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
length(x)


## ----vectorSeqFromColon_introtoR----------------------------------------------
y <- 6:10
y


## ----vectorIndexing_introtoR--------------------------------------------------
z <- c("a","b","c","d","e","f")
z
z[1]
z[4]


## ----vectorIndexingBy2_introtoR-----------------------------------------------
z[c(1,4)]


## ----vectorIndexingByNeg_introtoR---------------------------------------------
z[-5]


## ----vectorIndexingAndReplace_introtoR----------------------------------------
z
z[5] <- "Hello"
z


## ----vectorIndexingUsingVectors_introtoR--------------------------------------
y
z[y] <- "Hello again"
z


## ----RememberSquareForIndex_introtoR------------------------------------------
x[1]


## ----RememberRoundForFunctions_introtoR---------------------------------------
sqrt(4)


## ----vectorArithmetricOperations_introtoR-------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
y <- x*2
y


## ----vectorArithmetricOperationsMultipleVectors_introtoR----------------------
x+y


## ----vectorRecycle_introtoR---------------------------------------------------
x <- c(1,2,3,4,5,6,7,8,9,10)
x
x+c(1,2)


## ----vectorShorterRecycle_introtoR--------------------------------------------
x+c(1,2,3)


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Factors

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Factors

---
"    
  )
  
}



## ----factorsIntro_introtoR----------------------------------------------------
vectorExample <- c("male","female","female","female")
factorExample <- factor(vectorExample)
factorExample
levels(factorExample)


## ----factorsSummaryFunction_introtoR------------------------------------------
summary(vectorExample)
summary(factorExample)


## ----factorsDisplayOrder_introtoR---------------------------------------------
factorExample <- factor(vectorExample, levels=c("male","female"))
factorExample
summary(factorExample)


## ----factorsNominal_introtoR--------------------------------------------------
factorExample <- factor(vectorExample, levels=c("male","female"))
factorExample[1] < factorExample[2]


## ----factorsOrdinal_introtoR--------------------------------------------------
factorExample <- factor(c("small","big","big","small"),
                        ordered=TRUE,levels=c("small","big"))
factorExample
factorExample[1] < factorExample[2]


## ----factorsOrder_introtoR----------------------------------------------------
factorExample <- factor(c("small","big","big","small"))
factorExample[1] <- c("big")
factorExample

factorExample[1] <- c("huge")
factorExample



## ----factorsAddNew_introtoR---------------------------------------------------
levels(factorExample) <- c("big","small","huge")
factorExample[1] <- c("huge")
factorExample


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Data Frames

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Data Frames

---
"    
  )
  
}



## ----dataframesIntro_introtoR-------------------------------------------------
patientName <- c("patient1","patient2","patient3","patient4")
patientType <- factor(rep(c("male","female"),2))
survivalTime <- c(1,30,2,20)
dfExample <- data.frame(Name=patientName, Type=patientType, Survival_Time=survivalTime)
dfExample


## ----matricesIndexingShow_introtoR--------------------------------------------
dfExample


## ----matricesIndexingExample_introtoR-----------------------------------------
dfExample[2,1]


## ----matricesIndexingExampleByCol_introtoR------------------------------------
dfExample[,2]


## ----matricesIndexingExampleByRow_introtoR------------------------------------
dfExample[3,]


## ----matricesIndexingExampleByMultipleRow_introtoR----------------------------
dfExample[c(2,3),]


## ----dataframesNoReplace_introtoR---------------------------------------------
dfExample[1,3] <- "Forever"
dfExample


## ----dataframesNoReplaceString_introtoR---------------------------------------
dfExample[1,"Type"] <- "other"
dfExample


## ----dataframesAndFactors_introtoR--------------------------------------------
dfExample <- data.frame(Name=patientName,Type=patientType,
                        Survival_Time=survivalTime)

levels(dfExample[,"Type"]) <- c(levels(dfExample[,"Type"]) ,
                                "other")

dfExample[1,"Type"] <- "other"
dfExample



## ----dataframesReplacement_introtoR-------------------------------------------
dfExample
dfExample[dfExample[,"Survival_Time"] > 10,]


## ----dataframesReplacementbyDollar_introtoR-----------------------------------
dfExample <- data.frame(Name=patientName,Type=patientType,Survival_Time=survivalTime)
dfExample$Survival_Time


## ----dataframesNewbyDollar_introtoR-------------------------------------------
dfExample
dfExample$newColumn <- rep("newData",nrow(dfExample))
dfExample


## ----matricesDim_introtoR-----------------------------------------------------
dim(dfExample)
nrow(dfExample)
ncol(dfExample)


## ----matricesCbind_introtoR---------------------------------------------------
x <- 1:4
newDF <- cbind(x,dfExample)
newDF


## ----matricesRbind_introtoR---------------------------------------------------
z <- c(5,"patient5","male",25)
newerDF <- rbind(newDF,z)
newerDF


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Lists

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Lists

---
"    
  )
  
}



## ----listsExample_introtoR----------------------------------------------------
firstElement <- 10
secondElement <- c("a","b","c","d")
thirdElement <- data.frame(colOne=c(1,2,4,5),colTwo=c("One","Two","Three","Four"))


## ----listsCreate_introtoR-----------------------------------------------------
myList <- list(firstElement, secondElement, thirdElement)
myList


## ----listsCreateElements_introtoR---------------------------------------------
myList <- list(firstElement,secondElement,thirdElement)
myList[1]
myList[[1]]


## ----listsCombine_introtoR----------------------------------------------------
myNamedList <- list(First=firstElement,Second=secondElement,
                    Third=thirdElement)
myNamedList <- c(myNamedList,list(fourth=c(4,4)))
myNamedList[c(1,4)]



## ----listsFlatten_introtoR----------------------------------------------------
myNamedList <- list(First=c(1,2,3),Second=c(2,6,7),Third=c(1,4,7))
myNamedList
flatList <- unlist(myNamedList)
flatList[1:7]

