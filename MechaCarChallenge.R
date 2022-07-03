# load in dplyr, tidyverse
library(dplyr)
library(tidyverse)

# Part 1
# load in csv
mecha_car <- read.csv('Resources/MechaCar_mpg.csv')

# multiple linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car)

# get the summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car))

# Part 2
# load in csv
suspension <- read.csv('Resources/Suspension_Coil.csv')

# get the total summary statistics
total_summary <- suspension %>% summarize(Mean=mean(PSI), Meadian=median(PSI), Variance=var(PSI), SD=sd(PSI))

# get the summary statistics for each lot
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Meadian=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Part 3
# t.test on whole population
t.test(suspension$PSI, mu=1500)

# t.test on each lot
t.test(subset(suspension, Manufacturing_Lot == 'Lot1', select = c(PSI)), mu=1500)

t.test(subset(suspension, Manufacturing_Lot == 'Lot2', select = c(PSI)), mu=1500)

t.test(subset(suspension, Manufacturing_Lot == 'Lot3', select = c(PSI)), mu=1500)