# Datan peruskäsittelyä 5.3.2018
library(dbplyr)
library(knitr)
library(tidyverse)
library(forcats)
library(haven)
library(lubridate)
library(rmarkdown)
library(ggplot2)
library(furniture)
library(ca)
library(rgl)

summary(FiSeHu2012d2)
str(FiSeHu2012d2)
test1 <- select(FiSeHu2012d2,C_ALPHAN, V6)
test1$V6 <- factor(test1$V6)  
test1$C_ALPHAN <- factor(test1$C_ALPHAN)  
str(test1)
summary(test1)

#taulukoita printattuina
#eka
test1 %>% table1(V6, splitby = ~C_ALPHAN, test = TRUE)
test1 %>% table1(C_ALPHAN, splitby = ~V6, test = TRUE)

#toka
test1 %>% tableX(V6,C_ALPHAN)
test1 %>% tableX(V6,C_ALPHAN,type = "row_perc")
test1 %>% tableX(V6,C_ALPHAN,type = "col_perc")
test1 %>% tableX(V6,C_ALPHAN,type = "count")
#kolmas
test2 <- factor(test1$C_ALPHAN) %xt% (test1$V6)
test3 <- as.data.frame.matrix(test1)

#CA vaatii df:n, matriisin jne inputiksi
#freq_t = table(maa = )

#copypastella taulukko!
read <- read.table("clipboard")
ca(read)
plot(ca(read), mass = c(TRUE,TRUE))
X11()
read

#MG ...day1.r
# row profiles
read.pro <- read / rowSums(read) 
read.pro
# average profile
(read.mean <- colSums(read) / sum(read))

# dividing by square root of average to induce chi-square
read.norm <- sweep(read.pro, 2, sqrt(read.mean), "/")

# add the points to the 3D scatterplot
texts3d(read.norm[,1], read.norm[,2], read.norm[,3], text=rownames(read), col="blue", font=2)

