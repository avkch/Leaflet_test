library(leaflet)

# reading the row data from the dataset
HiltonsLondon <- read.csv("https://raw.githubusercontent.com/avkch/Leaflet_test/master/HiltonsLondon.csv", header = FALSE)
# makes new data.frame with only the data that will be used.
hiltons <- HiltonsLondon[,c(1, 2, 8, 10, 11)] 
# put names to the columns
colnames(hiltons) <- c("ID", "name", "webaddress", "lat", "long")
# adds new column "pop" with the html code for the links
hiltons$pop <- paste0("<a href='",hiltons$webaddress, "'>", hiltons$name, "</a>")

# makes leaflet map
map <- leaflet() %>% 
    addTiles() %>%
    addMarkers(lng = hiltons$long, lat = hiltons$lat, popup=hiltons$pop, clusterOptions = markerClusterOptions())
map
