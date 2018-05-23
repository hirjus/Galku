# Datan peruskäsittelyä 5.3.2018
# library(rlang) - tämä ottaa käyttöön tuon namespace  rlanginä
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
library(likert)
library(scales) # G_1_2 - kuva
library(reshape2)  # G_1_2 - kuva
library(printr) #19.5.18 taulukoiden ja matriisien tulostukseen
sessionInfo()


summary(FiSeHu2012d2)
str(FiSeHu2012d2)
test1 <- select(FiSeHu2012d2,C_ALPHAN, V6)

test1$V6 <- factor(test1$V6, exclude = NULL)
test1$maa <- factor(test1$C_ALPHAN)  
str(test1)
summary(test1)
# NA näillä kolmella muuttujassa V6 134, havaintoja 3243
# 3243-134 = 3109 /ok zacatin kanssa! Eos vastauksia (8) ei yhtään.
#tutkitaan puuttuvat


#Huom1! Kun NA on yksi faktoriarvo, niin sepä ei putoa pois helposti!
#Huom2 Kun faktoroidaan järjestysasteikon muuttuja ja mukana on puuttuvia tietoja, muuttuja koodautuu
#nominaaliasteikolle. Niin pitääkin, koska yksi arvo on NA. Vai voisiko olla niin, että ordinaaliasteikko ja siiinä
#puuttuvia havaintoja? Ei merkitysta CA:ssa, mutta muuten kyllä. Kts. opk 7.4.2018.
str(test1$V6)
levels(test1$V6)
tasot_1<-c(1,2,3,4,5)
# puuttuvat pois - miksi eivät häivy?
test2 <- select(FiSeHu2012d2,C_ALPHAN, V6)
test2 <- filter(test2, !is.na(V6))
test2$V6 <- factor(test2$V6)
test2$maa <- factor(test2$C_ALPHAN)  
str(test2)
summary(test2)
plot(test1$V6)
plot(test2$V6)
plot(ISSP2012.data$V6)
summary(ISSP2012.data$V6) # maksimi 5, NA 4203
str(ISSP2012.data$V6)
#Class 'labelled'  atomic [1:61754] 2 2 3 2 3 2 3 2 2 2 ...
#..- attr(*, "label")= chr "Q1b Working mom: Preschool child is likely to suffer"
#..- attr(*, "format.spss")= chr "F1.0"
#..- attr(*, "labels")= Named num [1:8] 0 1 2 3 4 5 8 9
#.. ..- attr(*, "names")= chr [1:8] "NAP: ES" "Strongly agree" "Agree" "Neither agree nor disagree" ...

#objektin tiedot
typeof(ISSP2012.data$V6) # double
class(ISSP2012.data$V6) # labelled
storage.mode(ISSP2012.data$V6) # double
length(ISSP2012.data$V6) # 61754
attributes(ISSP2012.data$V6) # label(kysymys), format.spss, class, labels - täällä tieto koodauksesta!

attributes(ISSP2012.data$V6.labels)


select(ISSP2012.data,C_ALPHAN, V6) %>% filter(C_ALPHAN == "ES") %>% count(V6) # eli metatiedoissa kerrotaan, 
#että Espanjalla on oma sarake

#http://zacat.gesis.org/webview/ voi tarkistaa - tähän kysymykseen vastauksia (pl. puuttuvat) on 3109
#on suodatettu pois kaikki, jossa NA tämän setin kysymyksissä! 

#taulukoita printattuina
#eka - puuttuvat mukana
test1 %>% table1(V6, splitby = ~maa, test = TRUE) #puuttuvat vastaukset mukana
test1 %>% table1(maa, splitby = ~V6, test = TRUE) #puuttuvat eivät mukana

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
test2 %>% table1(V6, splitby = ~maa, test = TRUE, type = "full",row_wise = FALSE,output = "markdown")
test2 %>% table1(maa, splitby = ~V6, test = TRUE,type = "full", row_wise = FALSE,output = "markdown", caption = ots1)
#miks ei toimi?
#test2 %>% table1(V6, splitby = ~maa, test = FALSE, type="count", row_wise = TRUE,output = "markdown")

#4.4.2018 siistin taulukon yritystä

#toimii - vaati MiKTexiin booktabs - paketin
test2 %>% table1(maa, splitby = ~V6, test = TRUE,
                 type = "full", row_wise = FALSE,output = "latex", caption = ots1)
test2

test2 %>% 
  table1(maa, splitby = ~V6, test=FALSE, 
                 type = "full", row_wise = FALSE, output = "latex2", caption = ots1)
#saisiko näille siistin muotoilu? tämä on ihan hassu
test2 %>% 
  tableX(V6,maa,type = "cell_perc") %>%
  as.data.frame() %>%
  table1(maa, splitby = ~V6, test=FALSE, 
          row_wise = FALSE, output = "latex2", caption = ots1)
  


test2 %>% tableX(V6,maa,type = "count")

# jotain tapahtuu...
test3 <- as.data.frame(test2 %>% tableX(V6,maa,type = "cell_perc"))
str(test3)
test3


# samoin tässä...
test4 <- as.data.frame(test2 %>% tableX(V6,maa,type = "count"))
str(test4)
#mutta pieleen menee test3 ja test4! df on rakenteeltaan väärä.

#Viides yritys
test5 <- test2$V6 %xt% test2$maa #tulos lista - ei toimi

# 15.5.2018 jatketaan taulukoita
ISSP2012esim1.dat %>% table1(C_ALPHAN, splitby = V6, test=TRUE)
ISSP2012esim1.dat %>% table1(C_ALPHAN, splitby = V6, row_wise = FALSE,test=TRUE)


#CA-inputiksi
str(test2)
class(test2)

test

simpleCA2 <- ca(~V6 + maa,test3) #Tämä toimii! Mutta tulokset vähän outoja - täysin pielessä
X11()
plot(simpleCA2, map = "symmetric", mass = c(TRUE,TRUE))

simpleCA3 <- ca(~V6 + maa,test4) # tämäkin toimii

plot(simpleCA3, map = "symmetric", mass = c(TRUE,TRUE))

#kuudes yritys - test2 on df ja 
#C_ALPHAN         V6      maa      
#Length:3109        1:295   FI:1110  
#Class :character   2:600   HU: 997  
#Mode  :character   3:593   SE:1002  
#                   4:889            
#                   5:732

#toimii - mutta onko rowprincipal-kuvassa järkeä?
simpleCA6 <- ca(~V6 + maa,test2) 

simpleCA6
X11()
plot(simpleCA6, map = "symmetric", mass = c(TRUE,TRUE))
plot(simpleCA6, map = "rowprincipal", mass = c(TRUE,TRUE))
plot(simpleCA6, map = "colprincipal", mass = c(TRUE,TRUE))
# näyttäisi ihan samalta kuin SimpleCA1, rivit ja sarakkeet vain vaihdettu
#copypastella taulukko!
names(simpleCA6)
print(simpleCA6)
(sum(simpleCA6$colmass)) # 1
(sum(simpleCA6$rowmass)) # 1
summary(simpleCA6)

#rakennetaan taulukko

(taulu1 <- (simpleCA6$N))
class(taulu1)
colnames(taulu1) <- c("FI", "HU", "SE")
rownames(taulu1) <- c("1","2","3","4","5")
taulu1
#(taulu1_rs <- rowSums(taulu1))
#taulu1 <- cbind(taulu1_rs[ 2,1:5]) ei toimi!!

# rivillä 65 on jo ratkaisu
taulu2 <- test2 %>% tableX(V6,maa,type = "cell_perc")
str(taulu2)
barplot(table(taulu2), main = "eka")
hist(table(taulu2), main = "toka")
#https://stackoverflow.com/questions/9563368/create-stacked-barplot-where-each-stack-is-scaled-to-sum-to
#ohje ggplot2 vaatii df:n, ja datan long-formaatissa
# eu ihan loistava vielä ole
taulu2_df <- as.data.frame(taulu2)
taulu2_df
ggplot(taulu2_df, aes(x = maa, y=Freq, fill = V6)) # no joo
X11()
ggplot(taulu2_df, aes(x = maa, y=V6, fill = Freq))
library(scales)
#toinen kokeilu - frekvenssitaulu - nyt onnistuu!

library(reshape2)
#taulu1 <- rowSums(taulu1) ei onnistu
taulu1
taulu1_df
taulu1_df <- as.data.frame(taulu1)
str(taulu1_df)
taulu1_df$riviprof <- rowSums(taulu1_df)
#mutate(taulu1_df, avg =rowsum())
taulu1b_df <- melt(cbind(taulu1_df, ind = rownames(taulu1_df)), id.vars = c('ind'))
taulu1b_df
ggplot(taulu1b_df, aes(x = variable, y = value, fill = ind)) +
         geom_bar(position = "fill", stat ="identity") +
         scale_y_continuous(labels = percent_format()) # no joo
X11()



###data leikepöydältä ###
read <- read.table("clipboard")
colnames(read) <- c("1", "2", "3", "4", "5")
SimpleCA1 <- ca(read)

read

plot(SimpleCA1, map = "symmetric", mass = c(TRUE,TRUE))
plot(SimpleCA1, map = "rowprincipal", mass = c(TRUE,TRUE))
plot(SimpleCA1, map = "rowgreen", mass = c(TRUE,TRUE))
plot(SimpleCA1, map = "colprincipal", mass = c(TRUE,TRUE))
plot(SimpleCA1, map = "colgreen", mass = c(TRUE,TRUE))
str(SimpleCA1)
#rowgreen:Rows in principal coordinates and columns in standard
#coordinates times the square root of the mass CA-juttu JSS-lehdessä 2007

plot(SimpleCA1, map = "symmetric", mass = c(TRUE,TRUE), contrib = "absolute")
plot(SimpleCA1, map = "symmetric", mass = c(TRUE,TRUE), contrib = "relative")

#ei toimi, kun suurin mahdollinen on 2
#plot3d(ca(read,nd=3))


X11()
read
str(read)

print(SimpleCA1)
summary(SimpleCA1, scree = TRUE, rows=TRUE, columns=TRUE)

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

#22.5.2018 maa2 - muuttuja
# on faktori, joten pitää tehdä uudelleen!
#  5601     BE-FLA-Belgium/ Flanders
#  5602     BE-WAL-Belgium/ Wallonia
#  5603     BE-BRU-Belgium/ Brussels
# 27601     DE-W-Germany-West
# 27602     DE-E-Germany-East
test6 <- ISSP2012esim1.dat
str(test6)
test6$maa2 <- factor(test6$V3, 
                  levels = c("100","208","246","348","5601","5602","5603","27601","27602"),
                  labels = c("BG","DK","FI","HU","bF","bW","bB","dW","dE"))
head(test6)
test6 %>% tableX(maa,maa2,type = "count")
str(test6$maa2)
# ensimmäinen versio
# maa2
# maa     100 208  246  348 5601 5602 5603 27601 27602 Total
# BE    0   0    0    0   1012 490  511  0     0     2013 
# BG    921 0    0    0   0    0    0    0     0     921  
# DE    0   0    0    0   0    0    0    1167  547   1714 
# DK    0   1388 0    0   0    0    0    0     0     1388 
# FI    0   0    1110 0   0    0    0    0     0     1110 
# HU    0   0    0    997 0    0    0    0     0     997  
# Total 921 1388 1110 997 1012 490  511  1167  547   8143 

#toinen versio
# maa2
# maa     BG  DK   FI   HU  bF   bW  bB  dW   dE  Total
# BE    0   0    0    0   1012 490 511 0    0   2013 
# BG    921 0    0    0   0    0   0   0    0   921  
# DE    0   0    0    0   0    0   0   1167 547 1714 
# DK    0   1388 0    0   0    0   0   0    0   1388 
# FI    0   0    1110 0   0    0   0   0    0   1110 
# HU    0   0    0    997 0    0   0   0    0   997  
# Total 921 1388 1110 997 1012 490 511 1167 547 8143 

str(test6$maa2)
str(test6$maa)
#Ok - toimii 
# ikä ja sukupuoli - interaktio 23.5.2018

#age_cat
#ag


> 

