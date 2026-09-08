# 6. R Dviejų veiksnių ANOVA (6_R_2_veiksniu_ANOVA)

Šioje pamokoje susipažinsite su dviejų veiksnių dispersine analize (*Two-Way ANOVA*) RStudio programoje: sužinosite, kaip įvertinti dviejų nepriklausomų kintamųjų poveikį bei jų tarpusavio sąveikos (*interaction*) priklausomam kintamajam.

## Video įrašas
[Pilną video įrašą](https://www.youtube.com/watch?v=KVfL8Gi7tYc) rasite [@Biomatika_lt](https://www.youtube.com/@Biomatika_lt) YouTube kanale.

---

## Pamokoje nagrinėjamos temos

* **Duomenų struktūra ir tvarkymas:**
  * R integruoto duomenų rinkinio `ToothGrowth` apžvalga (jūrų kiaulyčių odontoblastų ilgio tyrimas pagal vitamino C papildo tipą ir dozę).
  * Duomenų kintamųjų tipų tikrinimas su `str()`.
  * Skaitinio kintamojo (`dose`) perkodavimas į faktorių (`as.factor()`), pakeičiant reikšmes patogesniais lygiais (pvz., `D0.5`, `D1`, `D2`).
* **Aprašomoji statistika ir vizualizacija:**
  * Imčių dydžių, vidurkių ir standartinių nuokrypių skaičiavimas naudojant `dplyr` paketą.
  * Grupuotų dėžučių grafikų (*boxplots*) kūrimas su `ggplot2`.
  * Linijinių diagramų (*line plots*) su standartinės pakolos ūseliais (*standard error*) braižymas ir sąveikos vizualus vertinimas (linijų susikirtimas).
* **Dviejų veiksnių ANOVA atlikimas:**
  * Modelio sudarymas ir sąveikos vertinimas su `aov()` funkcija (pvz., `len ~ supp * dose`).
  * Atskirų veiksnių (*main effects*) ir jų sąveikos (*interaction*) statistinio reikšmingumo interpretacija pagal p-reikšmes.
* **Modelio prielaidų tikrinimas:**
  * Modelio liekanų (*residuals*) ištraukimas.
  * Liekanų normalumo tikrinimas Shapiro-Wilk testu (`shapiro.test()`).

---

Pamokoje naudojamas R integruotas duomenų rinkinys `ToothGrowth`.

---

Jeigu turite klausimų, pastebėjimų ar pasiūlymų – rašykite info@biomatika.lt.
