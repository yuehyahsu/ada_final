sex_surv
age_surv
province_surv

(sex_surv_lr <- survdiff(Surv(survival_days, event, type = "right") ~ sex, data))
(age_surv_lr <- survdiff(Surv(survival_days, event, type = "right") ~ age_cat, data))
(province_surv_lr <- survdiff(Surv(survival_days, event, type = "right") ~ province, data))

#(sex_surv_pw <- pairwise_survdiff(Surv(survival_days, event, type = "right") ~ sex, data))
#(age_surv_pw <- pairwise_survdiff(Surv(survival_days, event, type = "right") ~ age_cat, data))
#(province_surv_pw <- pairwise_survdiff(Surv(survival_days, event, type = "right") ~ province, data))
