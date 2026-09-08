# 3. R koreliacinė analizė (3_R_koreliacine_analize)

Šioje pamokoje susipažinsite su koreliacine analize RStudio programoje: sužinosite, kada taikyti Pearson ir Spearman testus, kaip teisingai išskirti duomenų grupes bei kaip sukurti ir vizualizuoti koreliacijų matricas.

## Video įrašas
[Pilną video įrašą](https://www.youtube.com/watch?v=32owcln8OKo&t=70s) rasite [@Biomatika_lt](https://www.youtube.com/@Biomatika_lt) YouTube kanale.

---

## Pamokoje nagrinėjamos temos

* **Duomenų normalumo tikrinimas ir testo pasirinkimas:** Normalumo patikrinimas naudojant Shapiro-Wilk (`shapiro.test()`) testą. Jei duomenys pasiskirstę normaliai, taikomas Pearsono testas, jei ne – Spearmano koreliacijos testas (`cor.test()`).
* **Grupių atskyrimo svarba:** Kodėl prieš analizę norint gauti tikslius rezultatus būtina išskirstyti duomenų grupes (pvz., `iris` rūšis naudojant `subset()`), o ne palikti visus duomenis vienoje krūvoje.
* **Rezultatų vizualizacija per ggplot2:** Atskirų ir bendrų sklaidos diagramų kūrimas su `ggplot2` bei `dplyr` paketais, atvaizduojant koreliacijos koeficientus (r / rho) bei p-reikšmes.
* **Koreliacijų matricos kūrimas:** Kelių kintamųjų tarpusavio ryšių analizė naudojant `mtcars` duomenų rinkinį.
* **Rezultatų eksportavimas:** Koreliacijos koeficientų (r / rho) ir p-reikšmių lentelių suapvalinimas bei išsaugojimas į CSV/Excel failus naudojant `write.csv()` arba `write.csv2()`.
* **Koreliacijų matricos vizualizacija:** Matricos braižymas naudojant `corrplot` paketą, pašalinant statistiškai nereikšmingus ryšius, koreliacijos įstrižainę bei pritaikant teksto spalvas geresniam matomumui.

---

Pamokoje naudojami R integruoti duomenų rinkiniai `iris` ir `mtcars`.

---

Jeigu turite klausimų, pastebėjimų ar pasiūlymų – rašykite info@biomatika.lt.
