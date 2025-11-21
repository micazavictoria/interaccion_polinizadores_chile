# Primero determinamos la paleta de colores 

colores_ordenes <- c(
  "Diptera"      = "#7E549E",  
  "Hymenoptera"  = "#C36B85",  
  "Coleoptera"   = "#FB938F",  
  "Lepidoptera"  = "#FDBB75"   
)

# Interacciones por orden -------------------------------------------------

ggplot(diversidad_orden,
       aes(x = reorder(order_animals, -n_interacciones),
           y = n_interacciones,
           fill = order_animals)) +
  geom_col(width = 0.9, color = "white", linewidth = 1) +
  geom_text(aes(label = n_interacciones),
            vjust = -0.5, size = 4) +
  scale_fill_manual(values = colores_ordenes) +
  labs(
    title = "Número de interacciones por orden",
    subtitle = "Interacciones registradas en Los Ríos y Los Lagos",
    x = "Órdenes",
    y = "N° de interacciones"
  ) +
  theme_minimal(base_size = 11) +
  theme(
    legend.position = "none",
    plot.title = element_text(face = "bold", size = 20, hjust = 0.5),
    plot.subtitle = element_text(size = 15, hjust = 0.5, colour = "grey40", family = "mono"),
    axis.title = element_text(face = "bold", size = 15),
    axis.text = element_text(colour = "grey20", size = 13)
  )

# Riqueza por orden -------------------------------------------------------

ggplot(diversidad_orden,
       aes(x = reorder(order_animals, -n_especies),
           y = n_especies,
           fill = order_animals)) +
  geom_col(width = 0.9, color = "white", linewidth = 1) +
  geom_text(aes(label = n_especies),
            vjust = -0.5, size = 4) +
  scale_fill_manual(values = colores_ordenes) +
  labs(
    title = "Riqueza de especies por orden",
    subtitle = "Riqueza registradas en Los Ríos y Los Lagos",
    x = "Órdenes",
    y = "Riqueza"
  ) +
  theme_minimal(base_size = 11) +
  theme(
    legend.position = "none",
    plot.title = element_text(face = "bold", size = 20, hjust = 0.5),
    plot.subtitle = element_text(size = 15, hjust = 0.5, colour = "grey40", family = "mono"),
    axis.title = element_text(face = "bold", size = 15),
    axis.text = element_text(colour = "grey20", size = 13),
  )

