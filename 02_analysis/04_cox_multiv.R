(surv_cox <- coxph(Surv(survival_days, event) ~ sex + approx_age + province, data))

summary(surv_cox)

test_ph <- cox.zph(surv_cox, terms = FALSE)
test_ph

# we wont' do mixed effects modeling but this is what it would require
(surv_cox_me <- coxme(Surv(survival_days, event) ~ sex + approx_age + (1 | province), data))

surv_cox %>% 
    tbl_regression(exp = T)

