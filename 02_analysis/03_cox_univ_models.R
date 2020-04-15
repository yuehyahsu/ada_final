(sex_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ sex, data))
(age_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ approx_age, data))
(province_surv_cox <- coxph(Surv(survival_days, event, type = "right") ~ province, data))

summary(sex_surv_cox)
summary(age_surv_cox)
summary(province_surv_cox)
