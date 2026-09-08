# 7. R Chi-kvadrato testas (7_R_chi_kvadrato_testas)

Šioje pamokoje susipažinsite su Chi-kvadrato ($\chi^2$) testu RStudio programoje: sužinosite, kaip analizuoti kategorinius duomenis, sukurti kryžminę lentelę, skaičiuoti dažnius bei proporcijas, vertinti ryšio stiprumą naudojant Kramerio V (Cramér's V) koeficientą ir vizualizuoti rezultatus.

## Video įrašas
[Pilną video įrašą](https://www.youtube.com/watch?v=cBZCdPn9rRU&t=4s) rasite [@Biomatika_lt](https://www.youtube.com/@Biomatika_lt) YouTube kanale.

---

## Pamokoje nagrinėjamos temos

* **Duomenų apžvalga ir paruošimas:**
  * R integruoto duomenų rinkinio `HairEyeColor` apžvalga (592 studentų plaukų, akių spalvos ir lyties duomenys).
  * Duomenų struktūros tikrinimas su `str()` ir pirmų eilučių peržiūra su `head()`.
  * Kryžminių lentelių (*contingency tables*) sujungimas bei dažnių ir proporcijų skaičiavimas naudojant `prop.table()` (su `margin = 1` proporcijoms pagal eilutes).
* **Duomenų vizualizacija:**
  * Duomenų konvertavimas į `data.frame` ir plaukų spalvų eiliškumo sureguliavimas.
  * Stulpelinių diagramų braižymas su `ggplot2` kategoriniams dažniams atvaizduoti.
* **Chi-kvadrato testo atlikimas ir prielaidos:**
  * Testo atlikimas naudojant `chisq.test()`.
  * Stebėtų (*observed*) ir tikėtinų (*expected*) dažnių tikrinimas (prielaida: visi tikėtini dažniai turi būti $> 5$).
* **Ryšio stiprumo vertinimas (Cramér's V):**
  * Kramerio V koeficiento skaičiavimas formulės pagalba arba naudojant `lsr` paketą (`cramersV()`).
  * Rezultatų interpretacija (pvz., vidutinio stiprumo ryšys tarp plaukų ir akių spalvos vs. silpnas ryšys tarp lyties ir plaukų spalvos).

---

Pamokoje naudojamas R integruotas duomenų rinkinys `HairEyeColor`.

---

Jeigu turite klausimų, pastebėjimų ar pasiūlymų – rašykite info@biomatika.lt.
