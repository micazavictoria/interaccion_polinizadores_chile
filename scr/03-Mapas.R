
# Librerias Mapas ---------------------------------------------------------
library(rnaturalearth)
library(rnaturalearthdata)
library(sf)


# Datos Mapas -------------------------------------------------------------

chile <- ne_states(country = "chile", returnclass = "sf")

mapa_abundancia <- chile %>%
  left_join(abundancia_regiones_total, by = c("name" = "state_province"))


# Mapa General ------------------------------------------------------------
#Abundancia total de interacciones
ABUN_TOTAL <- ggplot(mapa_abundancia) +
  geom_sf(aes(fill = n_interacciones), color = "black", size = 0.3) +
  scale_fill_gradient(low = "white", high = "purple", na.value = "gray90") +
  coord_sf(xlim = c(-76, -66), ylim = c(-56, -17)) +
  labs(
    title = "Abundancia total por región",
    fill = "N° interacciones"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank()
  )
print(ABUN_TOTAL)


# Mapa ordenes ------------------------------------------------------------

mapa_por_orden <- chile %>%
  right_join(abundancia_regiones, by = c("name" = "state_province"))

MAPA_ORDENES <- ggplot(mapa_por_orden) +
  geom_sf(aes(fill = n_interacciones), color = "black", size = 0.2) +
  scale_fill_gradient(low = "white", high = "purple", na.value = "gray90") +
  coord_sf(xlim = c(-76, -66), ylim = c(-56, -17)) +
  facet_wrap(~ order_animals, ncol = 3) +
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank()
  )

print(MAPA_ORDENES)

