# Data_iso1.R 12.10.2018
#
# Kootaan G1_1_data2.Rmd - tiedostosta laajemma datana koodilohkot
#
# Aja paketit-R !
ISSP2012.data <- read_spss("data/ZA5900_v4-0-0.sav") #luetaan alkuperäinen data R- dataksi (df).

#str(ISSP2012.data)

incl_countries25 <- c(36, 40, 56,100, 124, 191, 203, 208, 246, 250, 276, 348, 352, 
                      372, 428, 440, 528, 578, 616, 620, 643, 703, 705, 752, 756)

#str(ISSP2012.data)
#str(ISSP2012.data) #61754 obs. of  420 variables - kaikki

# 25 MAATA

ISSP2012jh1a.data <- filter(ISSP2012.data, V4 %in% incl_countries25)

# MUUTTUJAT

#   1. METADATA

metavars1 <- c("V1", "V2", "DOI")

#   2. MAA - maakoodit ja maan kahden merkin tunnus

countryvars1 <- c("V3","V4","C_ALPHAN")

#   3. SUBSTANSSIMUUTTUJAT - Attitudes towards family and gender roles (9)
#
# Yhdeksän kysymystä (lyhennetyt versiot, englanniksi), vastausvaihtoehdot
#
# 1 = täysin samaa mieltä, 2 = samaa mieltä, 3 = ei samaa eikä eri mieltä, 
# 4 = eri mieltä, 5 = täysin eri mieltä
# 
# Q1a Working mother can have warm relation with child
# Q1b Pre-school child suffers through working mother
# Q1c Family life suffers through working mother
# Q1d Women’s preference: home and children
# Q1e Being housewife is satisfying
#
# Q2a Both should contribute to household income
# Q2b Men’s job is earn money, women’s job household
#
# Q3a Should women work: Child under school age 
# Q3b Should women work: Youngest kid at school
#
#
# Kysymysten Q3a ja Q3b  Muut vastaustvaihtoehdot ovat 1= kokopäivätyö, 2 = osa-aikatyö ja 
# 3 = pysyä kotona. Eos-vastaus ei ole sama kuin "en samaa enkä eri mieltä" (ns. neutraali vaihtoehto), ja se pitäisi erotella
# muista puuttuvan tiedon koodeista. Tässä kaikki kolme SPSS- tiedoston vaihtoehtoa ovat puuttuvia tietoja (NA)

substvars1 <- c("V5", "V6","V7","V8","V9","V10","V11","V12","V13")

# DEMOGRAFISET JA MUUT TAUSTAMUUTTUJAT (8)
#
# AGE, SEX
#
# DEGREE - Highest completed degree of education: Categories for international comparison. 
# Slightly re-arranged subset of ISCED-97
#
# 0 No formal education
# 1 Primary school (elementary school)
# 2 Lower secondary (secondary completed does not allow entry to university: obligatory school)
# 3 Upper secondary (programs that allow entry to university or programs that allow to entry other ISCED level 3 programs - designed to
# prepare students for direct entry into the labour market)
# 4 Post secondary, non-tertiary (other upper secondary programs toward labour market or technical formation)
# 5 Lower level tertiary, first stage (also technical schools at a tertiary level)
# 6 Upper level tertiary (Master, Dr.)
# 9 No answer, CH: don't know
# Yhdistelyt?
#
# MAINSTAT - main status: Which of the following best describes your current situation?
#
# 1 In paid work
# 2 Unemployed and looking for a job, HR: incl never had a job
# 3 In education
# 4 Apprentice or trainee
# 5 Permanently sick or disabled
# 6 Retired
# 7 Domestic work
# 8 In compulsory military service or community service
# 9 Other
# 99 No answer
# Armeijassa tai yhdyskuntapalvelussa muutamia, muutamissa maissa.Kategoriassa 9 
# on hieman väkeä. Yhdistetään 8 ja 9. Huom! Esim Puolassa ei yhtään eläkeläistä
# eikä kategoriaa 9, Saksassa ei ketään kategoriassa 9.
#
# TOPBOT - Top-Bottom self-placement (10 pt scale)
#
# "In our society, there are groups which tend to be towards the top and groups 
# which tend to be towards the bottom. Below is a scale that runs
# from the top to the bottom. Where would you put yourself on this scale?"
# Eri maissa hieman erilaisia kysymyksiä. 
#
# HHCHILDR - How many children in household: children between [school age] and
# 17 years of age
#
# 0 No children
# 1 One child
# 2 2 children
# 21 21 children
# 96 NAP (Code 0 in HOMPOP)
# 97 Refused
# 99 No answer
# koodataan dummymuuttujaksi lapsia (1) - ei lapsia (0) ?
#
# MARITAL - Legal partnership status 
#
# What is your current legal marital status?
# The aim of this variable is to measure the current 'legal' marital status '. 
# PARTLIV - muuttujassa on 'de facto' - tilanteen tieto parisuhteesta
#
# 1 Married
# 2 Civil partnership
# 3 Separated from spouse/ civil partner (still legally married/ still legally 
#   in a civil partnership)
# 4 Divorced from spouse/ legally separated from civil partner
# 5 Widowed/ civil partner died
# 6 Never married/ never in a civil partnership, single
# 7 Refused
# 8 Don't know
# 9 No answer
#
# URBRURAL - Place of living: urban - rural
#
# 1 A big city
# 2 The suburbs or outskirts of a big city
# 3 A town or a small city
# 4 A country village
# 5 A farm or home in the country
# 7 Other answer
# 9 No answer
# 1 ja 2 vaihtelevat aika paljon maittain, parempi laskea yhteen. Unkarista puuttuu 
# jostain syystä kokonaan vaihtoehto 5.  Vaihotehdon 7 on valinnut vain 4 vastaajaa Ranskasta.
# Yhdistetään 1 ja 2 = city, 3 = town, rural= 4, 5, 7
#

bgvars1 <- c( "SEX","AGE","DEGREE", "MAINSTAT", "TOPBOT", "HHCHILDR", "MARITAL", "URBRURAL")

#Valitaan muuttujat

jhvars1 <- c(metavars1,countryvars1, substvars1,bgvars1)

#jhvars1
ISSP2012jh1b.data <- select(ISSP2012jh1a.data, jhvars1) 
str(ISSP2012jh1b.data) #32969 obs. of  23 variables

# test1 <- is.na(ISSP2012jh1b.data)
# head(test1) TRUE/FALSE - matriisi
# str(test1)
# test1 <- mutate_all(test1,count(.))

head(test1)


# R for DS
# ei ollenkaan toimi! (13.10.18)
#ISSP2012jh1b.data %>%
#group_by(C_ALPHAN) %>%
#    summarize(missing = count(is.na()) %>%
#    ungroup() # if you use group_by, also use ungroup() to save heartache later
#substvars1
#bgvars1

# havainnot joissa puuttuvia tietoja
test1_df <- filter(ISSP2012jh1b.data, ((is.na(V5) | is.na(V6) | is.na(V7) 
                                      | is.na(V8) | is.na(V9) | is.na(V10)
                                      | is.na(V11) | is.na(V12) | is.na (V13)
                                      | is.na(SEX) | is.na(AGE) 
                                      | is.na(DEGREE) | is.na(MAINSTAT)
                                      | is.na(TOPBOT) | is.na(HHCHILDR)
                                      | is.na(MARITAL) | is.na(URBRURAL))))
test1_df 
# A tibble: 7,443 x 23 eli 22,5 % havainnoista kun substvars1 puuttuvat
# A tibble: 9,601 x 23 kun poistetaan puuttuvat myös bgvars1 29,1% !
# 9601/32969
# Tästä pitäisi saada taulukko aikaiseksi

test1_df$V5
tail(test1_df)


# ei toimi 22.10.2018
test1_df %>% group_by(C_ALPHAN) %>%
           summarize_all(funs(sum(is.na(.))) %>%
ungroup()
# test2 <- summary(test1_df, rm.na = "F")           
# str(test2)            
# head(test2)
test1_df %>%
    select(everything()) %>%
    summarise_all(funs(sum(is.na(.))))


#
# https://sebastiansauer.github.io/sum-isna/
#
# 1. sapply - not typestable
# sapply(test1_df, function(x) sum(is.na(x)))

# toimii alkuperäisellä datalla
sapply(ISSP2012jh1b.data, function(x) sum(is.na(x)))



# 2. PURRR map
map(ISSP2012jh1b.data, ~sum(is.na(.)))

# 3. dplyr

ISSP2012jh1b.data %>%
    select(everything()) %>% # muuttujien (sarakkeiden) valinta
    summarise_all(funs((sum(is.na(.)))))

# 4. Riveittäin - montako puuttuvaa tietoa havainnoittain (apply)

temp1 <- apply(ISSP2012jh1b.data, MARGIN = 1, function(x) sum(is.na(x)))
head(temp1)
hist(temp1)
str(temp1)
summarise(temp1)

# 5. Riveittäin - montako puuttuvaa tietoa havainnoittain (dplyr)
# erittäin hidas!

ISSP2012jh1b.data %>%
    rowwise %>%
    summarise(NA_per_row = sum(is.na(.)))

# MUUTTUJAT FAKTOREIKSI
#
# HUOM! Onko puuttuvia tietoja (NA) mukana vai ei! Vaikuttaa faktorointiin.
#
#Faktoreiksi substanssi- ja taustamuuttujat (paitsi AGE)
str(ISSP2012jh1b.data$SEX)
#Uusi datatiedosto
ISSP2012jh1c.data <- ISSP2012jh1b.data
# sp (sukupuoli) m = 1, f = 2
sp_labels <- c("m","f")
# S = täysin samaa mieltä, s = samaa mieltä, ? = ei samaa eikä eri, e = eri mieltä, E = täysin eri mieltä
vastaus_labels <- c("S","s","?","e","E")
vastQ2_labels <- c("W","w","H")

ISSP2012jh1c.data$maa <- as_factor(ISSP2012jh1c.data$C_ALPHAN)
ISSP2012jh1c.data$Q1a <- as_factor(ISSP2012jh1c.data$V5, labels = vastaus_labels) #labels ainakin näihin
ISSP2012jh1c.data$Q1b <- as_factor(ISSP2012jh1c.data$V6, labels = vastaus_labels)
ISSP2012jh1c.data$Q1c <- as_factor(ISSP2012jh1c.data$V7, labels = vastaus_labels)
ISSP2012jh1c.data$Q1d <- as_factor(ISSP2012jh1c.data$V8, labels = vastaus_labels)
ISSP2012jh1c.data$Q1e <- as_factor(ISSP2012jh1c.data$V9, labels = vastaus_labels)
ISSP2012jh1c.data$Q2a <- as_factor(ISSP2012jh1c.data$V10, labels = vastaus_labels)
ISSP2012jh1c.data$Q2b <- as_factor(ISSP2012jh1c.data$V11, labels = vastaus_labels)
ISSP2012jh1c.data$Q3a <- as_factor(ISSP2012jh1c.data$V12, labels = vastQ2_labels)
ISSP2012jh1c.data$Q3b <- as_factor(ISSP2012jh1c.data$V13, labels = vastQ2_labels)
ISSP2012jh1c.data$sp <- as_factor(ISSP2012jh1c.data$SEX, sp_labels) # tähän levels?, labels
ISSP2012jh1c.data$ika <- ISSP2012jh1c.data$AGE # faktoriksi, saadaan NA mukaan. Käytetään luokiteltuna.
ISSP2012jh1c.data$edu <- as_factor(ISSP2012jh1c.data$DEGREE)
ISSP2012jh1c.data$mstat<- as_factor(ISSP2012jh1c.data$MAINSTAT) 
ISSP2012jh1c.data$class <- as_factor(ISSP2012jh1c.data$TOPBOT) 
ISSP2012jh1c.data$nchild<- ISSP2012jh1c.data$HHCHILDR
ISSP2012jh1c.data$lstat <- as_factor(ISSP2012jh1c.data$MARITAL)  
ISSP2012jh1c.data$urb<- as_factor(ISSP2012jh1c.data$URBRURAL)
