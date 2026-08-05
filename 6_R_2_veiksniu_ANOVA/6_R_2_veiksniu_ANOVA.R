# Peržiūrime duomenis
?ToothGrowth
View(ToothGrowth)

# Suteikiame duomenims naują pavadinimą
my_data <- ToothGrowth
my_data

# Patikriname duomenų struktūrą
str(my_data)

# Susitvarkome duomenis:
# konvertuojame dozes iš skaitmenų į faktorius
# ir rekoduojame dozes į "D_0.5", "D_1", "D_2"
my_data$dose <- factor(my_data$dose, 
                       levels = c(0.5, 1, 2),
                       labels = c("D_0.5", "D_1", "D_2"))
head(my_data)

# Aprašomoji statistika kiekvienoje grupėje
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

group_by(my_data, supp, dose) %>%
  summarise(
    count = n(),
    mean = mean(len, na.rm = TRUE),
    sd = sd(len, na.rm = TRUE)
  )

##########################
# Duomenų vizualizavimas #
##########################
# 1. Dėžučių diagrama su keliais skirtingais grupavimais
# Odontoblastų ilgis ("len") pagal grupes ("dose")
# Dėžutės spalvinamos pagal papildo tipą ("supp")
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

ggplot(my_data, aes(x = dose, y = len, fill = supp)) +
  geom_boxplot(color = "black") +
  scale_fill_manual(values = c("#00AFBB", "#E7B800")) +
  labs(x = "Dose (mg/day)", y = "Length (μm)", fill = "Supplement") +
  theme_minimal(base_size = 14)

# 2. Linijinė diagrama su keliais skirtingais grupavimais
# Odontoblastų ilgis ("len") pagal grupes ("dose")
# Linijos spalvinamos pagal papildo tipą ("supp")
# Pridedame standartinės paklaidos ūselius (mean_se)
library(ggplot2)

ggplot(my_data, aes(x = dose, y = len, group = supp, color = supp)) +
  geom_jitter(width = 0.1, alpha = 0.6) +
  stat_summary(fun = mean, geom = "line", linewidth = 1) +
  stat_summary(fun = mean, geom = "point", size = 3) +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.1) +
  scale_color_manual(values = c("#00AFBB", "#E7B800")) +
  labs(x = "Dose (mg/day)", y = "Length (μm)", color = "Supplement") +
  theme_minimal(base_size = 14)

# Dviejų veiksnių ANOVA su sąveika
# Norime sužinoti ar odontoblastų ilgiui
# daro įtaką papildas ir jo dozė
res.aov <- aov(len ~ supp * dose, data = my_data)
summary(res.aov)

# Patikriname liekanų (residuals) normalumą
residuals_anova <- residuals(res.aov)
shapiro.test(residuals_anova)
