
# Abundancia de Interacciones ---------------------------------------------

ggplot(abundancia_interacciones, aes(x = order_animals, y = n_interacciones, fill = order_animals)) +
  geom_col() +
  geom_text(aes(label = n_interacciones), vjust = -0.5, size = 3) +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Abundancia de interacciones por orden",
    x = "Orden",
    y = "Número de interacciones"
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, size = 13, face = "bold")
  )