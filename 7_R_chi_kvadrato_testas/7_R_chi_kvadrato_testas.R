#####################
# Pirmasis pavyzdys #
#####################

# Naudosime "HairEyeColor" built-in duomenų rinkinį
# Apie jį galite pasiskaityti paleidę šį kodą:
?HairEyeColor

# Užkrauname HairEyeColor duomenų rinkinį
data(HairEyeColor)

# Pasižiūrime duomenis
HairEyeColor
str(HairEyeColor)
head(HairEyeColor)

# Yra 2 lentelės su 2 lytimis ir akių bei plaukų spalvos duomenimis
# sujungiame abiejų lyčių duomenis į kryžminę lentelę
# (norėsime patikrinti tik ryšį tarp akių ir plaukų spalvos)
hair_eye <- margin.table(HairEyeColor, margin = c(1, 2))

# Pasižiūrime kryžminę lentelę
hair_eye

# Suskaičiuojame proporcijas
prop.table(hair_eye)

# Suskaičiuojame proporcijas pagal plaukų spalvą (eilutės)
# sužinome, kokia akių spalva dažniausia kiekvienai plaukų spalvai
prop.table(hair_eye, margin = 1)

# Duomenų vizualizacija
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

# Konvertuojame duomenis į dataframe
df_hair_eye <- as.data.frame(hair_eye)

# Pakeičiame spalvų eiliškumą, kad diagrama būtų tvarkingesnė
df_hair_eye$Hair <- factor(df_hair_eye$Hair, levels = c("Black", "Brown", "Red", "Blond"))

# Brėžiame stulpelinę diagramą
ggplot(df_hair_eye, aes(x = Eye, y = Freq, fill = Hair)) +
  geom_col(
    position = position_dodge(preserve = "single"),
    color = "#2D201A",
    linewidth = 0.4
  ) +
  scale_fill_manual(
    values = c(
      "Black" = "#2B2220",
      "Brown" = "#6E473B",
      "Red"   = "#B85B43",
      "Blond" = "#E8C872"
    ),
    name = "Hair Colour"
  ) +
  labs(
    title = "Distribution of Hair Colour by Eye Colour",
    x = "Eye Colour",
    y = "Counts"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid.major.x = element_blank(),
    legend.position = "right"
  )

# Atliekame Chi-kvadrato testą
chi_test <- chisq.test(hair_eye)
chi_test

# Pasižiūrime tikėtinus dažnius
chi_test$expected

# ...ir stebėtus dažnius
chi_test$observed

# Patikriname ar rezultatai patikimi
# tikėtini dažniai turi būti >=5
chi_test$expected >= 5

# Skaičiuojame Kramerio V koeficientą "rankiniu" būdu:
cramers_v_eye <- sqrt(chi_test$statistic / 
                        (sum(hair_eye) * (min(dim(hair_eye)) - 1)))

cramers_v_eye

# Panaudojame komandą suskaičiuoti Cramer's V:
if (!require("lsr")) install.packages("lsr")
library(lsr)
cramersV(hair_eye)

#####################
# Antrasis pavyzdys #
#####################

# Naudojame tą patį HairEyeColor duomenų rinkinį,
# tik patikrinsime sąsają tarp lyties ir plaukų spalvos
hair_MF <- margin.table(HairEyeColor, margin = c(1, 3))
hair_MF

# Paskaičiuojame proporcijas
prop.table(hair_MF, margin = 1)

# Paverčiame lentelę į data frame
df_hair_MF <- as.data.frame(hair_MF)

# Sutvarkome plaukų spalvų eiliškumą
df_hair_MF$Hair <- factor(df_hair_MF$Hair, levels = c("Black", "Brown", "Red", "Blond"))

# Brėžiame stulpelinę diagramą
ggplot(df_hair_MF, aes(x = Sex, y = Freq, fill = Hair)) +
  geom_col(
    position = position_dodge(preserve = "single"),
    color = "#2D201A",
    linewidth = 0.4
  ) +
  scale_fill_manual(
    values = c(
      "Black" = "#2B2220",
      "Brown" = "#6E473B",
      "Red"   = "#B85B43",
      "Blond" = "#E8C872"
    ),
    name = "Hair Colour"
  ) +
  labs(
    title = "Distribution of Hair Colour by Sex",
    x = "Sex",
    y = "Count"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid.major.x = element_blank(),
    legend.position = "right"
  )

# Chi-kvadrato testas
chi_MF <- chisq.test(hair_MF)
chi_MF

# Pasižiūrime tikėtinus dažnius
chi_MF$expected

# ...ir stebėtus dažnius
chi_MF$observed

# Patikriname ar rezultatai patikimi
# Tikėtini dažniai turi būti >=5
chi_MF$expected >= 5

# Kramerio V koeficientas
# Rankiniu būdu...
cramers_v_MF <- sqrt(chi_MF$statistic / 
                        (sum(hair_MF) * (min(dim(hair_MF)) - 1)))
cramers_v_MF

# ...Ir naudojant komandą
cramersV(hair_MF)
