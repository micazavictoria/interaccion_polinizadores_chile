
# Tabla interacciones unicas ----------------------------------------------
# Me ordena los datos y dropea los NA y me ordena toda la base de datos
interacciones <- datos_filtrados %>% 
  filter(!is.na(scientific_name_plants) & !is.na(scientific_name_animals)) %>% 
  select(planta = scientific_name_plants,
         polinizador = scientific_name_animals,
         orden = order_animals,
         familia_planta = family_plants,
         familia_animal = family_animals) %>% 
  count(planta, polinizador, orden, familia_planta, familia_animal, name = "frecuencia")


# Matriz de interacciones -------------------------------------------------

matriz_red <- interacciones %>% 
  select(planta, polinizador, frecuencia) %>% 
  group_by(planta, polinizador) %>%                   
  summarise(frecuencia = sum(frecuencia), .groups = "drop") %>%  
  pivot_wider(names_from = polinizador, 
              values_from = frecuencia, 
              values_fill = 0) %>% 
  column_to_rownames("planta") %>% 
  as.matrix()

# Métricas ----------------------------------------------------------------

## Métricas por especie
# Grado (número de interacciones por especie)

grado_plantas <- rowSums(matriz_red > 0)
grado_polinizadores <- colSums(matriz_red > 0)

# Top 10 plantas más conectadas
sort(grado_plantas, decreasing = TRUE)[1:10]

# Top 10 polinizadores más conectados
sort(grado_polinizadores, decreasing = TRUE)[1:10]

## Métricas por orden
metricas_orden <- interacciones %>% 
  group_by(orden) %>% 
  summarise(
    n_especies = n_distinct(polinizador),
    n_plantas_visitadas = n_distinct(planta),
    total_interacciones = sum(frecuencia),
    interacciones_promedio = mean(frecuencia),
    .groups = "drop"
  ) %>% 
  arrange(desc(total_interacciones))

## Contribución relativa de cada orden a la conectancia 
contribucion_orden <- metricas_orden %>% 
  mutate(
    prop_especies = n_especies / sum(n_especies) * 100,
    prop_interacciones = total_interacciones / sum(total_interacciones) * 100
  )

matriz_transpuesta <- t(matriz_red)

#Red completa 
plotweb(matriz_transpuesta, 
        sorting = "normal",
        higher_color = "darkgreen",       
        lower_color = "darkorange",       
        higher_border = "darkgreen",
        lower_border = "darkorange",
        link_color = "higher",            
        link_alpha = 0.5,                 
        text_size = 0.2,
        spacing = 0.3,
        box_size = 0.1)

# Matriz por Orden --------------------------------------------------------
matriz_orden <- function(orden_seleccionado) {
  mat <- interacciones %>% 
    filter(orden == orden_seleccionado) %>% 
    select(planta, polinizador, frecuencia) %>% 
    group_by(planta, polinizador) %>% 
    summarise(frecuencia = sum(frecuencia), .groups = "drop") %>% 
    pivot_wider(names_from = polinizador, 
                values_from = frecuencia, 
                values_fill = 0) %>% 
    column_to_rownames("planta") %>% 
    as.matrix()
  
  return(t(mat))  # Transponer para bipartite
}


# Hymenoptera
mat_hym <- matriz_orden("Hymenoptera")
plotweb(mat_hym, 
        method="normal", text.rot = 90, 
        labsize =1.5, ybig = 0.68, low.y = 0.8, high.y = 0.98, 
        plot.axes = FALSE, y.width.low = 0.05, y.width.high = 0.05, 
        col.high = "black", bor.col.interaction="black",
        bor.col.high="black", low.spacing=0.03, high.spacing=0.08,
        col.low =  c("#E94B00","#E94B00","#E94B00","#E94B00","#E94B00",
                     "#E94B00","#E94B00","#E94B00","#32AE7C","#32AE7C",
                     "#32AE7C","#32AE7C","#32AE7C","#32AE7C","#32AE7C",
                     "violet","violet"))

mat_lep <- crear_matriz_orden("Lepidoptera")
plotweb(mat_lep)

par(mfrow = c(1, 1))