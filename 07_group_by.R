###############################################################
# Script: 07_dplyr_group_by.R
#
# Purpose:
#   Demonstrate grouping data in R using dplyr::group_by() 
#   to enable grouped operations such as summarise(), mutate(), 
#   and slice().
#
#   Demonstrated steps:
#     - Create dummy dataset (Tea farms in different counties)
#     - Group data by a single variable
#     - Group by multiple variables
#     - Use group_by() with summarise()
#     - Use group_by() with mutate() (group-wise calculations)
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Basic grouping
#   4. Grouping + summarise()
#   5. Grouping + mutate() for new stats
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-07
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms across counties)
# ---------------------------------------------------------------------------
df <- tibble(
  farm       = paste0("F_", 1:6),
  county     = c("Kericho", "Kericho", "Bomet", "Bomet", "Nandi", "Nandi"),
  tea_kg     = c(400, 550, 300, 450, 500, 350),
  rainfall   = c(1200, 1300, 1100, 1250, 1150, 1050)
)

df

# ---------------------------------------------------------------------------
# 3. Basic Grouping by One Column
# ---------------------------------------------------------------------------
df %>%
  group_by(county)

# 📝 Note:
# group_by() by itself shows no visible change until we apply a function.

# ---------------------------------------------------------------------------
# 4. group_by() + summarise()
# ---------------------------------------------------------------------------
# Calculate total tea produced per county
df %>%
  group_by(county) %>%
  summarise(total_tea = sum(tea_kg))

# Calculate average rainfall per county
df %>%
  group_by(county) %>%
  summarise(mean_rain = mean(rainfall))

# ---------------------------------------------------------------------------
# 5. group_by() + mutate() (Group-wise statistics)
# ---------------------------------------------------------------------------
# Compute % contribution of each farm to county total tea
df %>%
  group_by(county) %>%
  mutate(
    county_total = sum(tea_kg),
    pct_share    = (tea_kg / county_total) * 100
  )

# ---------------------------------------------------------------------------
# 6. Grouping by Multiple Columns
# ---------------------------------------------------------------------------
# Example: Group by county + rainfall category (High/Low)
df %>%
  mutate(rain_class = ifelse(rainfall > 1200, "High", "Low")) %>%
  group_by(county, rain_class) %>%
  summarise(avg_tea = mean(tea_kg))

# ---------------------------------------------------------------------------
# End of script — We will use ungroup tomorrow!
# ---------------------------------------------------------------------------
# 💡 Tip:
# Always ungroup() when exporting results to avoid accidental grouped behavior.
###############################################################
