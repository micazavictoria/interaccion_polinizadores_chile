
# Filtrar datos -----------------------------------------------------------
#Filtrar Ordenes de polinizadores
datos_filtrados <- filter(datos, 
                          order_animals %in% c("Hymenoptera", "Diptera", "Lepidoptera", 
                                               "Coleoptera", "Apodiformes", "Passeriformes"),
                          !is.na(state_province))  

#Verificamos que los datos esten correctos 
count(datos_filtrados, order_animals, sort = TRUE)
count(datos_filtrados, state_province, sort = TRUE)


# Explorar datos ----------------------------------------------------------
#Abundancia de interacciones por orden 

abundancia_interacciones <- datos_filtrados %>%
  group_by(order_animals) %>%
  summarise(n_interacciones = n())

#Riqueza de especies por orden

riqueza <- datos_filtrados %>%
  group_by(order_animals) %>%
  summarise(n_distinct(scientific_name_animals))

#Abundancia de ordenes por region

abundancia_regiones <- datos_filtrados %>%
  group_by(state_province) %>%
  summarise(n_interacciones = n())

#Especies de plantas e insectos con mas interacciones

Top_plantas <- datos_filtrados %>%
  filter(!is.na(scientific_name_plants)) %>%
  group_by(scientific_name_plants) %>%
  summarise(n_interacciones = n()) %>%
  arrange(desc(n_interacciones))

Top_insectos <- datos_filtrados %>%
  filter(!is.na(scientific_name_animals)) %>%
  group_by(scientific_name_animals) %>%
  summarise(n_interacciones = n()) %>%
  arrange(desc(n_interacciones))

