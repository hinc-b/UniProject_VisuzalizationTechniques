# LIBRARIES
library(ggplot2)
library(sf)
library(rgdal)
library(RColorBrewer)
library(tmap)
library(rmapshaper)

# MAP
mapa <- readOGR(dsn = "file path/graph 3",
                       layer = "Wojewodztwa",
                       encoding = "UTF-8")

mapa <- as(mapa, "sf") # file format change

# Generalization of boundaries
mapa <- ms_simplify(input = mapa, 
                            keep = 0.9,
                            keep_shapes = T,
                            weighting = 0.9)

# Change of names of voivodships
mapa$JPT_NAZWA_ <- c("Lodzkie", "Lubelskie", "Lubuskie", "Mazowieckie", "Malopolskie", "Slaskie", "Swietokrzyskie",
                     "Opolskie", "Dolnoslaskie", "Podkarpackie", "Pomorskie", "Podlaskie", "Kujawsko-pomorskie", 
                     "Zachodniopomorskie",  "Warminsko-Mazurskie", "Wielkopolskie")

# DATA ADDING - Agricultural use in % of the area
library(readxl)
ROLN <- read_excel("ROLN.xlsx")

mapa$uz_rol <- ROLN$uz_rol # assigning a characteristic to a map

hist(mapa$uz_rol, 3) # best breaks each 5

# CARTOGRAM EDIT
ggplot() +
  geom_sf(data = mapa,
          aes(fill = uz_rol)) +
  
  scale_fill_distiller(name = "Agricultural farmland", breaks = c(75, 80, 85, 90, 95), limits = c(75, 95),
                       guide = guide_legend(keyheight = unit(3, units = "mm"), keywidth =  unit(12, units = "mm"),
                                            label.position = "bottom", title.position = "top", nrow = 1),
                       palette = "YlOrBr", direction = 1) +
  
  geom_sf_label(data = mapa[mapa$uz_rol > 70, ],
                aes(label = uz_rol),
                hjust = 0.5,
                nudge_x = 800) +
  
  labs(
    title = "Land Use in Poland in 2010", 
    subtitle = "Agricultural land area in % of the area",
    caption = "Datasource: GUS") +
  
  theme_void() +
  
  theme(
    plot.title = element_text(face = "bold", size = 15, hjust = 0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.4, l = 2, unit = "cm")),
    plot.subtitle = element_text(size = 10, hjust = 0.01, color = "#4e4d47", margin = margin(b = -0.1, t = 0.43, l = 2, unit = "cm")),
    plot.caption = element_text(size = 8, color = "#4e4d47", margin = margin(b = 0.3, r = -99, unit = "cm") ),
    legend.box.background = element_rect(),
    legend.box.margin = margin(6, 6, 6, 6),
    legend.text = element_text(face = "bold", color = "#4e4d47", size = 8),
    legend.title = element_text(color = "#4e4d47", size = 10, hjust = -2),
  ) +
  
  guides(fill = guide_legend(reverse = F))
