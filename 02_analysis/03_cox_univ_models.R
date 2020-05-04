(sex_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ sex, data))
(age_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ approx_age, data))
(province_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ province, data))

(elderly_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ elderly_population_ratio, data))

(temp_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ avg_temp, data))

summary(sex_surv_cox)
summary(age_surv_cox)
summary(province_surv_cox)

summary(elderly_surv_cox)

summary(temp_surv_cox)

age_surv_cox %>% 
    tbl_regression(exp = T)
