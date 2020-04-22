data <- patient_info %>% 
    select(patient_id, sex, birth_year, age, province, city, infection_case, confirmed_date, released_date,
           deceased_date, state) %>% 
    mutate(approx_age = 2020 - birth_year,
           resolved_date = coalesce(released_date, deceased_date),
           survival_days = if_else(!is.na(resolved_date), resolved_date - confirmed_date,
                                   lubridate::mdy("04/20/2020") - confirmed_date),
           event = if_else(state == "deceased", 1, 0)) %>% 
    rename(age_cat = age) %>% 
    mutate(age_cat_2 = if_else(approx_age < 18, "Under 18",
                             if_else(approx_age < 31, "18-30",
                                     if_else(approx_age < 56, "31-55",
                                             if_else(approx_age < 76, "56-75", "Over 75"))))) %>% 
    left_join(region, by = c("province", "city")) %>% 
    select(-code:-university_count, -nursing_home_count) %>% 
    left_join(weather, by = c("province" = "province", "confirmed_date" = "date")) %>% 
    select(-code, -min_temp, -max_temp, -most_wind_direction) %>% 
    filter(is.na(survival_days) | !(survival_days < 0)) %>%   # there are some negative survival days -- bad data?
    filter(province %in% c("Busan", "Daegu", "Gangwon-do", "Gyeonggi-do",
                           "Gyeongsangbuk-do", "Seoul", "Ulsan")) # only including provinces with at least one death
    
#saveRDS(data, file = "./01_data/processed/data.rds")
