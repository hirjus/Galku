# CAcalc_1.R - laskentoa ca:n tulostiedoilla 9.4.20
# MG2017 r-koodin käytön kertaamista
# OLETUS: G1_2_johdesim.Rmd ja kaksi edeltävää Rmd-tiedostoa ajettu
# Johdattelevan esimerkin (kuusi maata, Q1b) tulokset: simpleCA1

# Jatketaan (A) ca-tulosobjektin ja (B) grafiikan testailuja 11.6.20. Nyt ajetaan
# kaikki viisi ensimmäistä Rmd-tiedostoa.

# 28.5.20 Miten pisteiden yhdistäminen janoilla kartalla. Ratkaisu segments() (8.6.20).

# 4.7.20 Grafiikka ja taulukot kannattaa tehdä Rmd-versiolla? Tässä ca:n 
# numeeristen tulosten pyörittelyä.

str(simpleCA1)
# List of 16
# $ sv        : num [1:4] 0.3696 0.1646 0.1003 0.0774
# $ nd        : logi NA
# $ rownames  : chr [1:6] "BE" "BG" "DE" "DK" ...
# $ rowmass   : num [1:6] 0.247 0.113 0.21 0.17 0.136 ...
# $ rowdist   : num [1:6] 0.158 0.631 0.175 0.634 0.348 ...
# $ rowinertia: num [1:6] 0.00617 0.04503 0.00645 0.06853 0.01648 ...
# $ rowcoord  : num [1:6, 1:4] 0.252 1.585 -0.255 -1.584 -0.58 ...
# ..- attr(*, "dimnames")=List of 2
# .. ..$ : chr [1:6] "BE" "BG" "DE" "DK" ...
# .. ..$ : chr [1:4] "Dim1" "Dim2" "Dim3" "Dim4"
# $ rowsup    : logi(0) 
# $ colnames  : chr [1:5] "S" "s" "?" "e" ...
# $ colmass   : num [1:5] 0.0995 0.2376 0.1679 0.261 0.2341
# $ coldist   : num [1:5] 0.525 0.325 0.308 0.272 0.627
# $ colinertia: num [1:5] 0.0274 0.0251 0.0159 0.0193 0.0921
# $ colcoord  : num [1:5, 1:4] 1.1472 0.7513 0.7005 -0.0761 -1.6678 ...
# ..- attr(*, "dimnames")=List of 2
# .. ..$ : chr [1:5] "S" "s" "?" "e" ...
# .. ..$ : chr [1:4] "Dim1" "Dim2" "Dim3" "Dim4"
# $ colsup    : logi(0) 
# $ N         : int [1:6, 1:5] 191 118 165 70 47 219 451 395 375 238 ...
# $ call      : language ca.matrix(obj = tab)
# - attr(*, "class")= chr "ca"
str(simpleCA1$sv)
class(simpleCA1$sv)
simpleCA1$rowcoord

# caconv() 12.8.20 - konversioita ca/mca käyttämien datatyyppien välillä
# rpm "response pattern matrix
# Burt ei muunnu tyyppeihin ind tai rpm

str(simpleCA1$N)
simpleCA1$N
caconv(simpleCA1$N, from = c("freq"), to = c("Burt") )
# Miten tämä syntyy?
koe1 <- caconv(simpleCA1$N, from = c("freq"), to = c("ind") )
str(koe1)
colSums(koe1)
#V1.1 V1.2 V1.3 V1.4 V1.5 V1.6 V2.1 V2.2 V2.3 V2.4 V2.5 
#2013  921 1714 1388 1110  997  810 1935 1367 2125 1906 
# sarakkeina maat V1 ja vastaukset V2
#
# Kysymyksen Q1b vastaukset maittain
#    S	s	?	e	E	Total
# BE	191	451	438	552	381	2013
# BG	118	395	205	190	13	921
# DE	165	375	198	538	438	1714
# DK	70	238	152	232	696	1388
# FI	47	188	149	423	303	1110
# HU	219	288	225	190	75	997
# Total	810	1935 367 2125 1906 8143


#cacoord() 12.8.20
cacoordtest1 <- cacoord(simpleCA1, type = c("principal"),dim = c(1,2))
str(cacoordtest1)
cacoordtest1$rows
cacoordtest1$columns

#standardikoordinaattien summa ? (3.8.20)

simpleCA1$rowcoord[1,] %>% sum() #yli dimensioiden (n=4)
simpleCA1$rowcoord[,1] %>% sum() #yli rivien
simpleCA1$rowmass %>% sum() # 1
simpleCA1$N
simpleCA1$colcoord 
simpleCA1$sv
summary(simpleCA1)

# Yhdistä kaavaliitteeseen? (29.5.20)


str(simpleCA1$rowcoord)
typeof(simpleCA1$rowcoord) # what is it?
class(simpleCA1$rowcoord) # what is it? (sorry) Huom! matrix (29.5.20)
storage.mode(simpleCA1$rowcoord) # what is it? (very sorry)
length(simpleCA1$rowcoord) # how long is it? What about two dimensional objects?
attributes(simpleCA1$rowcoord)

# Standardikoorinaateista principal-koordinaatteihin

simpleCA1$sv
# simpleCA1$sv %>% sum() - ei ehkä kiinnostava? (15.6.20)
# Pääakselien inertiat (ominaisarvot?) ovat singulaariarvojen 
# neliöitä 

simpleCA1.inert <- simpleCA1$sv^2 %>% sum()
simpleCA1.inert # rivi- ja sarakeinertioiden summat = kokonaisinertia
simpleCA1$rowinertia %>% sum() 
simpleCA1$colinertia %>% sum()
# Inertia on myös Khii2 - testisuure jaettuna havaintojen lukumäärällä

chisq.test(simpleCA1$N)$statistic / sum(simpleCA1$N)

# Maksimi-inertia on dimensioden lukumäärä (tässä 4)
# Mutta eipä kai tämäkään kovin kiinnostava luku ole (15.6.20)
simpleCA1.inert / 4

# Mitäs nämäkin ovat? (13.6.20)
rowsums(simpleCA1$rowcoord)
rowsums(simpleCA1$colcoord)
colSums(simpleCA1$colcoord)
colSums(simpleCA1$rowcoord)

diag(simpleCA1$sv) # (4 x 4)
simpleCA1$rowcoord

# 6:4 x 4:4 -> 6x4
#
# Principal coordinates

simpleCA1.rpc <- simpleCA1$rowcoord %*% diag(simpleCA1$sv)
simpleCA1.rpc
# Mitäs nämä ovat? (13.6.20)
rowsums(simpleCA1.rpc)
colSums(simpleCA1.rpc)
simpleCA1.rpc["FI",1:2] # rivipisteen principal-koordinaatit

# Plot - objekti: pisteiden koordinaatit
#testMapObj <- koordinaatit talteen (pc, sc)
# X11()

testMapObj <- plot(simpleCA1, map = "rowprincipal")
str(testMapObj)
testMapObj$rows
testMapObj$cols
# sarakkeet vektoreina origosta - voi lisätä maaga-kuviin! (13.6.20)
segments(0,0, simpleCA1$colcoord[, 1],simpleCA1$colcoord[, 2], col = "red")

# rivipiste sarakkeiden barysentrisenä keskiarvona
segments(simpleCA1.rpc[5,1],simpleCA1.rpc[5,2],simpleCA1$colcoord[, 1],
         simpleCA1$colcoord[, 2], col = "pink")
#Heh - toimii! (8.6.20)

# Maa-pisteet yhdistettynä (esimerkki) (8.6.20)
segments(simpleCA1.rpc[5,1],simpleCA1.rpc[5,2],
         simpleCA1.rpc[4,1],simpleCA1.rpc[4,2]
         )
segments(simpleCA1.rpc[4,1],simpleCA1.rpc[4,2],
         simpleCA1.rpc[3,1],simpleCA1.rpc[3,2]
        )
lines(simpleCA1.rpc[,1],simpleCA1.rpc[,2])
# tässä kätevä, kun järjestää koordinaatit haluttuun järjestykseen (9.6.20)

#G1_4_CAlaaj1.Rmd - maaga - rivi 537, koodilohko maagaCA1
#
# maagaCA1 <- ca(~maaga + Q1b,ISSP2012esim2.dat)

# maapisteiden pääkoordinaatit janojen piirtämiseen
# HUOM! maagaCA1.rpc on matriisi

maagaCA1.rpc <- maagaCA1$rowcoord %*% diag(maagaCA1$sv)

# Nyt menee vaikeaksi! Järjestys BEf1...f6, BEm1...m6 ja maat 
# BE(1:6, 7:12) BG(13:18, 19:24), 
# DE (25:30, 31:36), DK(37:42, 43:48),FI(49:54, 55:60) 
# HU(61:66, 67:72)

# 12.8.2020 Maaga-kuvat Galku-projektiin
# type = "b" lines-komennossa tuo pisteen
# plot opitolla type=n piirtää pohjan, mutta pisteet varmaan käsityönä?
# 

maagaCA1.rpc
X11()
par(cex = 0.5)
plot(maagaCA1, main = "Äiti töissä: ikäluokka ja sukupuoli maittain 1",
     sub = "symmetrinen kartta cex=0.5")
     lines(maagaCA1.rpc[49:54,1],maagaCA1.rpc[49:54,2], col="blue") #FIf
     lines(maagaCA1.rpc[55:60,1],maagaCA1.rpc[55:60,2], col="red")  #FIm
     lines(maagaCA1.rpc[25:30,1],maagaCA1.rpc[25:30,2], col="blue") #DEf
     lines(maagaCA1.rpc[31:36,1],maagaCA1.rpc[31:36,2], col="red")  #DEm
     lines(maagaCA1.rpc[37:42,1],maagaCA1.rpc[37:42,2], col="blue") #DKf
     lines(maagaCA1.rpc[43:48,1],maagaCA1.rpc[43:48,2], col="red")  #DKm

par(cex = 0.5)
plot(maagaCA1, main = "Äiti töissä: ikäluokka ja sukupuoli maittain 2",
          sub = "symmetrinen kartta cex=0.5")
     lines(maagaCA1.rpc[1:6,1],maagaCA1.rpc[1:6,2], col="blue") #BEf
     lines(maagaCA1.rpc[7:12,1],maagaCA1.rpc[7:12,2], col="red")  #BEm
     lines(maagaCA1.rpc[13:18,1],maagaCA1.rpc[13:18,2], col="blue") #BGf
     lines(maagaCA1.rpc[19:24,1],maagaCA1.rpc[19:24,2], col="red")  #BGm
     lines(maagaCA1.rpc[61:66,1],maagaCA1.rpc[61:66,2], col="blue") #HUf
     lines(maagaCA1.rpc[67:72,1],maagaCA1.rpc[67:72,2], col="red")  #HUm

#Yritys zoomaukseen, pelkkä kuvakehys type = "n"     
    plot(rbind(maagaCA1.rpc,maagaCA1.cpc), type = "n",  xlim = c(-0.75,0.37), 
         ylim = c(-0.75,0.37),
          main = "Äiti töissä: ikäluokka ja sukupuoli maittain 2",
          sub = "osa symmetristä karttaa"
     )
     
# Jospa plot-kuva talteen?

str(testMapObj)
testMapObj$rows
(simpleCA1.rpc[,1:2])
testMapObj$rows - simpleCA1.rpc[,1:2]

# yksi rivipiste pc

#Miksi ei enään toimi?? 29.5.20, onko jo tehty yllä? (9.6.20)
simpleCA1.rpc["FI",1:2]
FIrpc <- simpleCA1.rpc["FI",1:2]
Spoint <- simpleCA1$colcoord["S",1:2]
x <- c(FIrpc[1], Spoint[1])
y1 <- c(FIrpc[2], Spoint[2])
plot(simpleCA1, map = "rowprincipal")
     lines(x, y1, type = "l" )
str(FIrpc)
FIrpc
Spoint
Epoint
x
y1

# pc -> sc - esimerkki (MG2017 laskarit) - hyödyllistä laskentaa

simpleCA1.results <- summary(simpleCA1)
simpleCA1.results
str(simpleCA1.results)
simpleCA1.results$rows # df 6 obs. of  10 variables - per milles
str(simpleCA1.results$rows)

str(simpleCA1.results$scree)

# ensimmäinen sarake dimensio, toinen ominaisarvot
simpleCA1.results$scree 

# ominaisarvot = principal inertias
simpleCA1.oarv <- simpleCA1.results$scree[,2]
simpleCA1.oarv

# ominaisarvojen neliöjuuret = singulaariarvot

sqrt(simpleCA1.oarv)
diag(sqrt(simpleCA1.oarv)) 

# Tarkistus
# diag(sqrt(simpleCA1.oarv)) - diag(simpleCA1$sv) 

diag(1/sqrt(simpleCA1.oarv)) # Mikä? (11.4.20)

simpleCA1.rsc <- simpleCA1.rpc %*% diag(1/sqrt(simpleCA1.oarv))
simpleCA1.rsc
simpleCA1$rowcoord # samalta näyttää
simpleCA1.rsc - simpleCA1$rowcoord # Nollaa on

# Frekvenssitaulukko

simpleCA1$N
str(simpleCA1$N)
class(simpleCA1$N)

simpleCA1.frek <- simpleCA1$N
simpleCA1.frek
class(simpleCA1.frek)
dimnames(simpleCA1.frek) <- list(simpleCA1$rownames, simpleCA1$colnames)

simpleCA1.Rowrek <- simpleCA1.frek/rowsums(simpleCA1.frek)
simpleCA1.Rowrek
testCA3 <- ca(simpleCA1.Rowrek)
testCA3
# Miksi rivimassat ovat 0.166667 ?

testCA3$rowmass
# 0.1666667 joka riville, kuusi riviä
# 6*0.1666667 = 1 , tämä MCA_day2_new_JH.R - skriptissä!

#X11()
plot(testCA3, main = "Symmetrinen kartta - rivimassat samat")
plot(simpleCA1)

summary(simpleCA1)
#  dim    value      %   cum%   scree plot               
#    1      0.136619  76.0  76.0  *******************      
#    2      0.027089  15.1  91.1  ****                     
#    3      0.010054   5.6  96.7  *                        
#    4      0.005988   3.3 100.0  *                        
#    -------- -----                                 
#    Total: 0.179751 100.0                                 
#

# Rows:
#    name   mass  qlt  inr    k=1 cor ctr    k=2 cor ctr  
#   1 |   BE |  247  465   34 |   93 347  16 |  -54 118  27 |
#    2 |   BG |  113  874  251 |  586 862 284 |   70  12  21 |
#    3 |   DE |  210  584   36 |  -94 291  14 |  -95 293  70 |
#    4 |   DK |  170  996  381 | -586 853 428 |  240 143 362 |
#    5 |   FI |  136 1000   92 | -214 380  46 | -274 620 377 |
#    6 |   HU |  122  889  206 |  487 783 213 |  179 105 144 |
    
#    Columns:
#    name   mass  qlt  inr    k=1 cor ctr    k=2 cor ctr  
#    1 |    S |   99  784  152 |  424 653 131 |  190 131 132 |
#    2 |    s |  238  788  140 |  278 731 134 |   78  57  53 |
#    3 |      |  168  720   88 |  259 707  82 |   34  12   7 |
#    4 |    e |  261  982  108 |  -28  11   2 | -268 971 693 |
#    5 |    E |  234 1000  512 | -616 966 651 |  115  34 114 |

summary(testCA3)
# Principal inertias (eigenvalues):
#
#dim    value      %   cum%   scree plot               
#1      0.167678  77.9  77.9  *******************      
#    2      0.030095  14.0  91.9  ***                      
#    3      0.013206   6.1  98.0  **                       
#    4      0.004296   2.0 100.0                           
#-------- -----                                 
#    Total: 0.215275 100.0  
#
#
#Rows:
#    name   mass  qlt  inr    k=1 cor ctr    k=2 cor ctr  
#1 |   BE |  167  295   17 |   46  97   2 |  -66 199  24 |
#    2 |   BG |  167  884  270 |  554 882 306 |   22   1   3 |
#    3 |   DE |  167  718   33 | -144 489  21 |  -98 229  54 |
#    4 |   DK |  167  993  367 | -635 849 400 |  261 144 377 |
#    5 |   FI |  167  999  114 | -270 494  72 | -272 505 411 |
#    6 |   HU |  167  870  200 |  448 778 199 |  154  92 132 |
#    
#    Columns:
#    name   mass  qlt  inr    k=1 cor ctr    k=2 cor ctr  
#1 |    S |  105  785  153 |  450 649 127 |  206 135 148 |
#    2 |    s |  250  792  148 |  311 762 145 |   62  30  32 |
#    3 |      |  171  792   73 |  267 780  73 |   33  12   6 |
#    4 |    e |  256  976  103 |  -66  51   7 | -283 925 681 |
#    5 |    E |  218 1000  524 | -706 964 649 |  136  36 133 |
testCA3$rowcoord - simpleCA1$rowcoord
testCA3$colcoord - simpleCA1$colcoord
