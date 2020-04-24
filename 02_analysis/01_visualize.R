### density plots

density_sex <- data %>% 
    filter(state == "deceased") %>% 
    mutate(survival_days = as.numeric(survival_days, units = "days")) %>% 
    ggplot(aes(x = survival_days, color = sex)) +
    geom_density(alpha = 0.3) +
    xlab("Days of Survival") +
    scale_color_discrete(name = "Sex") +
    theme_bw()


data %>% 
    filter(state == "deceased") %>% 
    mutate(survival_days = as.numeric(survival_days, units = "days")) %>% 
    ggplot(aes(x = survival_days, color = age_cat)) +
    geom_density(alpha = 0.3) +
    xlab("Days of Survival") +
    scale_color_discrete(name = "Age") +
    theme_bw()

data %>% 
    filter(state == "deceased") %>% 
    mutate(survival_days = as.numeric(survival_days, units = "days")) %>% 
    ggplot(aes(x = survival_days, color = province)) +
    geom_density(alpha = 0.3) +
    xlab("Days of Survival") +
    scale_color_discrete(name = "Province") +
    theme_bw()


### K-M values and K-M curves
sex_surv <- survfit(Surv(survival_days, event, type = "right") ~ sex, data)
age_surv_data <- data %>%
    filter(age_cat %in% c("30s", "50s", "60s", "70s", "80s", "90s")) 
age_surv <- survfit(Surv(survival_days, event, type = "right") ~ age_cat, age_surv_data)
province_surv <- survfit(Surv(survival_days, event, type = "right") ~ province, data)

autoplot(sex_surv) +
    labs(x = "Survival Days", y = "Proportion Surviving", title = "KM Survival Plots by Sex") +
    theme_bw()

autoplot(age_surv) +
    labs(x = "Survival Days", y = "Proportion Surviving", title = "KM Survival Plots by Age") +
    theme_bw()

autoplot(province_surv) +
    labs(x = "Survival Days", y = "Proportion Surviving", title = "KM Survival Plots by Province") +
    theme_bw()
