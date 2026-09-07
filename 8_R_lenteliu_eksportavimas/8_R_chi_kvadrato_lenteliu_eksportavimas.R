# Naudosime "HairEyeColor" built-in duomenų rinkinį
# Apie jį galite pasiskaityti paleidę šį kodą:
?HairEyeColor

# Pasižiūrime duomenis
HairEyeColor
str(HairEyeColor)
head(HairEyeColor)

# Yra dvi lentelės su dviems lytims su akių ir plaukų spalvos duomenimis
# Sujungiame abiejų lyčių duomenis į kryžminę lentelę
# (norėsime patikrinti tik ryšį tarp akių ir plaukų spalvos)
# Plaukų spalva yra 1-as kintamasis, akių spalva - 2-as.
hair_eye <- margin.table(HairEyeColor, margin = c(1, 2))

# Pasižiūrime kryžminę lentelę
hair_eye

# Atliekame Chi-kvadrato testą
chi_test <- chisq.test(hair_eye)
chi_test

# Pasižiūrime tikėtinus dažnius
chi_test$expected

# ...ir stebėtus dažnius
chi_test$observed

# Suskaičiuojame Cramer's V:
if (!require("lsr")) install.packages("lsr")
library(lsr)
v_hair_eye <- cramersV(hair_eye)
v_hair_eye

###########################################################
# 1. "Rankinis" rezultatų perkėlimams iš konsolės į Excel #
###########################################################
# Įklijuojame į Excel su „Match Destination Formatting.
# Kiekvienos eilutės rezultatai yra viename langelyje.
# Kol pasirinktas pirmas stulpelis, spaudžiame „Data“ -> „Text to Columns“
# Pasirenkame „Delimited“, spaudžiame „Next“ ir padedame varnelę
# prie „Space“. Toliau – „Next“ ir sutinkame.

###################################
# 2. Naudojame write.csv funkciją #
###################################
# (prisiminkite, kur jūsų darbinė direktorija - nusistatykite ją)
getwd()

write.csv(hair_eye, "hair_eye_data.csv", row.names = FALSE)

# Prieš išsaugant Chi-kvadrato testo rezultatus,
# juos reikia perstruktūruoti į lentelę
chi_results <- data.frame(
  Test = chi_test$method,
  Chi_sq_result = chi_test$statistic,
  df = chi_test$parameter,
  p.value = chi_test$p.value
)
write.csv(chi_results, "hair_eye_chi_test.csv", row.names = FALSE)

write.csv(chi_test$expected, "hair_eye_expected.csv", row.names = TRUE)

write.csv(v_hair_eye, "hair_eye_cramers_v.csv", row.names = FALSE)

##################################
# 3. Naudojame "openxlsx" paketą #
##################################
if (!require("openxlsx")) install.packages("openxlsx")
library(openxlsx)

# Perkeliame Chi testo rezultatus į letelę
haireye_results <- data.frame(
  Test = chi_test$method,
  Chi_sq_result = as.numeric(chi_test$statistic),
  df = as.numeric(chi_test$parameter),
  p.value = chi_test$p.value
)

# Stebėti dažniai
observed_df <- data.frame(
  Hair = rownames(chi_test$observed),
  as.data.frame.matrix(chi_test$observed),
  row.names = NULL
)

# Tikėtini dažniai
expected_df <- data.frame(
  Hair = rownames(chi_test$expected),
  as.data.frame.matrix(chi_test$expected),
  row.names = NULL
)

# Sutvarkome Kramerio V duomenis
cramersV_df <- data.frame(
  Coefficient = "Cramer's V",
  Value = as.numeric(v_hair_eye)
)

# Viską įrašome į vieną xlsx dokumentą
write.xlsx(
  list(
    "Chi_sq_result" = haireye_results,
    "Obeserved" = observed_df,
    "Expected" = expected_df,
    "Cramers_V" = cramersV_df
  ),
  file = "hair_eye_chi_results.xlsx"
)

#########################################
# 4. Naudojame "openxlsx" paketą, #######
# bet sukuriame išvaizdesnes lenteles ###
# PRIEŠ NAUDOJANT BŪTINA ATLIKTI 3 DALĮ #
#########################################
library(openxlsx)

# 1. Sukuriame naują dokumentą (darbaknygę)
wb <- createWorkbook()

# 2. Apibrėžiame stilius (spalvos, šriftai, rėmeliai)
# Pagrindinės antraštės stilius
header_style <- createStyle(
  fontName = "Arial",
  fontSize = 11,
  textDecoration = "bold",
  fontColour = "#FFFFFF",
  fgFill = "#03396c",
  halign = "center",
  valign = "center",
  border = "TopBottomLeftRight",
  borderColour = "#000000"
)

# Stulpelių pavadinimų stilius
subheader_style <- createStyle(
  fontName = "Arial",
  fontSize = 10,
  textDecoration = "bold",
  fontColour = "#FFFFFF",
  fgFill = "#005b96",
  halign = "center",
  valign = "center",
  border = "TopBottomLeftRight",
  borderColour = "#000000"
)

# Duomenų langelių stilius
data_style <- createStyle(
  fontName = "Arial",
  fontSize = 10,
  halign = "center",
  valign = "center",
  border = "TopBottomLeftRight",
  borderColour = "#D9D9D9"
)

# Pirmos skilties ("Hair") stilius (sulygiuota kairėje, paryškinta)
first_col_style <- createStyle(
  fontName = "Arial",
  fontSize = 10,
  textDecoration = "bold",
  halign = "left",
  valign = "center",
  border = "TopBottomLeftRight",
  borderColour = "#D9D9D9"
)

# 3. Pridedame puslapius (sheets)
sheets <- c("Chi_sq_result", "Observed", "Expected", "Cramers_V")
for (s in sheets) {
  addWorksheet(wb, s)
  showGridLines(wb, sheet = s, showGridLines = TRUE)
}

# 4. Funkcija stebėtiems ir tikėtiniems dažniams stilizuoti
write_styled_contingency <- function(wb, sheet_name, df, is_expected = FALSE) {
  
  # Tikėtinus dažnius suapvaliname iki 2 skaitmenų po kablelio
  if (is_expected) {
    df[,-1] <- round(df[,-1], 2)
  }
  
  # Įrašome "Eye" antraštę (1 eilutė, 2:5 stulpeliai)
  writeData(wb, sheet = sheet_name, x = "Eye", startCol = 2, startRow = 1)
  mergeCells(wb, sheet = sheet_name, cols = 2:5, rows = 1)
  addStyle(wb, sheet = sheet_name, style = header_style, rows = 1, cols = 2:5, gridExpand = TRUE)
  
  # Įrašome duomenų lentelę nuo 2 eilutės
  writeData(wb, sheet = sheet_name, x = df, startCol = 1, startRow = 2)
  
  # Taikome stilius stulpelių antraštėms (2 eilutė)
  addStyle(wb, sheet = sheet_name, style = subheader_style, rows = 2, cols = 1:5, gridExpand = TRUE)
  
  # Taikome stilius duomenų langeliams (3–6 eilutės)
  addStyle(wb, sheet = sheet_name, style = first_col_style, rows = 3:6, cols = 1, gridExpand = TRUE)
  addStyle(wb, sheet = sheet_name, style = data_style, rows = 3:6, cols = 2:5, gridExpand = TRUE)
  
  # Nustatome stulpelių plotį
  setColWidths(wb, sheet = sheet_name, cols = 1:5, widths = 14)
}

# 5. Įrašome ir stilizuojame stebėtus ir tikėtinus dažnius
write_styled_contingency(wb, "Observed", observed_df)
write_styled_contingency(wb, "Expected", expected_df, is_expected = TRUE)

# 6. Įrašome ir stilizuojame likusias lenteles
# Chi_sq_result
writeData(wb, sheet = "Chi_sq_result", haireye_results)
addStyle(wb, sheet = "Chi_sq_result", style = subheader_style, rows = 1, cols = 1:4, gridExpand = TRUE)
addStyle(wb, sheet = "Chi_sq_result", style = data_style, rows = 2, cols = 1:4, gridExpand = TRUE)
setColWidths(wb, sheet = "Chi_sq_result", cols = 1:4, widths = c(30, 15, 10, 15))

# Cramers_V
writeData(wb, sheet = "Cramers_V", cramersV_df)
addStyle(wb, sheet = "Cramers_V", style = subheader_style, rows = 1, cols = 1:2, gridExpand = TRUE)
addStyle(wb, sheet = "Cramers_V", style = data_style, rows = 2, cols = 1:2, gridExpand = TRUE)
setColWidths(wb, sheet = "Cramers_V", cols = 1:2, widths = 20)

# 7. Išsaugome atnaujintą dokumentą
saveWorkbook(wb, file = "hair_eye_chi_results_v2.xlsx", overwrite = TRUE)