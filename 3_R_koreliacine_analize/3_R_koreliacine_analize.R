#######################################
# Paprastų koreliacijų pavyzdys #######
# Užkrauname built-in duomenų rinkinį #
#######################################
data(iris)
View(iris)

#####################################################################
# Perspėjamasis pavyzdys ############################################
# kodėl prieš atliekant koreliacinę analizę reikėtų atskirti grupes #
#####################################################################
# 1. Patikriname duomenų normalumą
shapiro.test(iris$Petal.Length)
shapiro.test(iris$Petal.Width)

# 2. Atliekame koreliacinę analizę
cor_iris <- cor.test(
  iris$Petal.Length,
  iris$Petal.Width,
  method = "spearman"
)
cor_iris

# 3. Nubrėžiame diagramą
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Iris - pilno duomenų rinkinio koreliacinė analizė
label_iris <- paste0(
  "r = ", round(cor_iris$estimate, 3),
  "\np = ", signif(cor_iris$p.value, 3)
)

# Brėžiame diagramą
ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              color = "grey30",
              linewidth = 1) +
  geom_point(color = "#fa7e1e", size = 3) +
  annotate(
    "text",
    x = min(iris$Petal.Length),
    y = max(iris$Petal.Width),
    label = label_iris,
    hjust = 0, vjust = 1
  ) +
  labs(
    title = "Iris",
    x = "Petal Length",
    y = "Petal Width"
  ) +
  theme_bw(base_size = 14)

#######################################################
# Duomenų iš atskirų grupių negalima suplakti į vieną #
#######################################################

# 1. Sukuriame pogrupius (subsets)
iris_setosa <- subset(iris, Species == "setosa")
iris_versicolor <- subset(iris, Species == "versicolor")
iris_virginica <- subset(iris, Species == "virginica")

# 2. Patikriname duomenų normalumą pogrupiuose
shapiro.test(iris_setosa$Petal.Length)
shapiro.test(iris_versicolor$Petal.Length)
shapiro.test(iris_virginica$Petal.Length)

shapiro.test(iris_setosa$Petal.Width)
shapiro.test(iris_versicolor$Petal.Width)
shapiro.test(iris_virginica$Petal.Width)

# 3. Atliekame koreliacines analizes tarp žiedlapių ilgio ir pločio
# atskiruose pogrupiuose
cor_setosa <- cor.test(
  iris_setosa$Petal.Length,
  iris_setosa$Petal.Width,
  method = "spearman"
)
cor_setosa

cor_versicolor <- cor.test(
  iris_versicolor$Petal.Length,
  iris_versicolor$Petal.Width,
  method = "spearman"
)
cor_versicolor

cor_virginica <- cor.test(
  iris_virginica$Petal.Length,
  iris_virginica$Petal.Width,
  method = "pearson"
)
cor_virginica

# 4. Brėžiame sklaidos diagramas atskirai kiekvienai veislei
# Perspėjimas - tam, kad diagramų kodas veiktų,
# Prieš tai turi būti praleistas anksčiau esantis koreliacijų kodas
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("dplyr")) install.packages("dplyr")

library(ggplot2)
library(dplyr)

# Setosa diagrama
label_setosa <- paste0(
  "r = ", round(cor_setosa$estimate, 2),
  "\np = ", signif(cor_setosa$p.value, 3)
)

ggplot(iris_setosa, aes(Petal.Length, Petal.Width)) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              color = "grey30",
              linewidth = 1) +
  geom_point(color = "#d62976", size = 3) +
  annotate(
    "text",
    x = min(iris_setosa$Petal.Length),
    y = max(iris_setosa$Petal.Width),
    label = label_setosa,
    hjust = 0, vjust = 1
  ) +
  labs(
    title = "Iris Setosa",
    x = "Petal Length",
    y = "Petal Width"
  ) +
  theme_bw(base_size = 14)

# Versicolor diagrama
label_versicolor <- paste0(
  "r = ", round(cor_versicolor$estimate, 3),
  "\np = ", signif(cor_versicolor$p.value, 3)
)

ggplot(iris_versicolor, aes(Petal.Length, Petal.Width)) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              color = "grey30",
              linewidth = 1) +
  geom_point(color = "#962fbf", size = 3) +
  annotate(
    "text",
    x = min(iris_versicolor$Petal.Length),
    y = max(iris_versicolor$Petal.Width),
    label = label_versicolor,
    hjust = 0, vjust = 1
  ) +
  labs(
    title = "Iris Versicolor",
    x = "Petal Length",
    y = "Petal Width"
  ) +
  theme_bw(base_size = 14)

# Virginica diagrama
label_virginica <- paste0(
  "r = ", round(cor_virginica$estimate, 3),
  "\np = ", signif(cor_virginica$p.value, 3)
)

ggplot(iris_virginica, aes(Petal.Length, Petal.Width)) +
  geom_smooth(method = "lm", 
              se = FALSE, 
              color = "grey30",
              linewidth = 1) +
  geom_point(color = "#4f5bd5", size = 3) +
  annotate(
    "text",
    x = min(iris_virginica$Petal.Length),
    y = max(iris_virginica$Petal.Width),
    label = label_virginica,
    hjust = 0, vjust = 1
  ) +
  labs(
    title = "Iris Virginica",
    x = "Petal Length",
    y = "Petal Width"
  ) +
  theme_bw(base_size = 14)

# 5. Brėžiame bendrą sklaidos diagramą visoms veislėms
# Perspėjimas - tam, kad diagramų kodas veiktų,
# Prieš tai turi būti praleistas anksčiau esantis koreliacijų kodas
library(ggplot2)
library(dplyr)

# Paruošiami aprašai iš turimų testų rezultatų
cor_labels <- data.frame(
  Species = c("setosa", "versicolor", "virginica"),
  label = c(
    paste0(
      "Spearman\nr = ", round(cor_setosa$estimate, 3),
      "\np = ", signif(cor_setosa$p.value, 3)
    ),
    paste0(
      "Spearman\nr = ", round(cor_versicolor$estimate, 3),
      "\np = ", signif(cor_versicolor$p.value, 3)
    ),
    paste0(
      "Pearson\nr = ", round(cor_virginica$estimate, 3),
      "\np = ", signif(cor_virginica$p.value, 3)
    )
  ),
  y = c(2.3, 1.7, 1.1)  # nurodomos teksto pozicijos
)

# Parenkamos spalvos
species_colors <- c(
  "setosa" = "#d62976",
  "versicolor" = "#962fbf",
  "virginica" = "#4f5bd5"
)

# Brėžiame bendrą grafiką
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", 
              se = FALSE,
              linewidth = 1) +
  scale_color_manual(values = species_colors) +
  geom_text(
    data = cor_labels,
    aes(
      x = min(iris$Petal.Length),
      y = y,
      label = label,
      color = Species
    ),
    hjust = 0,
    show.legend = FALSE
  ) +
  labs(
    x = "Petal Length",
    y = "Petal Width",
    color = "Species"
  ) +
  theme_bw(base_size = 14)

#######################################
# Koreliacijų matricos pavyzdys #######
# Užkrauname built-in duomenų rinkinį #
#######################################
?mtcars
View(mtcars)
data(mtcars)
str(mtcars)
head(mtcars)

# Patikriname duomenų normalumą
shapiro.test(mtcars$mpg)
shapiro.test(mtcars$cyl)
shapiro.test(mtcars$disp)
shapiro.test(mtcars$hp)
shapiro.test(mtcars$drat)
shapiro.test(mtcars$wt)
shapiro.test(mtcars$qsec)
shapiro.test(mtcars$vs)
shapiro.test(mtcars$am)
shapiro.test(mtcars$gear)
shapiro.test(mtcars$carb)

# Atliekame statistinius testus ir sukuriam koreliacjų matricą
cor_matrix <- cor(
  mtcars,
  method = "spearman"
)

cor_matrix

cor_matrix_rounded <- round(cor_matrix, 3)

cor_matrix_rounded

# Naudojame write.csv funkciją tam, kad išsisaugotume rezultatus:
# (prisiminkite, kur jūsų darbinė direktorija - nusistatykite ją)
getwd()

write.csv(cor_matrix_rounded, "correlation_matrix_rho.csv", row.names = TRUE)

# Jeigu kompiuterio lokacijos nustatymai lietuviški
# ir csv reikšmės atskirtos ne kableliais, o kabliataškiais
# naudojame funkciją write.csv2

# p reikšmių koreliacijų matrica
cor_pvalues <- function(mat) {
  n <- ncol(mat)
  p_mat <- matrix(NA, n, n)
  colnames(p_mat) <- colnames(mat)
  rownames(p_mat) <- colnames(mat)
  
  for (i in 1:n) {
    for (j in 1:n) {
      test <- cor.test(mat[, i], mat[, j], method = "spearman")
      p_mat[i, j] <- test$p.value
    }
  }
  p_mat
}

p_matrix <- cor_pvalues(mtcars)

# Jeigu yra poreikis, galime suapvalinti p reikšmes
p_matrix_rounded <- round(p_matrix, 3)
p_matrix_rounded

# Naudojame write.csv funkciją tam, kad išsisaugotume rezultatus:
# (šiuo atveju išsaugomos nesuapvalintos p reikšmės)
write.csv(p_matrix, "correlation_matrix_p.csv", row.names = TRUE)

# Jeigu reikšmės atskirtos kabliataškiais
# naudojame write.csv2

# Koreliacijų matricos  vizualizacija
# 1. pilna koreliacijų matrica - rodomi visi rezultatai
if (!require("corrplot")) install.packages("corrplot")
library(corrplot)

corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  tl.col = "black",
  addCoef.col = "black",
  number.cex = 1
)

# 2. Pakoreguota koreliacijų matrica - rodomi tik
# statistiškai reikšmingi rezultatai
corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  tl.col = "black",
  addCoef.col = "black", # arba "white"
  number.cex = 1,
  p.mat = p_matrix,
  sig.level = 0.05,
  insig = "blank"
)

# 3. Pakoreguota koreliacijų matrica - išmetame įstrižainę,
# kur kintamieji lyginami patys su savimi
# ir pakeičiame šrifto spalvą
corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  tl.col = "black",
  addCoef.col = "white",
  number.cex = 1,
  p.mat = p_matrix,
  sig.level = 0.05,
  insig = "blank",
  diag = FALSE
)
