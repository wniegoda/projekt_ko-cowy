# 27.11.2024
library(tidyverse)
library(readxl)

# Wczytanie danych
ramka <- readxl::read_excel("R/data/dane_do_R.xlsx", sheet = "Arkusz1")

ramka <-  dplyr::rename(ramka, wklady_neo = `Wkłady neo`)

ramka <- dplyr::rename(ramka, dystans_w_metrach = `Dystans w metrach`)

ramka <- dplyr::rename(ramka, litry_wody = `Litry wody`)

ramka <- dplyr::rename(ramka, dzien = `Dzień`)

# Zmiana nazw z male na wielkie
ramka_2 <- dplyr::rename_with(ramka, .cols = everything(), \(i) toupper(i))

# Zmiana nazw z male na wielkie
ramka_3 <- dplyr::rename_with(ramka, .cols = dplyr::contains("_w_"), \(i) toupper(i))

# Operacje na kolumanch
ramka$kolumna5 <- ramka[, 3] / ramka[, 4]

# Operacje na kolumach mutate
ramka_4 <- dplyr::mutate(ramka, wynik_dzielenia = dystans_w_metrach / litry_wody, wynik_dodawania = dystans_w_metrach + 1)

# Operacje na kolumach mutate
ramka_5 <- dplyr::mutate(ramka, dystans_w_metrach - 10)

# Operacje na kolumach mutate
ramka_6 <- dplyr::mutate(ramka, dystans_w_metrach - 10, .keep = "none")

# przesuniecie kolumn
ramka_7 <- dplyr::relocate(ramka_5, dystans_w_metrach, .before = 1)
ramka_7 <- dplyr::relocate(ramka_5, dystans_w_metrach, .after = dzien)



