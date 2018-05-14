library(blscrapeR)
library(ggplot2)
library(tidyr)

## Useful bls categories:
# CPS (Current Population Survey) includes employment and unemployment rates nationally.
# LAUS (Local Area Unemployment Statistics)
# CES (Current Employment Statistics) includes employment by industry.
# OES (Occupational Employment Statistics) includes earnings and wages by industry, age, sex, etc.
# JOLTS (Job Openings and Labor Turnover Survey)
# QCEW (Quarterly Census of Employment & Wages)
# BDM (Business Employment Dynamics)
# ATUS (American Time Use Survey)

## CPI Categories:
# CPI All Urban Consumers (Current Series)
# CPI Urban Wage Earners and Clerical Workers (Current Series)
# CPI All Urban Consumers (Chained CPI)
# CPI Average Price Data

## PPI (Producer Price Index)
# The PPI data tracks the average change in selling prices received by domestic 
# producers for their output over time. Categories: 
# PPI Industry Data
# PPI Commodity Data includes “headline” FD-ID indexes.

## Measuring inflation
# Inflation usually measured using CPI's "Consumer Price Index for All Urban
# Consumers: All Items" 
df <- bls_api("CUSR0000SA0")
head(df)
df <- inflation_adjust(1995)
tail(df)

# price escalation
df <- bls_api("CUSR0000SA0",
              startyear = 2014, endyear = 2015)
head(df)

# Set base value.
base_value <- 100
# Get CPI from base period (January 2014).
base_cpi <- subset(df, year==2014 & periodName=="January", select = "value")
# Get the CPI for the new period (February 2015).
new_cpi <- subset(df, year==2015 & periodName=="February", select = "value")
# Calculate the updated value of our $100 investment.
(base_value / base_cpi) * new_cpi
# Woops, looks like we lost a penny!


# calculate inflation
library(ggplot2)
library(tidyr)

df <- bls_api("8f25628736a84f5182559769d913bf91")

