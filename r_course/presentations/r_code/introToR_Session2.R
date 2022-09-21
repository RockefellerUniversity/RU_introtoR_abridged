params <-
list(isSlides = "no")

## ----setup, include=FALSE-----------------------------------------------------
suppressPackageStartupMessages(require(knitr))
knitr::opts_chunk$set(echo = TRUE, tidy = T)


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides != "yes"){
  cat("# Introduction to R (part 2)

---
"    
  )
  
}



## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Reading and Writing Data

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Reading and Writing Data

---
"    
  )
  
}



## ---- echo=F------------------------------------------------------------------
minRep <- rbind(cbind(matrix(rnorm(12,4),ncol=3,byrow = T),matrix(c(rnorm(9,4),rnorm(3,8)),ncol=3,byrow = T)),
cbind(matrix(rnorm(12,10),ncol=3,byrow = T),matrix(c(rnorm(6,3),rnorm(6,10)),ncol=3,byrow = T)))
colnames(minRep) <- paste0(c("Sample_"),
                      1:5,".",sort(rep(c("hi","low"),3)))
minRepdf <- data.frame(Gene_Name=paste("Gene",letters[1:8],sep="_"),minRep)
#minRepdf$Gene_Name <- paste("Gene",letters[1:8],sep="_")
#write.table(minRepdf,file="readThisTable.csv",sep=",",row.names=F)
kable(minRepdf[,1:4], format='html')



## ---- eval =F-----------------------------------------------------------------
## getwd()
## dir()
## setwd("~/Downloads/RockefellerUniversity-Intro_To_R/r_course")


## ----echo=T-------------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T)
Table[1:4,1:3]


## ----echo=T-------------------------------------------------------------------
Table <- read.table("data/readThisTable.csv",sep=",",header=T,row.names=1)
Table[1:4,1:3]


## ----echo=T-------------------------------------------------------------------
URL <- "http://rockefelleruniversity.github.io/readThisTable.csv"
Table <- read.table(URL,sep=",",header=T)
Table[1:2,1:3]


## ----echo=T-------------------------------------------------------------------
write.table(Table, file="data/writeThisTable.csv", sep=",")


## ----echo=T-------------------------------------------------------------------
write.table(Table, file="data/writeThisTable.csv", sep=",", row.names =F, col.names=T)


## -----------------------------------------------------------------------------
head(Table)


## -----------------------------------------------------------------------------
tail(Table)
head(Table, 3)


## ----echo=T,eval=FALSE--------------------------------------------------------
## install.packages("rio")


## ----echo=T,eval=TRUE---------------------------------------------------------
library("rio")


## ----echo=T,eval=TRUE---------------------------------------------------------
Table <- import("data/readThisTable.csv")
Table[1:2,]


## ----echo=T,eval=TRUE---------------------------------------------------------
Table <- import("data/readThisXLS.xls", 
                which=2)
Table <- import("data/readThisXLS.xls", 
                which="Metadata")
Table[1:2,]


## ----echo=T,eval=F------------------------------------------------------------
## ExpressionScores <- Table$ExpressionScores
## export(ExpressionScores, file = "data/writeThisXLSX.xlsx")
## 


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Ordering, selecting and merging

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Ordering, selecting and merging

---
"    
  )
  
}


## -----------------------------------------------------------------------------
my_df <- read.table("data/categoriesAndExpression.txt",sep="\t",header=T)
head(my_df)


## -----------------------------------------------------------------------------
order(my_df[,4])



## -----------------------------------------------------------------------------
my_df_ordered <- my_df[order(my_df[,4]),]

head(my_df_ordered)


## -----------------------------------------------------------------------------
my_df_ordered <- my_df[order(my_df[,4], decreasing = T),]

head(my_df_ordered)


## -----------------------------------------------------------------------------
my_df_ordered$Expression > 70



## ----vectorLogicalFromOperators_introtoR--------------------------------------

idx <- my_df_ordered$Expression > 70
my_df_ordered[idx,]



## -----------------------------------------------------------------------------
my_df_ordered[my_df_ordered$Expression > 60 & my_df_ordered$pathway == "TGFb",]


## ----vectorInFuncion_introtoR-------------------------------------------------
my_favorite_genes <- c("Gene1","Gene10","Gene15")
logical_index <- my_df$geneName %in% my_favorite_genes
logical_index



## -----------------------------------------------------------------------------
my_df[logical_index,]


## ---- echo=F, eval=F----------------------------------------------------------
## df_out <- data.frame("Gene"=my_df[,1], "Length"=sample(200:2000,100))
## 
## write.table(df_out,  "data/gene_lengths.txt",sep="\t",col.names=T, row.names=F)


## ----dataframesMergeData1_introtoR--------------------------------------------
my_df2 <- read.table("data/gene_lengths.txt",sep="\t",header=T)

nrow(my_df2)

head(my_df2)



## ----dataframesMergeData2_introtoR--------------------------------------------
nrow(my_df)


## -----------------------------------------------------------------------------
merge_df <- merge(my_df, my_df2, by.x="geneName","Gene", all=FALSE)
merge_df


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Conditions and Loops

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html> 

---
"    
  )
}else{
  cat("# Conditions and Loops

---
"    
  )
  
}


## -----------------------------------------------------------------------------
x <- 1:10
x[x < 4]


## ----message=T----------------------------------------------------------------
x <- 10
y <- 4
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}


## ----message=T----------------------------------------------------------------
y <- 20
if(x > y){
  message("The value of x is ",x," which is greater than ", y)
}



## ----message=T----------------------------------------------------------------
x <- 3
if(x < 5){
  message(x, " is less than to 5")
   }else{
     message(x," is greater than or equal to 5")
}


## ----message=T----------------------------------------------------------------
x <- 10
if(x < 5){
  message(x, " is less than 5")
   }else{
     message(x," is greater than or equal to 5")
}



## ---- message=TRUE------------------------------------------------------------
x <- 5
if(x > 5){
  message(x," is greater than 5")
  }else if(x == 5){
    message(x," is 5")
  }else{
    message(x, " is less than 5")
  }


## -----------------------------------------------------------------------------
x <- 1:10
x


## ---- message=TRUE------------------------------------------------------------
ifelse(x <= 3,"lessOrEqual","more") 


## -----------------------------------------------------------------------------
ifelse(x == 3,"same",
       ifelse(x < 3,"less","more")
      ) 


## ---- message=TRUE------------------------------------------------------------
x <- 1:5
for(i in x){
  message(i," ", appendLF = F)
}


## ---- message=TRUE------------------------------------------------------------
x <- toupper(letters[1:5])
for(i in x){
  message(i," ", appendLF = F)
}


## ----message=T----------------------------------------------------------------
geneName <- c("Ikzf1","Myc","Igll1")
expression <- c(10.4,4.3,6.5)
1:length(geneName)
for(i in 1:length(geneName)){
  message(geneName[i]," has an RPKM of ",expression[i])
}


## ----echo=T,eval=F------------------------------------------------------------
## x <- 1:13
## 
## for(i in 1:13){
##   if(i > 10){
##     message("Number ",i," is greater than 10")
##   }else if(i == 10){
##     message("Number ",i," is  10")
##   }else{
##     message("Number ",i," is less than 10")
##   }
## }


## ----message=T,echo=F---------------------------------------------------------
x <- 1:13

for(i in 1:13){
  if(i > 10){
    message("Number ",i," is greater than 10")
  }else if(i == 10){
    message("Number ",i," is  10") 
  }else{
    message("Number ",i," is less than  10") 
  }
}


## -----------------------------------------------------------------------------
exampleVector <- c(1,2,3,4,5)
exampleList <- list(1,2,3,4,5)
sapply(exampleVector, mean, na.rm=T)
sapply(exampleList, mean, na.rm=T)


## ----tidy=FALSE---------------------------------------------------------------
exampleList <- list(row1=1:5, 
                    row2=6:10, 
                    row3=11:15)
exampleList


## -----------------------------------------------------------------------------
lapply(exampleList, quantile)


## -----------------------------------------------------------------------------
sapply(exampleList, quantile)


## ----tidy=FALSE---------------------------------------------------------------
exampleList <- list(df=data.frame(sample=paste0("patient",1:2), data=c(1,12)),
                    vec=c(1,3,4,5))
sapply(exampleList, summary)


## ---- results='asis',include=TRUE,echo=FALSE----------------------------------
if(params$isSlides == "yes"){
  cat("class: inverse, center, middle

# Plotting

<html><div style='float:left'></div><hr color='#EB811B' size=1px width=720px></html>

---
"
  )
}else{
  cat("# Plotting

---
"
  )

}


## -----------------------------------------------------------------------------
plot(merge_df[,c(4,5)])



## ---- eval=F------------------------------------------------------------------
## plot(merge_df[,3])


## ---- echo=F------------------------------------------------------------------
try(plot(merge_df[,3]))


## ---- fig.width=8,fig.height=4.5,dpi=300,out.width="900px",height="900px"-----
merge_df[,3] <- factor(merge_df[,3])
plot(merge_df[,3])


## -----------------------------------------------------------------------------
boxplot(Expression ~ pathway, merge_df)



## ---- eval=F------------------------------------------------------------------
## library(ggplot2)
## 
## ggplot(merge_df, aes(x=pathway, y=Expression, fill=pathway))+
##   geom_violin()+
##   geom_jitter(width=0.1)+
##   theme_linedraw()+
##   ggtitle("Gene Expression in Glycolyis and TGFb pathways")


## ---- echo=F------------------------------------------------------------------
library(ggplot2)

ggplot(merge_df, aes(x=pathway, y=Expression, fill=pathway))+
  geom_violin()+
  geom_jitter(width=0.1)+
  theme_linedraw()+
  ggtitle("Gene Expression in Glycolyis and TGFb pathways")

