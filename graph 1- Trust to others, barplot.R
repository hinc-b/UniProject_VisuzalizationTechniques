# DATA
data <- data.frame(
  name = c("DS 2011", "ESS 2012", "DS 2013", "ESS 2014", "DS 2015"),
  number = c(13.4, 18, 12.2, 16, 15.2)
)

# BARPLOT
bar <- barplot(data$number, border = F, names.arg = data$name,
               las = 1,
               col = c(rgb(0.3,0.1,0.4,0.6) , rgb(0.3,0.5,0.4,0.6)) , 
               ylim = c(0,20), 
               main = "Percentage of people aged 16 and more who trust other people, in Poland",
               width = c(0.4,0.4,0.4,0.4,0.4))

# Barplot TEXT 
text(bar, 7, paste(data$number), cex = 1, pos = 3) 

# LEGEND
legend("topright", legend = c("Diagnoza Spoleczna - DS","European Social Survey - ESS"), 
       col = c(rgb(0.3,0.1,0.4,0.6), rgb(0.3,0.5,0.4,0.6)), 
       bty = "n", pch = 20 , pt.cex = 2, cex = 0.8, horiz = FALSE, inset = c(0.02, 0.0))


