# Datan peruskäsittelyä 5.3.2018
# library(rlang) - tämä ottaa käyttään tuon namespace  rlanginä
library(rgl)
library(ca)
library(haven)
library(dplyr)
library(knitr)
library(tidyverse)
library(lubridate)
library(rmarkdown)
library(ggplot2)
library(furniture)
library(forcats)
sessionInfo()


summary(FiSeHu2012d2)
str(FiSeHu2012d2)
test1 <- select(FiSeHu2012d2,C_ALPHAN, V6)

test1$V6 <- factor(test1$V6, exclude = NULL)
test1$C_ALPHAN <- factor(test1$C_ALPHAN)  
str(test1)
summary(test1)
# NA näillä kolmella muuttujassa V6 134, havaintoja 3243
# 3243-134 = 3109 /ok zacatin kanssa! Eos vastauksia (8) ei yhtään.
#tutkitaan puuttuvat

#Huom! Kun NA on yksi faktoriarvo, niin sepä ei putoa pois helposti!
test1$V6
levels(test1$V6)
tasot_1<-c(1,2,3,4,5)
# puuttuvat pois - miksi eivät häivy?
test2 <- select(FiSeHu2012d2,C_ALPHAN, V6)
test2 <- filter(test2, !is.na(V6))
test2$V6 <- factor(test2$V6)
test2$maa <- factor(test2$C_ALPHAN)  
str(test2)
summary(test2)


#http://zacat.gesis.org/webview/ voi tarkistaa - tähän kysymykseen vastauksia (pl. puuttuvat) on 3109
#on suodatettu pois kaikki, jossa NA tämän setin kysymyksissä! 

#taulukoita printattuina
#eka - puuttuvat mukana
test1 %>% table1(V6, splitby = ~C_ALPHAN, test = TRUE) #puuttuvat vastaukset mukana
test1 %>% table1(C_ALPHAN, splitby = ~V6, test = TRUE) #puuttuvat eivät mukana

#toka - puuttuvat mukana
test1 %>% tableX(V6,C_ALPHAN)
test1 %>% tableX(V6,C_ALPHAN,type = "row_perc")
test1 %>% tableX(V6,C_ALPHAN,type = "col_perc")
test1 %>% tableX(V6,C_ALPHAN,type = "count", na.rm = TRUE) #HUOM! NA-arvot pysyvät mukana!

#crosstab - puuttuvat mukana
factor(test1$C_ALPHAN) %xt% (test1$V6)

#ei puuttuvia
ots1 <-"Alle kouluikäinen lapsi todennäköisesti kärsii, jos hänen äitinsä käy työssä "

test2$V6 %xt% test2$maa
test2 %>% tableF(V6,splitby = maa) # ei kovin hyvä
test2 %>% tableX(V6,maa,type = "cell_perc")
test2 %>% tableX(V6,maa,type = "count")
test2 %>% table1(maa, splitby = ~V6, test = TRUE, row_wise = TRUE,output = "markdown")
test2 %>% table1(maa, splitby = ~V6, test = TRUE,type="full", row_wise = FALSE,output = "markdown", caption = ots1)

#CA-inputiksi
str(test3)
class(test2)
# mitä ihmettä tämä tekee? test3 <- as.data.frame.matrix(test2)
#test3<-as.data.frame(test2) - ei toimi
#ca(test3) - ei toimi
test2$maa %xt% test2$V6

#CA vaatii df:n, matriisin jne inputiksi, auttaisiko as.data.frame?
#freq_t = table(maa = )

#copypastella taulukko!
read <- read.table("clipboard")
colnames(read) <- c("1", "2", "3", "4", "5")
ca(read)
plot(ca(read), map = "symmetric", mass = c(TRUE,TRUE))
plot(ca(read), map = "rowprincipal", mass = c(TRUE,TRUE))
plot(ca(read), map = "colprincipal", mass = c(TRUE,TRUE))
X11()
read
str(read)
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

