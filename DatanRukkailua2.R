#DatanRukkailua2.R 28.5.2018
# 
# 1. Interaktio/vuorovaikutusmuuttujat ovat uusia luokitteluja. Miten ne saisi tehtyä
# elegantisti?
# case_when, mutate with group_by(maa, )
#
# 2. Muut muuttjat ja/tai maat, milloin mukaan ja mitä esitellään taulukkomuodossa 
# tai kuvina. Likert, mosaic plot?
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

# 1. Interaktiomuuttujien luonti

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
                                    



# 5. Siistit taulukot ja tulosteet

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
# rmarkdown::pandoc_version() # ‘1.19.2.1’ -> ‘2.2.1’


