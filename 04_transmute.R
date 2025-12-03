###############################################################
# Script: 04_dplyr_transmute.R
#
# Purpose:
#   Demonstrate dplyr::transmute() for creating new columns 
#   while returning ONLY the newly created variables.
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea production + price)
#     - Create a new column (total revenue)
#     - Compare mutate() vs transmute()
#     - Combine multiple new variables
#     - Use transformation functions (round, log)
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Basic transmute vs mutate
#   4. Multiple transformations in transmute
#   5. Apply functions inside transmute
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-04
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea production + price per kg)
# ---------------------------------------------------------------------------
df <- tibble(
  tea_kg  = c(500, 150, 300, 450, 400),
  price   = c(2.5, 2.0, 3.0, 2.8, 2.4)
)

df

# ---------------------------------------------------------------------------
# 3. mutate() vs transmute()
# ---------------------------------------------------------------------------
# mutate keeps existing columns
df %>%
  mutate(total_revenue = tea_kg * price)

# transmute keeps ONLY new columns
df %>%
  transmute(total_revenue = tea_kg * price)

# ---------------------------------------------------------------------------
# 4. Multiple new columns using transmute
# ---------------------------------------------------------------------------
df %>%
  transmute(
    total_revenue = tea_kg * price,
    revenue_usd   = total_revenue * 115   # Example currency conversion
  )

# ---------------------------------------------------------------------------
# 5. Using functions inside transmute
# ---------------------------------------------------------------------------
df %>%
  transmute(
    total_revenue     = tea_kg * price,
    total_revenue_log = log(total_revenue),
    rounded_tea       = round(tea_kg / 10) * 10
  )

# ---------------------------------------------------------------------------
# End of script — Try making your own calculated column!
# ---------------------------------------------------------------------------
# 💡 Tip:
# transmute() is ideal for producing a clean output table with only
# the variables you compute.
###############################################################
