# 4. R t-testas ir Wilcoxon testas (4_R_t_testas_ir_wilcoxon_testas)

Šioje pamokoje susipažinsite su kiekybinių duomenų lyginimo tarp dviejų kategorinių grupių metodais R programoje: nepriklausomais (neporiniais) bei poriniais t-testais ir atitinkamais neparametriniais Wilcoxon testais.

## Video įrašas
Pilną video įrašą rasite [@Biomatika_lt](https://www.youtube.com/@Biomatika_lt) YouTube kanale.

---

## Pamokoje nagrinėjamos temos

* **Neporinis t-testas:**
  * Duomenų pogrupių sukūrimas naudojant `subset()` su R integruotu duomenų rinkiniu `PlantGrowth`.
  * Pradinė duomenų sklaidos, medianų ir kvartilių vizualizacija dėžučių grafikais (`geom_boxplot()` per `ggplot2`).
  * Duomenų normalumo tikrinimas su Shapiro-Wilk (`shapiro.test()`) testu atskiruose pogrupiuose.
  * Dispersijų homogeniškumo tikrinimas su Levene's testu (`leveneTest()`) iš `car` paketo.
  * Neporinio t-testo atlikimas (`t.test(..., paired = FALSE, var.equal = TRUE)`).
  * Welch korekcijos taikymas t-testui (`var.equal = FALSE`), kai dispersijos nėra homogeniškos.
  * Neparametrinio Wilcoxon Rank Sum (Mann-Whitney U) testo taikymas (`wilcox.test(..., paired = FALSE)`), kai duomenys neatitinka normalumo prielaidos.
* **Porinis t-testas:**
  * Porinių duomenų koncepcija naudojant R integruotą duomenų rinkinį `sleep` (pavyzdžiui, tų pačių pacientų, gavusių 2 skirtingus vaistus, miego trukmės matavimai).
  * Duomenų vizualizavimas ir normalumo tikrinimas abiejose grupėse.
  * Porinio t-testo atlikimas (`t.test(..., paired = TRUE)`).
  * Neparametrinio porinio Wilcoxon Signed Rank testo taikymas (`wilcox.test(..., paired = TRUE)`).

---

Pamokoje naudojami R integruoti duomenų rinkiniai `PlantGrowth` ir `sleep`.

---

Jeigu turite klausimų, pastebėjimų ar pasiūlymų – rašykite info@biomatika.lt.
