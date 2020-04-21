rm(list = ls())

# Packages and data loading -----------------------------------------------

source("00_R/01_load_packages.R")
source("00_R/02_functions.R")

# Data cleaning and preparation -------------------------------------------

source("01_data/03_load_data.R")
source("01_data/04_clean_data.R")

# Exploratory analysis ----------------------------------------------------

source("02_analysis/01_visualize.R")
source("02_analysis/02_k-m_stats.R")
source("02_analysis/03_cox_univ_models.R")
source("02_analysis/04_cox_multiv.R")
source("02_analysis/05_demographics.R")