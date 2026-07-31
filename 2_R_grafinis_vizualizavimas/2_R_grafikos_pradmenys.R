####################################
# Grafinio vizualizavimo pagrindai #
####################################

############################
# Bazinio R vizualizacijos #
############################

# Duomenų rinkiniai, kuriuos naudosime:
# iris ir PlantGrowth

View(iris)
View(PlantGrowth)

# Nusistome atgal į 1 grafiko vaizdavimą vienu metu
par(mfrow=c(1,1))

# Histograma
hist(iris$Sepal.Length, main="Taurėlapių ilgio pasiskirstymas", xlab="Ilgis (cm)")

# Stulpelinė diagrama
barplot(table(iris$Species), main="Mėginių kiekis pagal augalo rūšį", ylab="Kiekis")

# Dėžučių grafikas
boxplot(weight ~ group, data=PlantGrowth,
        main="Augalų svoris pagal grupes", xlab="Grupė", ylab="Svoris (g)")

# Sklaidos diagrama
plot(iris$Sepal.Length, iris$Petal.Length,
     col = c("red", "green", "blue")[iris$Species],
     pch = 19,
     main = "Ryšys tarp žiedlapių ir taurėlapių ilgio",
     xlab = "Taurėlapio ilgis (cm)",
     ylab = "Žiedlapio ilgis (cm)")

# Pridedame legendą
legend("topleft",
       legend = levels(iris$Species),
       col = c("red", "green", "blue"),
       pch = 19)

#####################################
# Pereiname prie ggplot2 ############
# Jei naudojama pirmą kartą #########
# Reikia sudiegti ###################
# install.packages("ggplot2") #######
# Diegiama tik vieną kartą ##########
# Užkraunama kaskart pradėjus darbą #
# library(ggplot2) ##################
#####################################

library(ggplot2)

# Histograma su ggplot2
ggplot(iris, aes(x = Sepal.Length)) +
  geom_histogram(
    binwidth = 0.3,         # control bar width
    fill = "#D3D3FF",       # custom color
    color = "black"
  ) +
  labs(
    title = "Taurėlapių ilgio pasiskirstymas",
    x = "Taurėlapio ilgis (cm)",
    y = "Dažnis"
  ) +
  theme_minimal(base_size = 16)

# Stulpelinė diagrama su ggplot2
ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar(color = "black") +
  scale_fill_manual(values = c("#D3D3FF", "#C9F2C7", "#FFD6C9")) +
  labs(
    title = "Mėginių kiekis pagal augalo rūšį",
    x = "Rūšis",
    y = "Kiekis"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Dėžučių grafikas su ggplot2
ggplot(PlantGrowth, aes(x = group, y = weight, fill = group)) +
  geom_boxplot(color = "black") +
  scale_fill_manual(values = c("#eeaf61", "#ee5d6c", "#6a0d83")) +
  labs(
    title = "Augalų svoris pagal grupes",
    x = "Grupė",
    y = "Svoris (g)"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

# Sklaidos diagrama su ggplot2
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 3) +
  labs(
    title = "Ryšys tarp žiedlapių ir taurėlapių ilgio",
    x = "Taurėlapio ilgis (cm)",
    y = "Žiedlapio ilgis (cm)"
  ) +
  theme_minimal()

##############################
# Grafiko eksportavimas kodu #
##############################
g1 <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(
    title = "Ryšys tarp žiedlapių ir taurėlapių ilgio",
    x = "Taurėlapio ilgis (cm)",
    y = "Žiedlapio ilgis (cm)",
    color = "Rūšis"
  ) +
  theme_minimal()

g1

# Išsaugome grafiką su 300 dpi nustatymu
ggsave("sklaida.png", g1, 
       width = 6, height = 4, dpi = 300, units = "in")