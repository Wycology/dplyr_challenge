###############################################################
# Script: 03_dplyr_mutate.R
#
# Purpose:
#   Demonstrate how to create and transform columns in R
#   using dplyr::mutate() and supporting functions.
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea price, production, rainfall)
#     - Add new columns from existing ones
#     - Use arithmetic operations
#     - Create conditional columns using if_else()
#     - Use string manipulation inside mutate()
#     - Multiple new columns in one mutate()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Add new numeric columns (math operations)
#   4. Create conditional column using if_else()
#   5. Text manipulation (convert to lowercase / uppercase)
#   6. Create multiple new columns in a single mutate()
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-03
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr)      # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea Production + Prices)
# ---------------------------------------------------------------------------
# Data shows how much tea each plot produced and price per kg (USD)
df <- tibble(
  name       = paste0("plot_", 1:4),
  tea_kg     = c(500, 200, 350, 450),
  price_usd  = c(2.5, 2.0, 3.0, 2.8),
  rainfall   = c(1200, 800, 1100, 1000)
)

# Print dataset
df

# ---------------------------------------------------------------------------
# 3. Add New Numeric Columns with mutate()
# ---------------------------------------------------------------------------
# Total revenue: kilograms multiplied by price
df %>%
  mutate(total_revenue = tea_kg * price_usd)

# Convert kilograms to metric tons (1 ton = 1000 kg)
df %>%
  mutate(tea_tons = tea_kg / 1000)

# ---------------------------------------------------------------------------
# 4. Conditional Columns Using if_else()
# ---------------------------------------------------------------------------
# Label high producing plots (>= 400 kg)
df %>%
  mutate(productivity = if_else(tea_kg >= 400, "High", "Low"))

# More complex condition: revenue class
df %>%
  mutate(revenue_class = if_else(tea_kg * price_usd > 1000, "Profitable", "Low Profit"))

# ---------------------------------------------------------------------------
# 5. Text Manipulation in mutate()
# ---------------------------------------------------------------------------
# Convert names to lowercase
df %>%
  mutate(name_lower = tolower(name))

# Add a prefix to names
df %>%
  mutate(code = paste0("TEA_", name))

# ---------------------------------------------------------------------------
# 6. Create Multiple New Columns in One mutate()
# ---------------------------------------------------------------------------
df %>%
  mutate(
    total_revenue = tea_kg * price_usd,
    tea_tons      = tea_kg / 1000,
    is_profitable = total_revenue > 1000
  )

# ---------------------------------------------------------------------------
# End of Script — Try experimenting with your own formulas!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Use mutate() to create, update, or transform columns.
# Want summaries instead? Stay tuned: Tomorrow we explore transmute().
###############################################################
