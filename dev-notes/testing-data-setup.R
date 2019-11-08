# Create smaller data sets for testing purposes
# Jeff Oliver
# jcoliver@email.arizona.edu
# 2019-11-08

rm(list = ls())

################################################################################
large_data <- read.csv(file = "data/NPSY4_x1_rf1_daily.csv")

# Small data, 100 x 2000
write.csv(x = large_data[1:100, 1:2000], file = "data/input-small.csv", row.names = FALSE)

# Tiny data, 20 x 1000
write.csv(x = large_data[1:20, 1:1000], file = "data/input-tiny.csv", row.names = FALSE)

# Data set with impossible dates and incomplete sampling through year
messy_data <- read.csv(file = "data/ihs4p_x0_rf1_daily.csv")

write.csv(x = messy_data[1:100, 1:1000], file = "data/input-messy.csv", row.names = FALSE)