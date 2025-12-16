###############################################################
# Script: 17_dplyr_add_count_add_tally.R
#
# Purpose:
#   Demonstrate how to append frequency counts and weighted totals
#   to a dataset using dplyr::add_count() and dplyr::add_tally().
#
#   Demonstrated steps:
#     - Create a dummy dataset (tea farms + county + grade + yield)
#     - Use add_count() to append frequency counts
#     - Use add_count() with multiple grouping columns
#     - Use add_count() with sorting and weighting (wt)
#     - Use add_tally() on grouped data to append totals
#     - Compare add_tally() vs add_count()
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibble
#   3. add_count() examples
#   4. Weighted use cases (wt)
#   5. add_tally() after group_by()
#   6. Comparison add_count() vs add_tally()
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-17
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Dataset (Tea farms + county + grade + tea yield)
# ---------------------------------------------------------------------------
df <- tibble(
  farm   = paste0("F_", 1:8),
  county = c("Kericho","Bomet","Nandi","Kericho","Kericho","Bomet","Nandi","Nandi"),
  grade  = c("BP","BP","PF","PD","BP","PF","PD","BP"),
  tea_kg = c(400, 550, 300, 430, 510, 390, 350, 450)
)

df

# ---------------------------------------------------------------------------
# 3. add_count(): Append frequency counts
# ---------------------------------------------------------------------------
# Count farms per county (adds column n)
df %>%
  add_count(county)

# Count farms per grade
df %>%
  add_count(grade)

# Count by county + grade
df %>%
  add_count(county, grade)

# ---------------------------------------------------------------------------
# 4. add_count(): Weighted and sorted counts
# ---------------------------------------------------------------------------
# Weighted count by tea_kg (total tea per county)
df %>%
  add_count(county, wt = tea_kg)

# Weighted count with county + grade
df %>%
  add_count(county, grade, wt = tea_kg)

# Sorted output
df %>%
  add_count(county, sort = TRUE)

# ---------------------------------------------------------------------------
# 5. add_tally(): Append totals to grouped data
# ---------------------------------------------------------------------------
# Total farms per county
df %>%
  group_by(county) %>%
  add_tally()

# Weighted tally — total tea per county
df %>%
  group_by(county) %>%
  add_tally(wt = tea_kg)

# Tally after grouping by county + grade
df %>%
  group_by(county, grade) %>%
  add_tally()

# ---------------------------------------------------------------------------
# 6. Difference: add_count() vs add_tally()
# ---------------------------------------------------------------------------
# add_count(): no need to group beforehand
df %>%
  add_count(county)

# add_tally(): works AFTER you group data
df %>%
  group_by(county) %>%
  add_tally()

# ---------------------------------------------------------------------------
# End of script — Use add_count/add_tally to enrich data with summary info!
# ---------------------------------------------------------------------------
# 💡 Tip:
# add_count() is faster for quick summaries; add_tally() is perfect for grouped pipelines.
###############################################################
