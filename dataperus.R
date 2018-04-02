#data input
#puuttuvat tiedot NA -> 9 jo lukuvaiheessa ?
#ei ehkä, sillä sitten ne ovat numeroita!

#ISSP2012test.data <- read_spss("data/ZA5900_v4-0-0.sav")

#lasketaan puuttuvia
#ISSP2012.data <- read_spss("data/ZA5900_v4-0-0.sav")
ISSP2012.data %>% count(V50)
ISSP2012.data$V50 

