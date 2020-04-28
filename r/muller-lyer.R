library(ggplot2)
library(ggthemes)

main_line <- -10:10

end_flares<- tibble::tibble(
  col1_x = -2:2,
  col2_x = 8:12,
  col3_x = 18:22,
  top_arrow  = c(8,9,10,9,8),
  bottom_arrow = -top_arrow,
  top_v = c(12,11,10,11,12),
  bottom_v = -top_v
)


plot.out <- ggplot() +
  geom_line(aes(x = 0, y = main_line)) +
  geom_line(aes(x = col1_x, y = top_v), data = end_flares) +
  geom_line(aes(x = col1_x, y = bottom_arrow), data = end_flares) +
  geom_line(aes(x = 10, y = main_line)) +
  geom_line(aes(x = col2_x, y = top_v), data = end_flares) +
  geom_line(aes(x = col2_x, y = bottom_v), data = end_flares) +
  geom_line(aes(x = 20, y = main_line)) +
  geom_line(aes(x = col3_x, y = top_arrow), data = end_flares) +
  geom_line(aes(x = col3_x, y = bottom_arrow), data = end_flares) +
  geom_line(aes(x = 0:20, y = 10), size = 1.0, linetype = 'dotted', alpha = 0.25) +
  geom_line(aes(x = 0:20, y = -10), size = 1.0, linetype = 'dotted', alpha = 0.25) +
  update_geom_defaults("line", list(size = 4.75, color = "#04b8a6")) +
  xlim(-5, 25) +
  ylim(-14, 14) +
  theme_solarized() +
  labs(x = NULL,
       y = NULL,
       caption = "Courtesy of Muller-Lyer & automatic processing") +
  theme(plot.caption = element_text(color = "#04b8a6", size = 16, face = "italic",), 
        axis.text=element_blank(),
        legend.position = "none",
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  coord_flip()


ggsave("./outputs/muller-lyer_wallart.png",
       width = 32,
       height = 12,
       units = "in")

