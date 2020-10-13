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

isodatVars3 <- c("Q1am","Q1bm", "Q1cm", "Q1dm","Q1em","Q2am","Q2bm", "edum", "maa")
MCAtestdata121020.dat <- ISSP2012jh1d.dat %>% select(all_of(isodatVars3))

glimpse(MCAtestdata121020.dat)
str(MCAtestdata121020.dat$edu)
MCAtestdata121020.dat$edum %>% fct_count()
MCAtestdata121020.dat$E %>% fct_count()
MCAtestdata121020.dat %>%  tableX(edum, E)

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


MCAtestdata121020.dat <- MCAtestdata121020.dat %>%
mutate(E = fct_recode(edum,
        "1" = "No formal education",
        "2" = "Primary school (elementary school)",
        "3" = "Lower secondary (secondary completed does not allow entry to university: obligatory school)",
        "4" = "Upper secondary (programs that allows entry to university",
        "5" = "Post secondary, non-tertiary (other upper secondary programs toward labour market or technical formation)",
        "6" = "Lower level tertiary, first stage (also technical schools at a tertiary level)",
        "7" = "Upper level tertiary (Master, Dr.)",
        "P" = "missing"
        ))
levels(MCAtestdata121020.dat$E)
str(MCAtestdata121020.dat$E)

levels(MCAtestdata121020.dat$edum)
str(MCAtestdata121020.dat$E)
str(MCAtestdata121020.dat)
glimpse(MCAtestdata121020.dat)

MCAtest1 <- mjca(MCAtestdata121020.dat[,11:17], ps="")
str(MCAtest1)
MCAtest1$levelnames
MCAtes1$levelnames
plot(MCAtest1, 
     main = "Seitsemän kysymystä - symmetrinen kuva 1",
     sub = "Muuttujien nimet: Q1a = a1,...,Q2a = a2, vastaukset S,s,?,e,E,P")
X11()
summary(MCAtest1)

MCAtestdata121020.dat[, 10:17]

#MIKÄ TÄSSÄ ON VIKANA? 13.10.20 - colsup toimii, supcol ei
# ja viitattava Burt/indikaattorimatriisin sarakkeisiin


# Toimii ! 13.10.20 colsup on Burtin/indikaattorimatriisin sarakkeiden määrittely
# mutta mikä ihme on ca-manuaalin mjca-optio supcol? Ei toimi, colsup toimii?

MCAtest2a <- mjca(MCAtestdata121020.dat[, 10:17], ps = "", colsup = (1:50)[c(1:8)])
plot(MCAtest2a,
     main = "Kysymykset Q1a-Q2b ja koulutustaso E ",
     sub = "muuttujat Q1a -> a1..., E täydentävä sarake"
     )
     
# Vain täydentävä sarake E - aika hullu kuva, kaikki rivipisteet!
plot(MCAtest2a, what = c("all","passive"),
     main = "Koulutustaso E ",
     sub = "E täydentävä sarake"
        )
# Vain täydentävä sarake E - miksiköhän ei toimi? (13.10.20)
plot(MCAtest2a, what = c("none","passive"),
     main = "Koulutustaso E ",
     sub = "E täydentävä sarake"
        )

X11()
# Ei toimi 2
MCAtest2a <- mjca(MCAtestdata121020.dat[, 10:17], ps = "", supcol = 10)

# Ei toimi 3
MCAtest2a <- mjca(MCAtestdata121020.dat[, 10:17], ps = "", supcol = 10:10)

# Ei toimi 4
# MCAtest2a <- mjca(MCAtestdata121020.dat[, 10:17], ps = "", supcol = (1:50)[-c(9:50)])


plot(MCAtest2a)
summary(MCAtest2a)

# Toimii, mutta ei saa E(ducation) - saraketta täydentäväksi?

MCAtest2b <- mjca(MCAtestdata121020.dat[, 10:17], ps = "")
plot(MCAtest2b)
summary(MCAtest2b)
# täydentävä rivi
dim(MCAtestdata121020.dat)

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


