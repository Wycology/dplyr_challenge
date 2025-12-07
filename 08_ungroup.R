###############################################################
# Script: 08_dplyr_ungroup.R
#
# Purpose:
#   Demonstrate the use of dplyr::ungroup() after grouped operations.
#   Show how forgetting ungroup() can lead to accidental or unexpected 
#   results in downstream calculations.
#
#   Demonstrated steps:
#     - Create a dummy dataset (Tea farms in counties)
#     - Group data by county
#     - Perform summarise and mutate
#     - Show what happens when ungroup() is NOT used
#     - Correct the issue using ungroup()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Group data and calculate group-wise summaries
#   4. Demonstrate accidental behavior without ungroup()
#   5. Fix with ungroup()
#   6. Best practice: always ungroup after grouped operations
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-08
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset
# ---------------------------------------------------------------------------
df <- tibble(
  farm    = paste0("F_", 1:4),
  county  = c("Kericho","Kericho","Bomet","Bomet"),
  tea_kg  = c(400, 550, 300, 450)
)

df

# ---------------------------------------------------------------------------
# 3. Group data by county and calculate group-wise summaries
# ---------------------------------------------------------------------------
# Group by county and calculate county totals
grouped <- df %>%
  group_by(county) %>%
  mutate(county_total = sum(tea_kg))

grouped
# ---------------------------------------------------------------------------
# 4. Accidental behavior WITHOUT ungroup()
# ---------------------------------------------------------------------------
# Suppose we try to calculate overall totals after grouping
grouped %>%
  mutate(pct_share = tea_kg / sum(tea_kg) * 100)

# ❌ This calculates sum(tea_kg) **per group**, not overall!
# Kericho sum = 950, Bomet sum = 750

# ---------------------------------------------------------------------------
# 5. Correct approach: Use ungroup()
# ---------------------------------------------------------------------------
# Correct: ungroup first
grouped %>%
  ungroup() %>%
  mutate(pct_share = tea_kg / sum(tea_kg) * 100)
# ✔ Now sum(tea_kg) is over all farms (400+550+300+450 = 1700)

# ---------------------------------------------------------------------------
# End of script — Best Practices
# ---------------------------------------------------------------------------
# 💡 Tips:
# - Always ungroup() after group_by() when exporting, mutating, or summarising.
# - Forgetting ungroup() can silently affect downstream calculations.
###############################################################
