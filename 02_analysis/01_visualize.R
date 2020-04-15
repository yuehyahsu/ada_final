data %>% 
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
    ggplot(aes(x = survival_days, color = age)) +
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
