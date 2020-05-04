age_surv_cox

surv_cox

table02_uni <- age_surv_cox %>% 
    tbl_regression(exp = T,
                   label = list(approx_age = "Age"))

table02_multi <- surv_cox %>% 
    tbl_regression(exp = T,
                   label = list(sex = "Sex", approx_age = "Age", province = "Province"))

table02 <- tbl_merge(
    tbls = list(table02_uni, table02_multi),
    tab_spanner = c("Age Only", "Multivariate Model")
)
