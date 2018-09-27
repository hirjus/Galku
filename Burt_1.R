#Burt? MCA_day2_new_JH.R - esimerkki - aika sähläystä vielä...(27.9.18) -> r-tiedosto Burt_1.R
str(ISSP2012esim2.dat)
head(ISSP2012esim2.dat)
test1 <- select(ISSP2012esim2.dat, V6, maa,maaga)
str(test1)
maagaBurt <- mjca(test1, ps="")$Burt
dim(maagaBurt) #83 83
str(maagaBurt)
maagaBurt2 <- maagaBurt[6:83,1:5]
str(maagaBurt2)
head(maagaBurt2)
maagaBurt2