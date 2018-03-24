#data input
#puuttuvat tiedot NA -> 9 jo lukuvaiheessa ?
#ei ehkä, sillä sitten ne ovat numeroita!

#ISSP2012test.data <- read_spss("data/ZA5900_v4-0-0.sav")

#lasketaan puuttuvia
str(ISSP2012.data) %>% count(V5)


