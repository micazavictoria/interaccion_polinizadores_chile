
# Librerías ---------------------------------------------------------------
#Aca poner todas las liberiras que vaya usando

library(tidyverse) #Visualizacion de datos
library(janitor)  #Lipimar nombres de columnas
library(ggplot2)
library(patchwork)

# Datos obetenidos de: https://github.com/fonturbel-lab/pollination_catalogue

# Cargar datos ------------------------------------------------------------
datos<- read_delim("dataset/pollination_catalogue.csv", delim = ";")

datos <- datos %>% 
  clean_names() #Deja los datos nombrados igual asi es mas facil trabajar despues


