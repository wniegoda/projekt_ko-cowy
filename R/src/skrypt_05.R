# Paczka
library(tidyverse)
pingwiny <-  palmerpenguins::penguins

# test_potokowania
# 1. stworzyc wektor 2 policzyc sume skumulowana 3 policzyc srednia
# Nadpisywanie kolejnymik wartościami
dane_nadpisane <- c(6, 7, 8, 9)

dane_nadpisane <- cumsum(dane_nadpisane)

dane_nadpisane <- mean(dane_nadpisane)

# zapis z zagniezdzona funkcja
dane_funkcja <- mean(cumsum(c(6, 7, 8, 9)))

# zapis z uzyciem potokowania ("pipem")
dane_potokowane <- c(6, 7, 8, 9) |>
  # komentarz
  cumsum() |>
  # komentarz 2
  mean()

# tidry ####
data <- iris

# zmiana formatu long na wide
l_2_w <- data |>
  tidyr::pivot_wider(names_from = Species, values_from = Sepal.Length:Petal.Width)

#zamiana formatu long na wide
#pingwiny_wide <-  pingwiny |>
 # tidyr::drop_na(bill_length_mm)
  # zmiana firmatu na "szerszy"
  #tidyr::pivot_wider(names_from = )

pingwiny <- pingwiny |>
  dplyr::mutate(id = 1:length(year))

# zmiana formatu wide na long
pingwiny_longer <- pingwiny |>
tidyr::pivot_longer(bill_length_mm:body_mass_g, names_to = "zmienna", values_to = "wartosci",)

# wykres
ggplot2::ggplot(pingwiny_longer, aes(year, wartosci, color = species)) +
geom_point()
facet_wrap(vars(zmienna))

# do szerokiego
pingwiny_wider <- pingwiny_longer |>
# zmiana formatu ramki
  tidyr::pivot_wider(names_from = zmienna, values_from = wartosci)

# Jonis ( operacje na wielu ramkach) ####
# Podział na płeć
pingwiny_m <- pingwiny |>
  # Wybór samców
  dplyr::filter(sex == "male")

#wybór samic
pingwiny_s <- pingwiny |>
  dplyr::filter(!sex == "male")

# laczenie wierszy - bind rows
pingwiny_m_s <- dplyr::bind_rows(pingwiny_m, pingwiny_s)

# podział kolumn
pingwiny_1 <- pingwiny |>
  dplyr::select(species:body_mass_g)

pingwiny_2 <- pingwiny |>
  dplyr::select(-c(species:body_mass_g))

# łączenihe kolumn - bind cols
pingwiny_1_2 <- dplyr::bind_cols(pingwiny_1, pingwiny_2)
