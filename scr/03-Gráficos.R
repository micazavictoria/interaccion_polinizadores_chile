
# Abundancia de Interacciones ---------------------------------------------

ggplot(abundancia_interacciones, aes(x = order_animals, y = n_interacciones, fill = order_animals)) +
  geom_col() +
  geom_text(aes(label = n_interacciones), vjust = -0.5, size = 3) +
  scale_fill_manual(values = c("Apodiformes" = "#D5C5D9",
                               "Coleoptera" = "#F2E5D5",
                               "Diptera" = "#E9F2A2",
                               "Hymenoptera" = "#E4F279",
                               "Lepidoptera" = "#F2C572",
                               "Passeriformes" = "#DCBF79")) +
  labs(
    title = "Abundancia de interacciones por orden",
    x = "Orden",
    y = "Número de interacciones"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )

# Riqueza de especies -----------------------------------------------------

ggplot(riqueza, aes(x = order_animals, y = n_especies, fill = order_animals)) +
  geom_col() +
  geom_text(aes(label = n_especies), vjust = -0.5, size = 3) +
  scale_fill_manual(values = c("Apodiformes" = "#D5C5D9",
                               "Coleoptera" = "#F2E5D5",
                               "Diptera" = "#E9F2A2",
                               "Hymenoptera" = "#E4F279",
                               "Lepidoptera" = "#F2C572",
                               "Passeriformes" = "#DCBF79")) +
  labs(
    title = "Riqueza de especies por orden",
    x = "Orden",
    y = "Riqueza"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold")
  )


# Heatmap -----------------------------------------------------------------

HEATMAP <- ggplot(abundancia_regiones, aes(x = order_animals, y = state_province, fill = n_interacciones)) +
  geom_tile(color = "gray", linewidth = 0.5) +
  scale_fill_gradient(low = "white", high = "#F2C572", na.value = "white") +
  labs(
    title = "Abundancia de órdenes por región en Chile",
    x = "Orden",
    y = "Región",
    fill = "N° interacciones"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 90, hjust = 1),
    panel.background = element_rect(fill = "gray95", color = NA)
  )

# Top plantas -------------------------------------------------------------
#Especies de plantas con mayor interaccion
#Seleccionamos el Top 5

top_5_plantas <- Top_plantas %>%
  slice_head(n = 5)

#Grafico
ggplot(top_10_plantas, aes(x = scientific_name_plants, y = n_interacciones, fill = scientific_name_plants)) +
  geom_col() +
  geom_text(aes(label = n_interacciones), vjust = -0.5, size = 3) +
  labs(
    title = "Especies de plantas con mayor interacciones",
    x = "Planta",
    y = "Número de interacciones"
  ) +
  scale_fill_manual(values = c(
    "Alstroemeria ligtu" = "#D5C5D9",
    "Embothrium coccineum" = "#F2E5D5",
    "Eucryphia cordifolia" = "#E4F279",
    "Mimulus luteus" = "#F2C572",
    "Viola portalesia" = "#DCBF79"
  )) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, face = "italic")
  )

# Top insectos ------------------------------------------------------------
#Especies de aniamles con mayor interaccón
#Seleccionamos el Top 5

top_5_aniamles <- Top_aniamles %>%
  slice_head(n = 5)

#Grafico
ggplot(top_5_aniamles, aes(x = scientific_name_animals, y = n_interacciones, fill = scientific_name_animals)) +
  geom_col() +
  geom_text(aes(label = n_interacciones), vjust = -0.5, size = 3) +
  labs(
    title = "Especies de animales con mayor interacciones",
    x = "Animal",
    y = "Número de interacciones"
  ) +
  scale_fill_manual(values = c(
    "Apis mellifera" = "#D5C5D9",
    "Bombus dahlbomii" = "#F2E5D5",
    "Centris nigerrima" = "#E4F279",
    "Scaeva melanostoma" = "#F2C572",
    "Sephanoides sephaniodes" = "#DCBF79"
  )) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5, face = "italic")
  )

