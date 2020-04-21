library(ggmap)
library(leaflet)

register_google(key = "AIzaSyD0d-tYL6TgE4CPFHNzw_AlRg90J49-_Hc", write = TRUE)

sk <- get_map(location = "south korea")

map_clusters <- case %>% 
    select(infection_case:longitude) %>% 
    filter(!(latitude == "-")) %>% 
    mutate(latitude = as.numeric(latitude),
           longitude = as.numeric(longitude))

ggmap(sk, 
      base_layer = ggplot(aes(x = longitude, y = latitude), 
                          data = map_clusters)) +
    geom_point()


leaflet() %>% 
    addTiles() %>% 
    addMarkers(lng = map_clusters$longitude, lat = map_clusters$latitude,
               label = map_clusters$infection_case)
