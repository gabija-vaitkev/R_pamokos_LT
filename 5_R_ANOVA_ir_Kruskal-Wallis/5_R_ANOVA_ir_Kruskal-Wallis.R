# Naudosime chickwts duomenų rinkinį
head(chickwts)
View(chickwts)
levels(chickwts$feed)

###############################
# Parametrinio testo pavyzdys #
###############################
# Atliekame ANOVA
anova_result <- aov(weight ~ feed, data = chickwts)
summary(anova_result)

# Patikriname ANOVA liekanų (residuals) normalumą
# 1. Jeigu liekanos pasiskirsčiusios normaliai
# galima taikyti ANOVĄ (parametrinį testą)
residuals_anova <- residuals(anova_result)
shapiro.test(residuals_anova)

# Patikriname ar dispersijos homogeniškos
if (!require("car")) install.packages("car")
library(car)
leveneTest(weight ~ feed, data = chickwts)

# 2. Jeigu dispersijos būtų nehomogeniškos: 
# ANOVA su Welch korekcija
oneway.test(weight ~ feed, data = chickwts, var.equal = FALSE)

# Po ANOVA atliekame Tukey's HSD testą
TukeyHSD(anova_result)

# Sukuriame raides, kurios parodo reikšmingus skirtumus
# vadinama compact letter display (CLD)
if (!require("agricolae")) install.packages("agricolae")
library(agricolae)
hsd_res <- HSD.test(anova_result, "feed", group = TRUE)
hsd_res

#################################
# Neparametrinio testo pavyzdys #
#################################
# 3. Jeigu liekanos (residuals) nėra pasiskirsčiusios normaliai
# taikome neparametrinį Kruskal-Wallis testą
kruskal.test(weight ~ feed, data = chickwts)

# Po Kruskal-Wallis atliekame Dunn's post hoc testą
if (!require("FSA")) install.packages("FSA")
library(FSA)

dunn_output <- dunnTest(weight ~ feed, 
                   data = chickwts,method="bonferroni")
dunn_output

# Compact letter display (CLD)
if (!require("rcompanion")) install.packages("rcompanion")
library(rcompanion)

# Pasiimame Dunn's post hoc testo rezultatų lentelę
dunn_results <- dunn_output$res

cld_result <- cldList(comparison = dunn_results$Comparison,
                      p.value = dunn_results$P.adj,
                      threshold = 0.05)

print(cld_result)

#############################
# Paprasta ggplot2 diagrama #
#############################
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

p1 <- ggplot(chickwts, aes(x = feed, y = weight, fill = feed)) +
  # stat_boxplot(geom = "errorbar", width = 0.5) +
  geom_boxplot(alpha = 0.9, color = "grey30", linewidth = 0.5) +
  scale_fill_manual(values = c("#5C4B99", "#9AA0FF","#EABFFF", 
                               "#7ED3FF", "#3EA6FF", "#286DA8")) +
  labs(title = "Chicken Weight by Feed Type (ggplot2 v.1)",
       x = "Feed Type",
       y = "Weight (g)") +
  theme_bw(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "none",
    panel.grid.minor = element_blank()
  ) +
  scale_y_continuous(limits = c(100,450), breaks = seq(100,450,50))

p1

#########################
# Patobulintas ggplot2 #
#########################
if (!require("dplyr")) install.packages("dplyr")
if (!require("multcompView")) install.packages("multcompView")
library(ggplot2)
library(dplyr)
library(multcompView)

# Išsitraukiame originalų grupių eiliškumą
original_levels <- levels(chickwts$feed)

# Ta pačia tvarka sukuriame tuos pačius pavadinimus iš didžiųjų raidžių:
capitalised_labels <- tools::toTitleCase(original_levels)

# Sukuriame grupių eiliškumą
feed_order <- c("horsebean", "linseed", "soybean", 
                "meatmeal", "sunflower", "casein")

# Pakeičiame eiliškumą ir pakoreguojame pavadinimus
chickwts2 <- chickwts %>%
  mutate(
    feed = factor(feed,
                  levels = feed_order,           # reordering
                  labels = tools::toTitleCase(feed_order))  # renaming
  )

# Atliekame ANOVA
anova_result <- aov(weight ~ feed, data = chickwts2)
anova_summary <- summary(anova_result)
p_value <- anova_summary[[1]][["Pr(>F)"]][1]

# Atliekame Tukey's HSD
tukey_result <- TukeyHSD(anova_result)

# Pasiimame post hoc raidžių duomenis
tukey_letters <- multcompLetters4(anova_result, tukey_result)

# Priskiriame kiekvienai lesalo grupei raidę
letters_df <- data.frame(
  feed = names(tukey_letters$feed$Letters),
  letters = tukey_letters$feed$Letters
)

# Apskaičiuojame max svorį kiekvienoje svorio kategorijoje
# Kad teisingai nustatytume post hoc raidžių vietą
max_weights <- chickwts2 %>%
  group_by(feed) %>%
  summarise(max_weight = max(weight)) %>%
  left_join(letters_df, by = "feed")

# Brėžiame grafiką
p2 <- ggplot(chickwts2, aes(x = feed, y = weight, fill = feed)) +
  geom_boxplot(alpha = 0.9, color = "grey30", linewidth = 0.5) +
  scale_fill_manual(values = c("#5C4B99", "#9AA0FF","#EABFFF", 
                               "#7ED3FF", "#3EA6FF", "#286DA8")) +
  # Pridedame Tukey HSD raides
  geom_text(data = max_weights, 
            aes(x = feed, y = max_weight + 15, label = letters),
            vjust = 0, size = 5, fontface = "bold") +
  labs(
    title = "Chicken Weight by Feed Type (ggplot2 v.2)",
    subtitle = paste0("ANOVA: p ", 
                      ifelse(p_value < 0.001, "< 0.001", 
                             paste("=", round(p_value, 3))),
                      " | Letters indicate differences between groups (Tukey's HSD, p < 0.05)"),
    x = "Feed Type",
    y = "Weight (g)"
  ) +
  theme_bw(base_size = 14) +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    plot.subtitle = element_text(size = 12, color = "grey30"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position
    = "none"
  ) +
  # Išplečiame y ašį, kad tilptų raidės
  scale_y_continuous(limits = c(100,450), breaks = seq(100,450,50)) +
  theme(plot.subtitle=element_text(size=9))
p2

# Išsaugome grafiką su 300 dpi nustatymu
ggsave("chickwts_2.png", p2, 
       width = 6, height = 5, dpi = 300, units = "in")
