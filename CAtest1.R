# CAtest1.R 24.4.2018
# CA-paketin testailua
simpleCA1 <- ca(~maa + V6,ISSP2012esim1.dat)

print(simpleCA1)
summary(simpleCA1)
#plot.window(,asp=1)
plot.ca(simpleCA1, map = "symmetric", mass = c(TRUE,TRUE))

# Belgian ja Sakasan jako lisäpisteinä 24.5.2018
#head(ISSP2012esim1.dat)
suppointCA1 <- ca(~maa2 + V6,ISSP2012esim1.dat)
plot(suppointCA1, main = "Belgian ja Saksan ositteet")
#kuva kääntyy ympäri, kerrotaan koordinaattivektorit luvulla -1
#summary(suppointCA1)
#print(suppointCA1)
#str(suppointCA1)
#
#Käännetään kuva

suppointCA1b <- suppointCA1
suppointCA1b$rowcoord <- suppointCA1b$rowcoord[,] * (-1)
suppointCA1b$colcoord <- suppointCA1b$colcoord[,] * (-1)
suppointCA1b$rowcoord
suppointCA1b$colcoord
plot(suppointCA1b, main = "Belgian ja Saksan ositteet")
# Miten lisärivit? (24.5.2018)
# Luetaan data tauluksi - ei toimi, char-table
# yritetään uudestaan table-funktiolla
# data maa2-muuttujalla
suppoint1_df1 <- select(ISSP2012esim1.dat, maa2,V6)
str(suppoint1_df1)
head(suppoint1_df1)
suppoint1_tab1 <- table(suppoint1_df1$maa2, suppoint1_df1$V6)
suppoint1_tab1
#plot(ca(~maa2 + V6, suppoint1_df1)) #toimii
#
# Saksan ja Belgian summarivit
#
suppoint2_df <- filter(ISSP2012esim1.dat, (maa == "BE" | maa == "DE"))
suppoint2_df <- select(suppoint2_df, maa, V6)
#head(suppoint2_df)
#tail(suppoint2_df)
#str(suppoint2_df)
#suppoint2_df
suppoint2_tab1 <- table(suppoint2_df$maa, suppoint2_df$V6)
#suppoint2_tab1
suppoint2_tab1 <- suppoint2_tab1[-2,]
# kömpelösti kolme kertaa
suppoint2_tab1 <- suppoint2_tab1[-3,]
suppoint2_tab1 <- suppoint2_tab1[-3,]
suppoint2_tab1 <- suppoint2_tab1[-3,]
#suppoint2_tab1

#lisätään rivit maa2-muuttujan taulukkoon

suppoint1_tab1 <- rbind(suppoint1_tab1, suppoint2_tab1)
#suppoint1_tab1
suppointCA2 <- ca(suppoint1_tab1[,1:5], suprow = 10:11)
#käännetään kuva
suppointCA2b <- suppointCA2
suppointCA2b$rowcoord <- suppointCA2b$rowcoord[,] * (-1)
suppointCA2b$colcoord <- suppointCA2b$colcoord[,] * (-1)

plot(suppointCA2b, main = "Passiiviset pisteet DE ja BE" )


