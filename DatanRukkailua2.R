#DatanRukkailua2.R 28.5.2018
# 
# 1. Interaktio/vuorovaikutusmuuttujat ovat uusia luokitteluja. Miten ne saisi tehtyä
# elegantisti?
# case_when, mutate with group_by(maa, ) tämä tehty!
#
# 2. Muut muuttjat ja/tai maat, milloin mukaan ja mitä esitellään taulukkomuodossa 
# tai kuvina.
#
# 3. Puuttuvat tarkemmalla kolmen arvon koodauksella, esittely, milloin mukaan?
#
# 4. Yksinkertaisen CA:n laajennus (moniulotteiset taulukot, monta taulukkoa samaan
# "supermatriisiin", stacked eli concatenated tables, matched tables ml. ABBA, 
# square tables)
# Mikä sujuva tapa rakennella näitä? Table-tietotyyppi? MG:n Burtin matriisi - kikka?
#
# 5. Siistit taulukot, joissa myös viittaustieto
# Knitr? plot - funktion par ja main-otsikon fontti? stargazer r-paketti. Unwinin kirja.
#
# 6. Likert, mosaic plot?

# 1. Interaktiomuuttujien luonti
#
# Muista tarkistaa, että solufrekvenssit eivät liian pieniä!

test6 <- ISSP2012esim1.dat
head(test6)
# tämä toimii, mutta ei ole kovin tyylikäs

test6 <- mutate(test6, ga = ifelse(((age_cat == "1")&(sp == "m")), "m1",
                                  ifelse(((age_cat == "2")&(sp == "m")), "m2",
                                  ifelse(((age_cat == "3")&(sp == "m")), "m3",
                                  ifelse(((age_cat == "4")&(sp == "m")), "m4",
                                  ifelse(((age_cat == "5")&(sp == "m")), "m5",
                                  ifelse(((age_cat == "6")&(sp == "m")), "m6",
                                  ifelse(((age_cat == "1")&(sp == "f")), "f1",
                                  ifelse(((age_cat == "2")&(sp == "f")), "f2",
                                  ifelse(((age_cat == "3")&(sp == "f")), "f3",
                                  ifelse(((age_cat == "4")&(sp == "f")), "f4",
                                  ifelse(((age_cat == "5")&(sp == "f")), "f5", "f6"))))))))))))
test6%>% tableX(maa,ga,type = "count")

# https://dplyr.tidyverse.org/articles/window-functions.html

#test7 <- ISSP2012esim1.dat
#test7 %>% group_by(maa, age_cat, sp) ei taida onnistua tällä
# case_when
test7 <- mutate(test7, ga2 = case_when((age_cat == "1")&(sp == "m") ~ "m1",
                                       (age_cat == "2")&(sp == "m") ~ "m2",
                                       (age_cat == "3")&(sp == "m") ~ "m3",
                                       (age_cat == "4")&(sp == "m") ~ "m4",
                                       (age_cat == "5")&(sp == "m") ~ "m5",
                                       (age_cat == "6")&(sp == "m") ~ "m6",
                                       (age_cat == "1")&(sp == "f") ~ "f1",
                                       (age_cat == "2")&(sp == "f") ~ "f2",
                                       (age_cat == "3")&(sp == "f") ~ "f3",
                                       (age_cat == "4")&(sp == "f") ~ "f4",
                                       (age_cat == "4")&(sp == "f") ~ "f4",
                                       (age_cat == "5")&(sp == "f") ~ "f5",
                                       (age_cat == "6")&(sp == "f") ~ "f6",
                                       TRUE ~ "missing"
                                  ))
test7 %>% tableX(ga,ga2) # toimii
#str(test7$ga)
str(test7$ga)
# ga on merkkijono, samoin ga2, pitäisikö muuttaa faktoriksi?
str(test7)

#
# ga maakohtaisesti ?
# maa x ga 72 luokkaa
#

#miten saisi nokkelasti luotua vuorovaikutusmuuttujalle merkkijono-arvon (esim BEm1)?

test7 <- mutate(test7, maaga = case_when((age_cat == "1")&(sp == "m") ~ "m1",
                                       (age_cat == "2")&(sp == "m") ~ "m2",
                                       (age_cat == "3")&(sp == "m") ~ "m3",
                                       (age_cat == "4")&(sp == "m") ~ "m4",
                                       (age_cat == "5")&(sp == "m") ~ "m5",
                                       (age_cat == "6")&(sp == "m") ~ "m6",
                                       (age_cat == "1")&(sp == "f") ~ "f1",
                                       (age_cat == "2")&(sp == "f") ~ "f2",
                                       (age_cat == "3")&(sp == "f") ~ "f3",
                                       (age_cat == "4")&(sp == "f") ~ "f4",
                                       (age_cat == "4")&(sp == "f") ~ "f4",
                                       (age_cat == "5")&(sp == "f") ~ "f5",
                                       (age_cat == "6")&(sp == "f") ~ "f6",
                                       TRUE ~ "missing"
                                       
                                    ))


test7 %>% tableX(maa, ga)

test7 <- mutate(test7, maaga = paste(maa, ga, sep = ""))

test7 %>% tableX(maa, maaga) # taitaa toimia?
str(test7$maaga)

# Sama muuttujalle maa2
test7 <- mutate(test7, maa2ga = paste(maa2, ga, sep = ""))
test7 %>% tableX(maa2ga, maa2) # taitaa toimia?



# turha1 <- "A"
# turha2 <- "a"
# (paste(turha1,turha2, sep = ""))

# 2. Muut muuttujat - oma R-skripti, taulukoita yms.


#  3. Puuttuvat tarkemmalla kolmen arvon koodauksella, esittely, milloin mukaan?
# myöhemmin (30.5.2018)

# 4. Yksinkertaisen CA:n laajennus (moniulotteiset taulukot, monta taulukkoa samaan
# "supermatriisiin", stacked eli concatenated tables, matched tables ml. ABBA, 
# square tables)

#MCA_day2.R - skriptistä pätkä - samassa skriptissä myös ABBA-esimerkki
#HY MCA kevät 2017
#
# Burtin matriisin käyttö matriisien pinoamisessa
###########ALKAA#########
#
### All one-way tables (lots of printout...)
### Note that variable H's category 5 already combined with category 4
##apply(women, 2, table)
##
##
#### Create ga, the interaction of gender and age categories
##women$ga <- 6*(women$g-1) + women$a
##
##head(women)
### Burt matrix of all 12 variables
##
##women.Burt <- mjca(women[,c(1:8,13,10,11)], ps="")$Burt
##dim(women.Burt)
## [1] 62 62
##
##colnames(women.Burt)
###  [1] "A1"   "A2"   "A3"   "A4"   "A5"   "B1"   "B2"   "B3"   "B4"   "B5"  
### [11] "C1"   "C2"   "C3"   "C4"   "C5"   "D1"   "D2"   "D3"   "D4"   "D5"  
### [21] "E1"   "E2"   "E3"   "E4"   "E5"   "F1"   "F2"   "F3"   "F4"   "F5"  
### [31] "G1"   "G2"   "G3"   "G4"   "G5"   "H1"   "H2"   "H3"   "H4"   "ga1" 
### [41] "ga2"  "ga3"  "ga4"  "ga5"  "ga6"  "ga7"  "ga8"  "ga9"  "ga10" "ga11"
### [51] "ga12" "m1"   "m2"   "m3"   "m4"   "m5"   "e0"   "e1"   "e2"   "e3"  
### [61] "e4"   "e5"  

## redefine some category names
##colnames(women.Burt)[39:56] <- rownames(women.Burt)[39:56] <- c("H45",
##  "ma1","ma2","ma3","ma4","ma5","ma6","fa1","fa2","fa3","fa4","fa5","fa6",
##  "married","widowed","div","sep","single") 
##
##women.concat <- women.Burt[40:62, 1:39]
##
##women.ca <- ca(women.concat)
##
## par(mfrow = c(1,1), mar=c(4.2,4,1,1), font.lab=2, cex.axis=0.8)
## plot(women.ca, mass=c(T,T))
##
## windows(height = 4, width =6)
##
##par()
##
###########################################LOPPU#######

# 5. Siistit taulukot ja tulosteet

# 5.1 stargazer

star1 <- print(SimpleCA1)
str(star1)

star2 <- summary(SimpleCA1)
str(star2)
#oletuksena LaTexia, 
stargazer(star2$scree)
stargazer(star2$rows)
stargazer(star2$columns)
# tämäpä onkin isohko asia. Bookdown taitaa olla se paras ratkaisu. Kirjoitustyö html-tulostuksella, 
# ja sitten vasta pdf-formatointiin
# rmarkdown::pandoc_version() # ‘1.19.2.1’ -> ‘2.2.1’ (29.5.2018)
# R-versio 3.5.0 (vaikuttaako uusi Pandoc?) suosittelee asentamaan tinytex - paketin (29.5.2018)

# 5.2 knittr::kable TÄMÄ PERUSJUTTU BOOKDOWN - julkaisussa! (7.8.2018)

# 5.3 kableExtra (?) - ei oteta käyttöön tässä vaiheessa (7.8.2018)


# 5.4 xtable


# 5.5 furniture (tuottaa myös LaTex-taulukoita)







