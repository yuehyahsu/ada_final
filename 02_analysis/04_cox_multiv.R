(surv_cox <- coxph(Surv(survival_days, event) ~ sex + approx_age + province, data))

summary(surv_cox)