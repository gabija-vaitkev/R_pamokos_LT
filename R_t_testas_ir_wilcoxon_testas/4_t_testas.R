######################
# Neporinis t-testas #
######################
?PlantGrowth
View(PlantGrowth)
head(PlantGrowth)

# Išsirenkame tik dvi grupes - kontrolę ir trt1
subset2 <- subset(PlantGrowth, group %in% c("ctrl", "trt2"))

# Vizualizuojame duomenis:
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

ggplot(subset2, aes(x = group, y = weight, fill = group)) +
  geom_boxplot(
    width = 0.5,
    alpha = 0.8
  ) +
  geom_jitter(
    width = 0.08,
    size = 2,
    alpha = 0.8
  ) +
  scale_fill_manual(
    values = c("ctrl" = "#d62976", "trt2" = "#4f5bd5")
  ) +
  labs(
    title = "Plant Weight Between Groups",
    x = "Group",
    y = "Weight"
  ) +
  theme_classic(base_size = 14) +
  theme(legend.position = "none")

# Atsiskiriame lyginamas grupes į pogrupius
# Tikriname duomenų normalumą
ctrl <- subset(subset2, subset2$group == "ctrl")
trt2 <- subset(subset2, subset2$group == "trt2")

# Pasitikriname duomenų normalumą
shapiro.test(ctrl$weight)
shapiro.test(trt2$weight)

# Pasitikriname dispersijų homogeniškumą
if (!require("car")) install.packages("car")
library(car)
leveneTest(weight ~ group, data = subset2)

# T-testas taikomas tada kai duomenys pasiskirstę normaliai
# ir dispersijos homogeniškos
t.test(ctrl$weight, trt2$weight, paired = FALSE, var.equal = TRUE)

# Kai duomenys pasiskirstę normaliai,
# bet dispersijos nehomogeniškos
# taikomas T-testas su Welch korekcija
t.test(ctrl$weight, trt2$weight, paired = FALSE, var.equal = FALSE)

# Kai duomenys nėra pasiskirstę normaliai,
# taikomas Wilcoxon Rank-sum (Mann-Whitney U) testas
wilcox.test(ctrl$weight, trt2$weight, paired = FALSE)


####################
# Porinis t-testas #
####################
?sleep
View(sleep)
head(sleep)

# Vizualizuojame duomenis:
ggplot(sleep, aes(x = group, y = extra, fill = group)) +
  geom_boxplot(
    width = 0.5,
    alpha = 0.8
  ) +
  geom_jitter(
    width = 0.08,
    size = 2,
    alpha = 0.8
  ) +
  scale_fill_manual(
    values = c("1" = "#fa7e1e", "2" = "#962fbf")
  ) +
  labs(
    title = "Increase in Sleep by Drug Group",
    x = "Group",
    y = "Extra hours of sleep"
  ) +
  theme_classic(base_size = 14) +
  theme(legend.position = "none")

# Atsiskiriame grupes į pogrupius
gr_1 <- subset(sleep, sleep$group == "1")
gr_2 <- subset(sleep, sleep$group == "2")

# Pasitikriname duomenų normalumą
shapiro.test(gr_1$extra)
shapiro.test(gr_2$extra)

# Atliekame porinį t-testą
t.test(gr_1$extra, gr_2$extra, paired = TRUE)

# Kai poriniai duomenys nėra pasiskirstę normaliai,
# Taikomas Wilcoxon signed-rank testas
wilcox.test(gr_1$extra, gr_2$extra, paired = TRUE)
