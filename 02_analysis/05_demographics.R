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
             list("Mean (SD)" = ~ mean_sd(resolved_days,
                                          denote_sd = "paren", na_rm = T, show_n = "never")),
         "Disease State:" = 
             list("Deceased" = ~ .n_perc0(state == "deceased"),
                  "Isolated" = ~ .n_perc0(state == "isolated"),
                  "Released" = ~ .n_perc0(state == "released"))
    )

table_whole <- summary_table(data, summary)

# the third column describes only those who are dead
data_dead <- data %>% 
    filter(event == 1)

table_dead <- summary_table(data_dead, summary)

table01 <- cbind(table_whole, table_dead)

# print(table01,
#       rtitle = "Table 1: Characteristics of people diagnosed with COVID-19 in South Korea between 01/20/2020 and 04/20/2020",
#       cnames = c("Full sample (N = 2,772)",
#                  "Deaths only (N = 65)"))