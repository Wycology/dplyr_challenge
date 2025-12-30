###############################################################
# Script: 31_dplyr_group_split_group_map.R
#
# Purpose:
#   Demonstrate how to work with grouped data using
#   dplyr::group_split() and dplyr::group_map().
#
#   Demonstrated steps:
#     - Create a dummy tea dataset with counties
#     - Use group_by() to define groups
#     - Split dataset into a list of tibbles with group_split()
#     - Apply a function to each group with group_map()
#     - Combine results after group_map()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. Use group_split() to split data by groups
#   4. Use group_map() to apply a function to each group
#   5. Combine results
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-31
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Example Tea Dataset
# ---------------------------------------------------------------------------
df <- tibble(
  farm    = paste0("F_", 1:6),
  county  = rep(c("Kericho","Bomet","Nandi"), each = 2),
  tea_kg  = c(400, 550, 300, 450, 500, 350),
  rainfall = c(120, 100, 90, 110, 105, 95)
)

df

# ---------------------------------------------------------------------------
# 3. Use group_split(): split data into a list by county
# ---------------------------------------------------------------------------
df_groups <- df %>%
  group_by(county) %>%
  group_split()

df_groups  # List of tibbles, one per county

# ---------------------------------------------------------------------------
# 4. Use group_map(): apply a function to each group
# ---------------------------------------------------------------------------
# Compute mean tea_kg per county
mean_per_county <- df %>%
  group_by(county) %>%
  group_map(~ tibble(mean_tea = mean(.x$tea_kg)))

mean_per_county  # List of tibbles

# ---------------------------------------------------------------------------
# 5. Combine results from group_map()
# ---------------------------------------------------------------------------
mean_per_county_df <- df %>%
  group_by(county) %>%
  group_map(~ tibble(county = unique(.y$county), mean_tea = mean(.x$tea_kg))) %>%
  bind_rows()

mean_per_county_df

# ---------------------------------------------------------------------------
# End of script — Use group_split() and group_map() to work with groups flexibly!
# ---------------------------------------------------------------------------
# 💡 Tip:
# group_split() is useful for splitting grouped data into a list, and group_map() allows applying a function to each group while preserving metadata.
###############################################################
