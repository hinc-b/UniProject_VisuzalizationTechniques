# CHART
ggplot(data = mpg, mapping = aes(cty, hwy, col = as.factor(cyl))) +
  
  geom_point(size = 2, show.legend = T) +
  scale_color_brewer(palette = "Spectral") +
  xlim(7,35) +
  
  labs(title = "Relationship between fuel consumption in the city and the route",
       x = "Mile/galon - city",
       y = "Mile/galon - outside the city",
       col = "Number of cylinders") +
  
  theme(legend.position = "right", 
        legend.title = element_text(size = 10),
        plot.title = element_text(size = 18),
        axis.line = element_line(size = 3, colour = "grey80"),
        legend.box.background = element_rect(),
        legend.box.margin = margin(6, 6, 6, 6))
