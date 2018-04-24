#paketit: paketit.R

sessionInfo()

# siivous - pois tilapäistiedostoja aika ajoin (temp, test, apu)
# jatkossa objektien nimeen joku tunniste: df jne

#rm(test1, test2, test3, test4, test5, temp1, temp2, temp3)



#aineiston valinnan tarkistuksia 9.4.2018
#data input
#puuttuvat tiedot NA -> 9 jo lukuvaiheessa ?
#ei ehkä, sillä sitten ne ovat numeroita!
#lasketaan puuttuvia
#ISSP2012.data <- read_spss("data/ZA5900_v4-0-0.sav")
# tärkeä näyttää tuo versio ZA5900_v4-0-0!

str(ISSP2012.data$V50 )
ISSP2012.data %>% count(V50) # 14.4.2018 mitä tämä tekee ?
ISSP2012.data$V50 
summary(ISSP2012.data$V4)
temp3 <- filter(ISSP2012.data, V4 == 826) %>% select(V3,V4, C_ALPHAN)
temp3 <- filter(temp3, V3 == 82601)

#tsekataan vielä GB
# V3 == 62002 V4 == 826 

#perustaulukoita brittidatalla (ei muuttujia vielä)
temp3 %>% tableX(V3,V3, type = "count") # molemmat muuttujat samat



typeof(ISSP2012.data)
class(ISSP2012.data)
storage.mode(ISSP2012.data)
length(ISSP2012.data)
attributes(ISSP2012.data) # notes, names
get_label(ISSP2012.data) # variable labels
get_labels(ISSP2012.data) # value labels
ISSP2012.data$V3

tail(temp3)
head(temp3)
str(temp3) # 950
# kolme maakoodia - tsekkaus 9.4.2018
#two country code variables based on the ISO Code 3166. One identifies
#countries as a whole, the other one possible subsamples, such as East and West Germany. The cross
#tabulations shown in this Variable Report are based on a third, alphanumerical country code variable,
#which also identifies subsamples."
#V3 on koodi jossa tieto aluejaosta, V4 koko maan ISO-koodi.

#esim Saksa
#V3        V4        C_ALPHAN
#<dbl+lbl> <dbl+lbl> <chr>   
#  27601     276       DE      
#  27601     276       DE Länsi
#....
#  27602     276       DE  Itä    
#  27602     276       DE  
#
temp1 <- select(ISSP2012.data,V3,V4, C_ALPHAN) %>% filter(C_ALPHAN == "BE") #|(C_ALPHAN == "DE")) #Belgia ja Saksa
select(ISSP2012.data,V3,V4, C_ALPHAN) %>% filter(C_ALPHAN == "DE") %>% tableX(V3, C_ALPHAN)

#maakoodauksen selvittelyä 14.4.2018
# filter(C_ALPHAN == "BE") # mukaan kaikki V3-koodit 5601, 5602 ja 5603, V4 = 56

temp1 %>% tableX(V3, C_ALPHAN)
# Belgia
# C_ALPHAN
# V3      BE   Total
# 5601  1090 1090 
# 5602  549  549  
# 5603  563  563  
# Total 2202 2202

#Saksa
# C_ALPHAN
# V3      DE   Total
# 27601 1208 1208 
# 27602 558  558  
# Total 1766 1766 

#aluejaon nimi on muuttjuan V3 labelissa
temp1$V3
#  V3
# 5601                                        BE-FLA-Belgium/ Flanders
# 5602                                        BE-WAL-Belgium/ Wallonia
# 5603                                        BE-BRU-Belgium/ Brussels
# 27601                                               DE-W-Germany-West
# 27602                                               DE-E-Germany-East

# Saksan ja Belgian alueet, kysymys V6, N = 3968

temp1 <- select(ISSP2012.data,V3,V4, C_ALPHAN, V6) %>% filter((C_ALPHAN == "BE") |(C_ALPHAN == "DE"))

# luokittelumuuttujat faktoreiksi _ HÄMÄRÄÄ! (15.4.2018)
temp1$V3 <- as_factor(temp1,V3) # forcats - paketin funktio, näköjään vain yksi kerrallaan
#,temp1$V4,temp1$C_ALPHAN,temp1$V6
str(temp1)

head(temp1)
summary(temp1)
temp1 <- temp1 %>% factor(V3)
#taulukoita
temp1 %>% tableX(V3,C_ALPHAN,type = "count")
test1 %>% tableX(V6,C_ALPHAN,type = "col_perc")
test1 %>% tableX(V6,C_ALPHAN,type = "count")
hist(test1$V3)
