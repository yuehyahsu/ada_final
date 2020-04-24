surv_cox

table02 <- surv_cox %>% 
    tbl_regression(exp = T,
                   label = list(sex = "Sex", approx_age = "Age", province = "Province"))
