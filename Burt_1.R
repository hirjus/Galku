#Burt? MCA_day2_new_JH.R - esimerkki - aika sähläystä vielä...
# (27.9.18) -> r-tiedosto Burt_1.R
# Jatketaan 20.9.20
# maaga - muuttuja luodaan G1_4_laaj2.Rmd - skriptissä

# ika liian iso luokitus, jätetään pois
# myös maaga turha, sille haetaan vaihtoehtoa

test1 <- select(ISSP2012esim2.dat, Q1b, maa,sp, age_cat)
str(test1)
maagaBurt <- mjca(test1, ps="")$Burt
dim(maagaBurt) #19 19
str(maagaBurt)
maagaBurt
head(maagaBurt)
# Miten näkisi rakenteen? (20.9.20)
# Q1bS Q1bs Q1b? Q1be Q1bE maaBE maaBG maaDE maaDK maaFI maaHU  spm  spf 
# age_cat1 age_cat2 age_cat3 age_cat4 age_cat5 age_cat6
# kysymykset 1:5, maat 6:11, sp 12:13, age_cat 14:19


# Rivit
maagaBurt[1,]

maagaBurt2 <- maagaBurt[6:11,1:5]
str(maagaBurt2)
head(maagaBurt2)
maagaBurt2
maagaBurt2 <- rbind(maagaBurt2, maagaBurt[12:13 ,1:5])
maagaBurt2 <- rbind(maagaBurt2, maagaBurt[14:19 ,1:5])

# Toimii!
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
