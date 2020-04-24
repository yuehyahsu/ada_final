figure02 <- plot_model(surv_cox) +
    theme_sjplot2() +
    geom_hline(yintercept = 1, color = "grey50") +
    labs(
        y = "Estimates (log scale)",
        title = "Figure 2. Hazard Ratios of Covariates"
    ) +
    scale_x_discrete(labels = c("sexmale" = "Male (ref: Female)",
                                "approx_age" = "Age",
                                "provinceDaegu" = "Daegu (ref: Busan)",
                                "provinceGangwon-do" = "Gangwon-do",
                                "provinceGyeonggi-do" = "Gyeonggi-do",
                                "provinceGyeongsangbuk-do" = "Gyeongsangbuk-do",
                                "provinceSeoul" = "Seoul",
                                "provinceUlsan" = "Ulsan"))
