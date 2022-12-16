library(clifro)
library(openair)
library(ggplot2)


data = read.csv('all_wind.csv')


with(data,windrose(n_directions=36,speed,dir,speed_cuts = c(4,6,8,10,12,14), ggtheme = "bw",col_pal='Spectral'))

windRose(data,ws="speed",wd="dir",
         breaks=c(0,4,6,8,10,12,14),
         auto.text=FALSE,
         paddle=FALSE,
         angle=10,
         annotate=TRUE,
         grid.line=1,
         key.footer = "Wind Speed (m/s)",
         key.position="bottom",
         par.settings=list(axis.line=list(col='lightgray')),
         key = list(labels=c("[0,4]","(4,6]","(6,8]","(8,10]","(10,12]","(12,14]","(14,25]"))
         )
