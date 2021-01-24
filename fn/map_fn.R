mapping_region <- function(dt_file, region_fliter) {
  
  dt_file %>% 
    mutate(prop = round(prop*100, digits = 0), 
           province = paste0(Adm1Name, ", (", prop, "%)")) %>% 
    filter(region == region_fliter) %>%
    tm_shape() + tm_polygons(col = "prop", title = "% of GS batt",
                             lwd = 0.5, 
                             textNA = "None",
                             colorNA = "grey94",
                             border.col = "black", palette = "Blues") +
    tm_text("province", size = "AREA", col = "black") +
    tm_layout(frame = F,
              outer.margins = 0,
              legend.title.size = 1,
              legend.text.size = 0.8,
              legend.position = c("LEFT", "BOTTOM"))

}