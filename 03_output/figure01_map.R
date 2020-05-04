sk <- get_map(location = "south korea")

data_clusters <- case %>% 
    select(infection_case:longitude) %>% 
    filter(!(latitude == "-")) %>% 
    mutate(latitude = as.numeric(latitude),
           longitude = as.numeric(longitude))

# ggmap(sk, 
#       base_layer = ggplot(aes(x = longitude, y = latitude), 
#                           data = map_clusters)) +
#     geom_point()


map_clusters <- leaflet(data_clusters) %>% 
    addProviderTiles("CartoDB.Voyager") %>% 
    addCircles(lng = ~longitude, lat = ~latitude, radius = ~confirmed,
               label = paste(data_clusters$infection_case, ":",
                             data_clusters$confirmed, "cases"))
map_clusters
