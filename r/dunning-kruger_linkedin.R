# intent: create a ggplot chart for dunning-kruger effect, someting we are all
# guilty of.

  # In the field of psychology, the Dunning–Kruger effect is a cognitive bias in 
  # which people with low ability at a task overestimate their ability. It is related 
  # to the cognitive bias of illusory superiority and comes from the inability of 
  # people to recognize their lack of ability.


# setup -------------------------------------------------------------------

library(here)

library(ggplot2)
library(ggthemes)
library(dplyr)


# create plot -------------------------------------------------------------

dat <- data.frame(
  x = 0:10,
  y = c(seq(0, 70, 7))
)

plot.out <- dat %>% 
  ggplot(aes(x, y)) +
  geom_line(size = 4.75, color = 'red', alpha = 0.65) +
  geom_point(aes(10,70, color ='red', size = 2.5)) +
  geom_curve(aes(x=10, y=70, xend = 100, yend = 18, color= 'red'), 
             size = 4.75, curvature = 0.1) +
  geom_curve(aes(x=100, y=18, xend = 190, yend = 90, color= 'red'), 
             size = 4.75, curvature = 0.10,
             arrow = arrow(length = unit(0.03, "npc"))) +
  xlim(0,200) +
  ylim(0, 100) +
  theme_solarized() +
  labs(x = "Knowledge",
       y = "Confidence",
       caption = "Special thanks to Dunning, Kruger & over confidence") +
  theme(axis.text=element_blank(),
        axis.title = element_text(size = 32, face= "bold"),
        legend.position = "none",
        plot.caption = element_text(size = 16,
                                    face = "italic",
                                    color = 'red'),
        plot.margin = margin(75, 75, 40, 50))


# save plot ---------------------------------------------------------------

ggsave(here::here("./outputs/dunning-kruger_linkedin.png"),
       width = 32,
       height = 8,
       units = "in")

# I was lazy and added other graphics (outside of R)