################################
# 1 DALIS - susipažinkime su R #
################################

# Matematiniai ir loginiai uždaviniai programos pratestavimui
2 + 2
4 ^ 4
2 < 3
4 != 5

###################################
# 2 DALIS - aprašomoji statistika #
# ir duomenų normalumas ###########
###################################

# Paprasčiausias darbinio aplanko nustatymas:
# Session -> Set Working Directory -> Choose Directory...

# Kodinis darbinio aplanko nustatymas
# (reikia suvesti kelią į savo darbinį aplanką):
setwd("C:/Users/X/Documents/.../Jusu_aplankas")

# Norint patikrinti darbinę direktoriją, naudojame:
getwd()

# Paprasčiausias dokumento įsikėlimas: 
# File -> Import Dataset -> From Text (base)

# Pervadiname duomenis (jei duomenis įsikėlėme "User friendly" būdu)
zuvys1 <- zuvu_ilgis_1 
zuvys2 <- zuvu_ilgis_2

# Kodu grįstas duomenų įkėlimo būdas, 
# kuris yra naudingas ateityje norint išsaugoti, 
# pakartoti ar automatizuoti analizes; 
# Nurodoma dokumento direktorija: 
zuvys1 <- read.csv('C:/Users/gabij/Documents/Biomatika/Video/RStudio/1_ivadas/zuvu_ilgis_1.csv', 
                   header=TRUE, sep = ",", stringsAsFactors=T)

zuvys2 <- read.csv('C:/Users/gabij/Documents/Biomatika/Video/RStudio/1_ivadas/zuvu_ilgis_2.csv', 
                   header=TRUE, sep = ",", stringsAsFactors=T)

# Duomenų santrauka:
head(zuvys1)
head(zuvys2)

# Atsidarome duomenis peržiūrai:
View(zuvys1)
View(zuvys2)

# Stulpelių pavadinimai:
names(zuvys1)
names(zuvys2)

# Vidurkis:
mean(zuvys1$ilgis_cm)
mean(zuvys2$ilgis_cm)

# Mediana:
median(zuvys1$ilgis_cm)
median(zuvys2$ilgis_cm)

# Standartinis nuokrypis:
sd(zuvys1$ilgis_cm)
sd(zuvys2$ilgis_cm)

# Standartinė paklaida:
sd(zuvys1$ilgis_cm) / sqrt(length(zuvys1$ilgis_cm))
sd(zuvys2$ilgis_cm) / sqrt(length(zuvys2$ilgis_cm))

# Kitos aprašomosios statistikos funkcijos:
# min, max
min(zuvys1$ilgis_cm)
min(zuvys2$ilgis_cm)
max(zuvys1$ilgis_cm)
max(zuvys2$ilgis_cm)

# Duomenų aprašymas
summary(zuvys1)
summary(zuvys2)

# Histogramos 
# Nusistatome, kad rodytų du grafikus vieną šalia kito
par(mfrow = c(1,2))

hist(zuvys1$ilgis_cm, main = "Zuvys1", col = "lightblue")
hist(zuvys2$ilgis_cm, main = "Zuvys2", col = "lightpink")

# Q-Q diagramos
par(mfrow = c(1,2))

qqnorm(zuvys1$ilgis_cm, main = "Zuvys1 Q-Q diagrama")
qqline(zuvys1$ilgis_cm)

qqnorm(zuvys2$ilgis_cm, main = "Zuvys2 Q-Q diagrama")
qqline(zuvys2$ilgis_cm)

# Shapiro-Wilk testas normalumui patikrinti
shapiro.test(zuvys1$ilgis_cm)
shapiro.test(zuvys2$ilgis_cm)