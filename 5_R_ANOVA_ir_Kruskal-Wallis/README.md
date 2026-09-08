# 5. R ANOVA ir Kruskal-Wallis (5_R_ANOVA_ir_Kruskal-Wallis)

Šioje pamokoje susipažinsite su kiekybinių duomenų lyginimo tarp ≥3 kategorinių grupių metodais RStudio programoje: dispersine analize (ANOVA), jos neparametriniu atitikmeniu Kruskal-Wallis testu, post-hoc testais bei rezultatų atvaizdavimu grafikuose su raidiniu reikšmingai besiskiriančių grupių kodavimu (*compact letter display (CLD)*).

## Video įrašas
[Pilną video įrašą](https://www.youtube.com/watch?v=zf8hfBXnnE8) rasite [@Biomatika_lt](https://www.youtube.com/@Biomatika_lt) YouTube kanale.

---

## Pamokoje nagrinėjamos temos

* **Duomenų apžvalga:** Susipažinimas su R integruotu duomenų rinkiniu `chickwts` naudojant `head()`, `View()` bei grupių lygių tikrinimą su `levels()`.
* **ANOVA ir jos prielaidos:**
  * Dispersinės analizės atlikimas (`aov()`).
  * Modelio liekanų (*residuals*) normalumo tikrinimas su Shapiro-Wilk testu (`shapiro.test()`).
  * Dispersijų homogeniškumo tikrinimas su Levene's testu (`leveneTest()`) iš `car` paketo.
  * Welch korekcijos taikymas ANOVAi (`oneway.test()`), kai dispersijos nėra homogeniškos.
* **Post-hoc testai po ANOVA:**
  * Poriniai lyginimai su Tukey's HSD testu (`TukeyHSD()`).
  * Reikšmingai besiskiriančių grupių kodavimas raidėmis (*CLD*) naudojant `agricolae` paketą (`HSD.test()`).
* **Kruskal-Wallis testas ir post-hoc analizė:**
  * Neparametrinis grupių lyginimas su `kruskal.test()`, kai netenkinama normalumo prielaida.
  * Dunn's post-hoc testas su `dunnTest()` iš `FSA` paketo.
  * Reikšmingai besiskiriančių grupių kodavimas raidėmis naudojant `rcompanion` paketą (`cldList()`).
* **Pažangus grafikų kūrimas ir išsaugojimas:**
  * Dėžučių grafikų (`ggplot2`) patobulinimas: grupių išrikiavimas pagal medianą, pavadinimų perrašymas iš didžiųjų raidžių su `dplyr`.
  * Post-hoc testų rezultatų raidžių (CLD) atvaizdavimas tiesiai ant grafiko.
  * Grafiko išsaugojimas į darbinę direktoriją aukšta raiška naudojant `ggsave()`.

---

Pamokoje naudojamas R integruotas duomenų rinkinys `chickwts`.

---

Jeigu turite klausimų, pastebėjimų ar pasiūlymų – rašykite info@biomatika.lt.
