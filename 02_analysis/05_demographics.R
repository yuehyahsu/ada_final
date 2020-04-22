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
             list("Busan" = ~ .n_perc0(province == "Busan"),
                  "Daegu" = ~ .n_perc0(province == "Daegu"),
                  "Gangwon-do" = ~ .n_perc0(province == "Gangwon-do"),
                  "Gyeonggi-do" = ~ .n_perc0(province == "Gyeonggi-do"),
                  "Gyeongsangbuk-do" = ~ .n_perc0(province == "Gyeongsangbuk-do"),
                  "Seoul" = ~ .n_perc0(province == "Seoul"),
                  "Ulsan" = ~ .n_perc0(province == "Ulsan")),
         "Days to Resolution (Death or Release):" = 
             list("Mean (SD)" = ~ mean_sd(survival_days,
                                          denote_sd = "paren", na_rm = T, show_n = "never")),
         "Disease State:" = 
             list("Deceased" = ~ .n_perc0(state == "deceased"),
                  "Isolated" = ~ .n_perc0(state == "isolated"),
                  "Released" = ~ .n_perc0(state == "released"))
    )

table01 <- summary_table(data, summary)