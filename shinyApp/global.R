library(tidyverse)
library(ggthemes)
library(ggmap)
library(htmlwidgets)
library(plotly)

# read data
df = read_csv('../data/Historical_Tropical_Storm_Tracks.csv')

# Slider properties
SLIDER_MIN_VALUE <- 0
SLIDER_MAX_VALUE <- 100
SLIDER_INIT_VALUE <- 25