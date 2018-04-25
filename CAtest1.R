# CAtest1.R 24.4.2018
# CA-paketin testailua
simpleCA1 <- ca(~maa + V6,ISSP2012esim1.dat)

print(simpleCA1)
summary(simpleCA1)
#plot.window(,asp=1)
plot.ca(simpleCA1, map = "symmetric", mass = c(TRUE,TRUE))
