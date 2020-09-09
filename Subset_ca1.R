#Subset_ca1.R 7.9.20
#
# Data G1_4_Calaaj1.Rmd 
#
# Data
#
# ISSP2012esim2.dat 
# spCAmaaga1    maaga-ca-objekti (täydentävillä maa-pisteillö)
# maagaTab1     taulukko  jossa maaga-rivit ja maat täydentävinä pisteinä
maagaTab1

# Koodilohko subsetCA-1
 X11()

maagaCA2sub1 <- ca(~maaga + Q1b,ISSP2012esim2.dat, subsetrow = 1:24)
plot(maagaCA2sub1, main = "Äiti töissä: ikäluokka ja sukupuoli maittain",
     sub = "symmetrinen kartta - rivit 1-24 (subset ca")

# Ongelma 1: miten saa maarivit kätevästi? Tässä tapauksessa näin
# maagaTab1
# Taulkon viimeisillä riveillä maa-profiilit frekvensseinä
# maaga-rivit ovat samassa järjestyksessä, kuusi naisten ja kuusi miesten
# ikäryhmää
# ISSP2012esim2.dat %>% tableX(maaga, Q1b)
#
# BE   191 451 438 552 381
# BG   118 395 205 190  13
# DE   165 375 198 538 438
# DK    70 238 152 232 696
# FI    47 188 149 423 303
# HU   219 288 225 190  75
#
# BE 1-12, BG 13-24, DE 25-36, DK 37-48, FI 49-60, HU 61-72


#Ongelma 2: subsetrow, ratkeaa kun käytetään merkkijonomuuttujaa (9.9.20)
# maapisteet suprow = 73:78 toimivat
str(maagaTab1)
typeof(maagaTab1)#integer
class(maagaTab1) #matriisi
attributes(maagaTab1)
rownames(maagaTab1)

# Hoitaako ca-paketti automaattisesti täydentävien pisteiden "skaalauksen
# subsetCA:ssa? Sarakepisteiden keskiarvo on origossa, mutta rivien osajoukon
# keskiarvo ei ole ja tämä pitäisi korjata.

maagaCA2sub2 <- ca(~maaga + Q1b,ISSP2012esim2.dat,subsetrow = 25:60)
plot(maagaCA2sub2, main = "Äiti töissä: ikäluokka ja sukupuoli maittain",
     sub = "symmetrinen kartta - rivit 25-60 (subset ca)")

# maapisteet suprow = 73:78 toimivat
spCAmaagasub1 <- ca(maagaTab1[,1:5], suprow = 73:78,subsetrow = 25:60 )
par(cex = 0.5)
plot(spCAmaagasub1, main = "Äiti töissä: ikäluokka ja sukupuoli maittain 2",
     sub = "symmetrinen kartta, maat täydentävinä pisteinä, cex=0.75"
    )

## saako subsetrow - asetuksen kahdessa "pätkässä"? TOIMII!
#osajoukot1 <- c(13:14,61:72)
#spCAmaagasub2 <- ca(maagaTab1[,1:5], suprow = 73:78,subsetrow = osajoukot1)
#par(cex = 0.5)
#plot(spCAmaagasub2, main = "Äiti töissä: ikäluokka ja sukupuoli maittain 2",
#     sub = "symmetrinen kartta, osajoukko-ca, maat täydentävinä pisteinä, cex=0.05"
#       )
# ei voi (ehkä?) suoraan lisätä täydentäviä pisteitä siitä muuttujasta
# jossa aineisto rajataan johonkin osajoukkoon (8.9.20)

# BE 1-12, BG 13-24, DE 25-36, DK 37-48, FI 49-60, HU 61-72
BGHUsubset <- c(13:14,61:72)
BEDEDKFIsubset <- c(1:12, 25:36, 37:48, 49:60)
DEDKFIsubset <- c(25:36, 37:48, 49:60)
BEBGHUsubset <- c(1:12,13:14,61:72)
spCAmaagasub3 <- ca(maagaTab1[,1:5], subsetrow = BGHUsubset)
par(cex = 0.6)
plot(spCAmaagasub3, main = "Äiti töissä (Q1b): ikäluokka ja sukupuoli maittain",
    sub = "symmetrinen kartta, osajoukko-ca, cex=0.06"
    )

spCAmaagasub4 <- ca(maagaTab1[,1:5], subsetrow = BEDEDKFIsubset)
par(cex = 0.7)
plot(spCAmaagasub4,
     arrows = c(FALSE, TRUE),
     main = "Äiti töissä (Q1b): ikäluokka ja sukupuoli maittain",
     sub = "symmetrinen kartta, osajoukko-ca, cex=0.07"
)

spCAmaagasub5 <- ca(maagaTab1[,1:5], subsetrow = DEDKFIsubset)
par(cex = 0.7)
plot(spCAmaagasub5, main = "Äiti töissä (Q1b): ikäluokka ja sukupuoli maittain",
     sub = "symmetrinen kartta, osajoukko-ca, cex=0.07"
)

spCAmaagasub6 <- ca(maagaTab1[,1:5], subsetrow = BEBGHUsubset)
par(cex = 0.7)
plot(spCAmaagasub6, main = "Äiti töissä (Q1b): ikäluokka ja sukupuoli maittain",
     sub = "symmetrinen kartta, osajoukko-ca, cex=0.07"
)

#Tämä ei toimi (8.9.20)

spCAmaagasub7 <- ca(maagaTab1[,1:5], subsetrow = BEBGHUsubset)
par(cex = 0.7)
plot(spCAmaagasub7, map = "rowgreen",
     contrib = c("relative", "relative"),
     mass = c(TRUE,TRUE),
     arrows = c(FALSE, TRUE),
     main = "Äiti töissä (Q1b): ikäluokka ja sukupuoli maittain",
     sub = "rowgreen (relative), osajoukko-ca, cex=0.07"
)

