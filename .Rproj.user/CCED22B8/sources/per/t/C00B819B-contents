data_table01 <- data %>% 
    mutate(province_cat = recode(province,
                                 "Incheon" = "Other",
                                 "Daegu" = "other",
                                 "Sejong" = "Other",
                                 "Chungcheongbuk-do" = "Other",
                                 "Ulsan" = "Other",
                                 "Daejeon" = "Other",
                                 "Gangwon-do" = "Other",
                                 "Gwangju" = "Other",
                                 "Jeollabuk-do" = "Other",
                                 "Jeollanam-do" = "Other",
                                 "Jeju-doJeju-do" = "Other")) %>% 
    mutate(resolution_days = as.numeric(resolved_date - confirmed_date), units = "days")

options(qwraps2_markup = "markdown")
.n_perc0 <- hijack(n_perc0, na_rm = T, digits = 1, show_symbol = T)

summary <- 
    list("Sex:" =
             list("Male" = ~ .n_perc0(sex == "male"),
                  "Female" = ~ .n_perc0(sex == "female")),
         "Age:" = 
             list("Mean (SD)" = ~ mean_sd(approx_age,
                                          denote_sd = "paren", na_rm = T, show_n = "never")),
         "Province:" = 
             list("Gyeongsangbuk-do" = ~ .n_perc0(province == "Gyeongsangbuk-do"),
                  "Gyeonggi-do" = ~ .n_perc0(province == "Gyeonggi-do"),
                  "Seoul" = ~ .n_perc0(province == "Seoul"),
                  "Chungcheongnam-do" = ~ .n_perc0(province == "Chungcheongnam-do"),
                  "Busan" = ~ .n_perc0(province == "Busan"),
                  "Gyeongsangnam-do" = ~ .n_perc0(province == "Gyeongsangnam-do"),
                  "Other" = ~ .n_perc0(province_cat == "Other")),
         "Days to Resolution (Death or Release):" = 
             list("Mean (SD)" = ~ mean_sd(resolution_days,
                                          denote_sd = "paren", na_rm = T, show_n = "never")),
         "Disease State:" = 
             list("Deceased" = ~ .n_perc0(state == "deceased"),
                  "Isolated" = ~ .n_perc0(state == "isolated"),
                  "Released" = ~ .n_perc0(state == "released"))
    )

table01 <- summary_table(data_table01, summary)