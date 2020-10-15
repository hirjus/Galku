# MCA1.R 12.10.20
# data ISSP2012jh1.dat

names(ISSP2012jh1d.dat)
str(ISSP2012jh1d.dat)
str(ISSP2012jh1d.dat$edum)
str(ISSP2012jh1d.dat$Q1am)

levels(ISSP2012jh1d.dat$Q1am)
levels(ISSP2012jh1d.dat$edum)


#[1] "V1"       "V2"       "DOI"      "V3"       "V4"       "C_ALPHAN" "V5"       "V6"       "V7"       "V8"       "V9"       "V10"     
#[13] "V11"      "V12"      "V13"      "SEX"      "AGE"      "DEGREE"   "MAINSTAT" "TOPBOT"   "HHCHILDR" "MARITAL"  "URBRURAL" "maa"     
#[25] "maa3"     "sp1"      "sp"       "ika"      "Q1a1"     "Q1b1"     "Q1c1"     "Q1d1"     "Q1e1"     "Q2a1"     "Q2b1"     "Q3a1"    
#[37] "Q3b1"     "edu1"     "msta1"    "sosta1"   "nchild1"  "lifsta1"  "urbru1"   "Q1a"      "Q1b"      "Q1c"      "Q1d"      "Q1e"     
#[49] "Q2a"      "Q2b"      "Q3a"      "Q3b"      "edu"      "msta"     "sosta"    "nchild"   "lifsta"   "urbru"    "Q1am"     "Q1bm"    
#[61] "Q1cm"     "Q1dm"     "Q1em"     "Q2am"     "Q2bm"     "Q3am"     "Q3bm"     "edum"     "mstam"    "sostam"   "nchildm"  "lifstam" 
#[73] "urbrum"

# Analyysin muuttujat ovat "Q1am"     "Q1bm"    
#[61] "Q1cm"     "Q1dm"     "Q1em"     "Q2am"     "Q2bm"

# Sarakkee###t 
# ISSP2012jh1d.dat[5,59] 
# ISSP2012jh1d.dat [5, 65]

# substCols <- c(59:65)
# substCols
# MCAtest1 <- mjca(ISSP2012jh.data[ ,59:65]) ei toimi alkuunkaan

# Paljonko listwisw delete poistaa havaintoja? Koko datassa noin 30%.

#Substanssimuuttujat (7)

missingVars1 <- c("Q1a", "Q1b", "Q1c","Q1d","Q1e", "Q2a", "Q2b")
missingTest1 <- select(ISSP2012jh1d.dat, all_of(missingVars1))
dim(missingTest1) #32823
sum(!complete.cases(missingTest1)) #4775
# 4553/32823 = 0.1387137

# taustamuuttujat mukaan - ei puuttuvia muuttujissa maa, ika ja sp

missingVars2 <- c("Q1a", "Q1b", "Q1c","Q1d","Q1e", "Q2a", "Q2b",
                  "edu", "sosta", "urbru" )
missingTest2 <- select(ISSP2012jh1d.dat, all_of(missingVars2))
dim(missingTest2) #32823
sum(!complete.cases(missingTest2)) # 6101
# 6101/32823 = 0.1858758

#sostam TOPBOT, puuttuvat mukana
#urbrum URBRURAL, puuttuvat mukana

isodatVars3 <- c("Q1am","Q1bm", "Q1cm", "Q1dm","Q1em","Q2am","Q2bm",
                 "edum",  "sostam", "urbrum", "maa", "ika", "sp")

MCAtestdata121020.dat <- ISSP2012jh1d.dat %>% select(all_of(isodatVars3))
names(MCAtestdata121020.dat)

glimpse(MCAtestdata121020.dat)
str(MCAtestdata121020.dat$edu)

# Labelit järkeviksi - vai vasta MCA-objektissa ? (13.10.20)

MCAtestdata121020.dat <- MCAtestdata121020.dat %>%
        mutate(a1 = Q1am,
           b1 = Q1bm, 
           c1 = Q1cm,
           d1 = Q1dm,
           e1 = Q1em,
           a2 = Q2am,
           b2 = Q2bm)
glimpse((MCAtestdata121020.dat))

levels(MCAtestdata121020.dat$sostam)
str(MCAtestdata121020.dat$sostam)


levels(MCAtestdata121020.dat$urbrum)
# [1] "A big city",[2]"The suburbs or outskirts of a big city",
#[3]"A town or a small city", [4] "A country village",   
# [5]"A farm or home in the country", "missing" 


# KOKO MCA-DATA (15.10.20) - muunnos ei toimi

MCAtestdata121020.dat <- MCAtestdata121020.dat %>%
mutate(E = fct_recode(edum,
        "1" = "No formal education",
        "2" = "Primary school (elementary school)",
        "3" = "Lower secondary (secondary completed does not allow entry to university: obligatory school)",
        "4" = "Upper secondary (programs that allows entry to university",
        "5" = "Post secondary, non-tertiary (other upper secondary programs toward labour market or technical formation)",
        "6" = "Lower level tertiary, first stage (also technical schools at a tertiary level)",
        "7" = "Upper level tertiary (Master, Dr.)",
        "P" = "missing"),
       S = fct_recode(sostam,
         "1" = "Lowest, Bottom, 01",
         "2" = "02",
         "3" = "03",
         "4" = "04",
         "5" = "05",
         "6" = "06",
         "7" = "07",
         "8" = "08",
         "9" = "09",
         "10"= "Highest, Top, 10",
         "P" = "missing"),
       U = fct_recode(urbrum,
        "1" = "A big city",
        "2" = "The suburbs or outskirts of a big city",
        "3" = "A town or a small city",
        "4" = "A country village",
        "5" = "A farm or home in the country", 
        "P" = "missing")
        )
names(MCAtestdata121020.dat)
dim(MCAtestdata121020.dat)

MCAtestdata121020.dat$edum %>% fct_count()
MCAtestdata121020.dat$E %>% fct_count()
MCAtestdata121020.dat %>%  tableX(edum, E)
MCAtestdata121020.dat %>%  tableX(maa, E)

levels(MCAtestdata121020.dat$E)

str(MCAtestdata121020.dat$E)

levels(MCAtestdata121020.dat$edum)
str(MCAtestdata121020.dat$E)
str(MCAtestdata121020.dat)
glimpse(MCAtestdata121020.dat)
MCAvars1 <- c("a1", "b1", "c1", "d1", "e1","a2", "b2", "E","S","U", "maa")
MCAtest2data.dat <- select(MCAtestdata121020.dat,all_of(MCAvars1) )
glimpse(MCAtest2data.dat)

MCAtestdata121020.dat[,1:7]


MCAtest1 <- mjca(MCAtest2data.dat[,1:7], ps="")
str(MCAtest1)
MCAtest1$levelnames
par(cex = 0.6)
plot(MCAtest1, 
     main = "Seitsemän kysymystä - symmetrinen kuva 1",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P")
X11()
summary(MCAtest1)


# toimii 13.10.20 - ja nyt toimii supcol!

# Täydentävä sarake koulutustaso E
MCAtest3a <- mjca(MCAtest2data.dat[,1:8], ps="", supcol = 8)
par(cex = 0.6)
plot(MCAtest2, 
     main = "Seitsemän kysymystä, lisämuuttuja E - symmetrinen kuva 1",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P")

#  Täydentävät sarakkeet koulutustaso ja maa


MCAtest3b <- mjca(MCAtest2data.dat[,1:9], ps="", supcol = 8:9)
par(cex = 0.6)
plot(MCAtest3b, 
     main = "Seitsemän kysymystä, lisämuuttuja E - symmetrinen kuva 1",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P")
summary(MCAtest3b)

x11()
#kaikki taustamuuttuta
dim(MCAtest2data.dat)
MCAtest3c <- mjca(MCAtest2data.dat[,1:11], ps="", supcol = 8:11)
par(cex = 0.5)
plot(MCAtest3c, what = c("all", "all"),
     main = "Seitsemän kysymystä, lisämuuttujat E, S, U, maa",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P")
summary(MCAtest3b)


# ei toimi - taitaa vaatia peräkkäiset täydentävät sarakkeet ? 13.10.20

#MCAtest3c <- mjca(MCAtest2data.dat[,1:9], ps="", supcol = 51:75,
#                  subsetcat = (1:75)[-c(43:50)])
# summary(MCAtest3c)

#Pelkät maapisteet karkealla tavalla 13.10.20
isodatVars3b <- c("a1","b1", "c1", "d1","e1","a2","b2", "maa")
MCAtest3temp.dat <- select(MCAtest2data.dat, all_of(isodatVars3b))
glimpse((MCAtest3temp.dat))

MCAtest3c <- mjca(MCAtest3temp.dat[,1:8], ps="", supcol = 8)
summary(MCAtest3c)
par(cex = 0.6)
plot(MCAtest3c, 
     main = "Seitsemän kysymystä, lisämuuttuja maa",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P")

# Vain maapisteet
par(cex = 0.6)
plot(MCAtest3c, what= c("passive", "passive"),
     main = "Seitsemän kysymystä, lisämuuttuja maa")
     #sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P"

plot(MCAtest3b, what = c("passive","passive"),
     main = "Lisämuuttujat E ja maa - 7 kysymyksen kartta",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P"
     )

#MIKÄ TÄSSÄ ON VIKANA? 13.10.20 - colsup toimii, supcol ei
# ja viitattava Burt/indikaattorimatriisin sarakkeisiin. Yllä supcol toimii,
# colsup ei taida tehdä yhtään mitään?


## VANHEMPAA KOODIA VÄHÄN EPÄSIISTILLÄ DATALLA###
# Toimii ! 13.10.20 colsup on Burtin/indikaattorimatriisin sarakkeiden määrittely
# mutta mikä ihme on ca-manuaalin mjca-optio supcol? Ei toimi, colsup toimii?
# NO JOTENKIN TOIMII, MUTTA EI OLE PASSIIVISIA PISTEITÄ! 
# summary(MCAtest2a)
# MCAtest2a <- mjca(MCAtestdata121020.dat[, 10:17], ps = "", colsup = (1:50)[c(1:8)])
# plot(MCAtest2a,
#     main = "Kysymykset Q1a-Q2b ja koulutustaso E ",
#     sub = "muuttujat Q1a -> a1..., E täydentävä sarake"
#     )
#summary(MCAtest2a)
     


# osajoukko ilma P-arvoja subsetcat=(1:42)[-c(6,12,18,24,30,36,42)]
MCAtest3 <- mjca(MCAtestdata121020.dat[,11:17], ps = "", subsetcat=(1:42)[-c(6,12,18,24,30,36,42)] )
plot(MCAtest3,
     main = "Seitsemän kysymystä ilman puuttuvia tietoja (subset) - symmetrinen kuva 1",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P")
summary(MCAtest3)

# EI TOIMI
# osajoukko ilma P-arvoja subsetcat=(1:42)[-c(6,12,18,24,30,36,42)] - täydentävä sarake?
levels(MCAtestdata121020.dat$E)
MCAtest3b <- mjca(MCAtestdata121020.dat[,10:17], ps = "",  
                  colsup = (1:50)[c(1:8)], 
                  subsetcat=(1:50)[-c(8,14,20,26,32,38,44,50)] )
X11()
# Käännetään kuva x- ja y-akselin ympäri - EI TOIMI (13.10.20)
MCAtest3b$rowpcoord[,1:2] <- MCAtest3b$rowpcoord[,1:2]*(-1)
#MCAtest3b$rowpcoord
MCAtest3b$colpcoord[,1:2] <- MCAtest3b$colpcoord[,1:2]*(-1)
plot(MCAtest3b)
summary(MCAtest3b)
str(MCAtest3b)
colnames(MCAtest3b$Burt)
MCAtestdata121020.dat[,10:17]


