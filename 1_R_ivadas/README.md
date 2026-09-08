# 1. R įvadas (1_R_ivadas)

Šioje pamokoje susipažinsite su RStudio programa, pagrindinėmis jos funkcijomis ir pradiniais duomenų analizės žingsniais.

## Video įrašas

Pilną video įrašą rasite [@Biomatika_lt](https://www.youtube.com/@Biomatika_lt) YouTube kanale.

---

## Pamokoje nagrinėjamos temos

* **R ir RStudio įdiegimas bei nustatymai:** Programas rekomenduojama diegti tiesiai į `C:` diską (ne į *Program Files*), atkreipiant dėmesį į *Rtools* versijos atitikimą. Programos išvaizdos ir šrifto nustatymai valdomi per `Tools` -> `Global Options`.
* **RStudio sąsaja:** Source (kodas), Console (rezultatai), Environment (kintamieji/duomenys) ir Plots (grafikai).
* **Bazinės operacijos ir komentarai:** Paprasti matematiniai bei loginiai veiksmai, naudojant `#` komentarams.
* **Darbinė direktorija (Working Directory):** Darbinio aplanko nustatymas per meniu (`Session` -> `Set Working Directory`) arba komandomis `setwd()` ir `getwd()`.
* **Duomenų importavimas (CSV):** `.csv` failų įsikėlimas per GUI arba funkcijas `read.csv()` / `read.csv2()` (atsižvelgiant į .csv reikšmių atskyrimui naudojamą simbolį ir kompiuterio kalbos nustatymus).
* **Aprašomoji statistika:**
  * Duomenų peržiūra: `head()`, `View()`, `summary()`
  * Pagrindiniai rodikliai: `mean()`, `median()`, `sd()`, `min()`, `max()`
* **Duomenų vizualizacija ir normalumo tikrinimas:**
  * Histogramų (`hist()`) ir Q-Q grafikų (`qqnorm()`, `qqline()`) braižymas.
  * Shapiro-Wilk normalumo testas (`shapiro.test()`).
* **Grafikų išsaugojimas:** Eksportavimas per RStudio vartotojo sąsają (*Export* mygtuką).

---

Pamokoje naudojami duomenų rinkiniai `zuvu_ilgis_1.csv` ir `zuvu_ilgis_2.csv`.

---

Jeigu turite klausimų, pastebėjimų ar pasiūlymų – rašykite info@biomatika.lt.
