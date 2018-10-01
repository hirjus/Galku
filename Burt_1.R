#Burt? MCA_day2_new_JH.R - esimerkki - aika sähläystä vielä...(27.9.18) -> r-tiedosto Burt_1.R
str(ISSP2012esim2.dat)
head(ISSP2012esim2.dat)
test1 <- select(ISSP2012esim2.dat, V6, maa,maaga)
str(test1)
maagaBurt <- mjca(test1, ps="")$Burt
dim(maagaBurt) #83 83
str(maagaBurt)
maagaBurt
maagaBurt2 <- maagaBurt[6:83,1:5]
str(maagaBurt2)
head(maagaBurt2)
maagaBurt2
# ei ihan helppoa...


testTab1 <- table(test1$maaga, test1$V6)
testTab1

testTab_sr <- table(test1$maa, test1$V6)
testTab_sr
testTab1 <- rbind(testTab1,testTab_sr)
testTab1

dim(testTab1) #78 riviä, 5 saraketta, 1-72 data ja 73-78 täydentävät rivit

spCAmaaga1 <- ca(testTab1[,1:5], suprow = 73:78)
X11()
par("cex"= 0.75, "asp" = 1)
plot(spCAmaaga1, main = "Äiti töissä: ikäluokka ja sukupuoli maittain 2")

#asymmetrinen kartta
X11()
par("cex"= 0.75, "asp" = 1)
plot(spCAmaaga1, main = "Äiti töissä: ikäluokka ja sukupuoli maittain 3 (kontribuutiot)",
                  map = "rowgreen", 
                  contrib= c("absolute", "absolute"),
                  mass = c(TRUE,TRUE),
                  arrows = c(FALSE,TRUE)
                  )
#numeeriset tulokset
summary(spCAmaaga1)
