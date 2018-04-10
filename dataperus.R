#paketit


#aineiston valinnan tarkistuksia 9.4.2018
#data input
#puuttuvat tiedot NA -> 9 jo lukuvaiheessa ?
#ei ehkä, sillä sitten ne ovat numeroita!

#ISSP2012test.data <- read_spss("data/ZA5900_v4-0-0.sav")

#lasketaan puuttuvia
#ISSP2012.data <- read_spss("data/ZA5900_v4-0-0.sav")
# tärkeä näyttää tuo versio ZA5900_v4-0-0!

str(ISSP2012.data$V50 )
ISSP2012.data %>% count(V50)
ISSP2012.data$V50 
summary(ISSP2012.data$V4)
temp3 <- filter(ISSP2012.data, V4 == 826) %>% select(V3,V4, C_ALPHAN)
temp3 <- filter(temp3, V3 == 82601)

#tsekataan vielä GB
# V3 == 62002 V4 == 826 

typeof(ISSP2012.data$V4)
class(ISSP2012.data$V4)
storage.mode(ISSP2012.data$V4)
length(ISSP2012.data$V4)
attributes(ISSP2012.data$V4)

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
temp1 <- select(ISSP2012.data,V3,V4, C_ALPHAN) %>% filter((C_ALPHAN == "BE") |(C_ALPHAN == "DE") | (C_ALPHAN == "GB"))
temp2 <- temp1 %>% filter(V3 == 82601) # %>% tableX(V4,C_ALPHAN,type = "count")

str(temp2)
tail(temp1)
summary(temp1)
temp1 <- factor(temp1$C_ALPHAN)
#taulukoita
temp1 %>% tableX(V3,C_ALPHAN,type = "row_perc")
test1 %>% tableX(V6,C_ALPHAN,type = "col_perc")
test1 %>% tableX(V6,C_ALPHAN,type = "count")
hist(test1$V3)
