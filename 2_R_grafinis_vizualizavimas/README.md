# 2. R grafinis vizualizavimas (2_R_grafinis_vizualizavimas)

Šioje pamokoje susipažinsite su duomenų vizualizavimo galimybėmis RStudio programoje: nuo paprastų base R grafikų iki išvaizdesnių vizualizacijų su **ggplot2** paketu.

## Video įrašas
[Pilną video įrašą](https://www.youtube.com/watch?v=XkI3yKukYU4) rasite [@Biomatika_lt](https://www.youtube.com/@Biomatika_lt) YouTube kanale.

---

## Pamokoje nagrinėjamos temos

* **Integruoti duomenų rinkiniai:** Susipažinimas su R integruotais (*built-in*) duomenimis `iris` ir `PlantGrowth` naudojant `View()` bei pagalbos komandą (pvz., `?iris`).
* **Bazinio R vizualizacijos (Base R):**
  * Histogramos (`hist()`) ir jų ašių bei pavadinimų tvarkymas.
  * Stulpelinės diagramos (`barplot()`).
  * Dėžučių grafikai (`boxplot()`) grupių palyginimui.
  * Sklaidos diagramos (`plot()`) su grupavimu pagal spalvas bei legendos pridėjimu (`legend()`).
* **Spalvų nustatymas:** Spalvų pavadinimai, HEX kodai, [R Graph Gallery](https://r-graph-gallery.com/ggplot2-color.html) resursai ir paletės iš [Color-Hex](https://www.color-hex.com/).
* **ggplot2 paketas:**
  * Paketo diegimas (`install.packages("ggplot2")` arba naudojant vartotojo sąsają per *Packages* kortelę) ir užkrovimas (`library(ggplot2)`).
  * Atitinkamų grafikų (histogramų, stulpelinių, dėžučių ir sklaidos diagramų) kūrimas su `ggplot2`.
  * Temų taikymas (pvz., `theme_bw()`) ir estetinių parametrų (pvz., taškų permatomumo `alpha`) valdymas.
* **Grafikų išsaugojimas:**
  * Eksportavimas per RStudio vartotojo sąsają (*Export* mygtuką).
  * Išsaugojimas kodu naudojant `ggsave()`, nustatant tikslius išmatavimus ir aukštą raišką (300 DPI).
* **Naudingi resursai:** [R for Data Science](https://r4ds.hadley.nz/) knyga ir [ggplot2](https://ggplot2.tidyverse.org/) dokumentacija.

---

Pamokoje naudojami R integruoti duomenų rinkiniai `iris` ir `PlantGrowth`.

---

Jeigu turite klausimų, pastebėjimų ar pasiūlymų – rašykite info@biomatika.lt.
