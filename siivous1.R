# Siivous 30.1.2020 siivous1.R

# Kerätään koodipätkät, joista voi olla hyötyä

## G1_1_data2.Rmd

# Koodilohko dataprop1 - poistettiin kokonaan

# Datan selailua (9.10.2018) - Tätä ei tarvita jatkossa
#
# datatiedoston ominaisuuksia 1
# str(ISSP2012jh1a.data$V5)
# 'haven_labelled' num [1:32969] 5 1 2 2 1 NA 2 4 2 2 ...
# - attr(*, "label")= chr "Q1a Working mom: warm relationship with children as a not working mom"
# - attr(*, "format.spss")= chr "F1.0"
# - attr(*, "labels")= Named num [1:8] 0 1 2 3 4 5 8 9
#  ..- attr(*, "names")= chr [1:8] "NAP: ES" "Strongly agree" "Agree" "Neither agree nor disagree" ...
#
# puuttuvan tiedon tarkempi koodaus
# attr(ISSP2012jh1a.data$V5,'labels')
# jos user_na = TRUE, niin SPSS-tiedoston tarkempi kolmen luoka koodi tulisi mukaan
# attr(ISSP2012jh1.data$V5,'na_values')

# Puuttuvat tiedot
#
# test1 <- is.na(ISSP2012jh1a.data$V5)
# missV5 <- ISSP2012jh1a.data[test1,]
# head(missV5)
# str(missV5)
# hist(missV5$V5)
# summary(missV5$V5)
#
# Tästä näkyvät maakohtaiset substanssimuuttujat (muuttujan nimen alku C_ALPHAN)
# attr(ISSP2012jh1.data,'names')
#
# hist(ISSP2012jh1.data$V5)
# hist(ISSP2012jh1.data$DEGREE)
#
# NELJÄ KOMENTOA DATATIEDOSTOSON TUTKIMISEEN
# typeof(ISSP2012jh1a.data)
# class(ISSP2012jh1a.data)
# storage.mode(ISSP2012jh1a.data)
# attributes(ISSP2012jh1a.data) #kaikki tiedot
# str(ISSP2012jh1a.data$AGE)
# numeerinen, labels 15, 16 jne
#
# summary(ISSP2012jh1a.data$AGE)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
#  15.00   36.00   50.00   49.52   63.00  102.00     134 
#
# tiedoston metadata : muuttujat V1, V2 ja DOI
#
# ISSP2012jh1a.data[1:3,1:3]

# Koodilohko vartable1

# attributes(ISSP2012jh1c.data)
# temp1 <- attr(ISSP2012jh1c.data$V5, 'label') #labelin saa luettua, siis 
# kysymyksen! (30.1.20)
# temp1
# temp1[1]
# str(temp1)
# ISSP2012jh1c.data$V6
# apply(ISSP2012jh1c.data, class) # muuttujat joilla labeleita
# labels(ISSP2012jh1c.data, which = c("V6","V7")) # hämärä
# str(substvars1)

# Koodilohko {r muut1old} - poistettiin kokonaan
# 
# Vähän vanhentunutta puuttuneisuuden (erävastauskato) kuvailua
# 25 maata, yksi kysymys jaettuna kahdeksi taulukoksi siistiä tulostusta varten
# temp <- ISSP2012jh1c.data
# temp$maa <-  as_factor(temp$C_ALPHAN)
# temp$Q1b <- as_factor(temp$V6 )


#summary(temp)
#str(taulu1)
# taulu1 <- temp %>% tableX(V6,maa,type = "count")
# taulu1a <- taulu1[ ,1:13]
# knitr::kable(taulu1a,digits = 2, booktabs = TRUE, 
#             caption = "Kysymyksen Q1b vastaukset maittain")
# taulu1b <- taulu1[ ,14:26]
# knitr::kable(taulu1b,digits = 2, booktabs = TRUE, 
#             caption = "Kysymyksen Q1b vastaukset maittain")


