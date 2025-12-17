###############################################################
# Script: 18_dplyr_bind_rows.R
#
# Purpose:
#   Demonstrate how to combine data frames vertically using
#   dplyr::bind_rows().
#
#   Demonstrated steps:
#     - Create multiple tea data sets (same + different columns)
#     - Stack/append tables using bind_rows()
#     - Handle missing columns automatically (fill with NA)
#     - Add an identifier column using .id
#     - Bind a list of data frames
#     - Compare bind_rows() with rbind() (base R)
#
# Workflow:
#   1. Load dplyr
#   2. Create example tibbles
#   3. Basic bind_rows() usage
#   4. Bind tables with different columns
#   5. Add IDs when binding multiple frames
#   6. Bind a list of data frames
#
# Author: Wyclife Agumba Oluoch
# YouTube: https://www.youtube.com/@wycology
# Date: 2025-12-18
###############################################################

# ---------------------------------------------------------------------------
# 1. Load required package
# ---------------------------------------------------------------------------
library(dplyr) # Version 1.1.4 ==> Data Wrangling

# ---------------------------------------------------------------------------
# 2. Create Dummy Tea Farm Datasets
# ---------------------------------------------------------------------------
df_a <- tibble(
  farm   = paste0("F_", 1:3),
  county = c("Kericho","Bomet","Nandi"),
  tea_kg = c(400, 550, 300)
)

df_b <- tibble( # Slightly changed from the one on YouTube, intentionally :)
  farm   = c("F_4","F_5"), 
  county = c("Kericho","Nandi"),
  tea_kg = c(430, 510)
)

# Data set with extra column (grade missing in df_a/df_b)
df_c <- tibble(
  farm   = c("F_6","F_7"),
  county = c("Bomet","Nandi"),
  tea_kg = c(390, 350),
  grade  = c("PF","BP")
)

# ---------------------------------------------------------------------------
# 3. Basic bind_rows(): Stack rows together
# ---------------------------------------------------------------------------
bind_rows(df_a, df_b)

# ---------------------------------------------------------------------------
# 4. Binding tables with different columns (fills missing cells with NA)
# ---------------------------------------------------------------------------
bind_rows(df_a, df_c)

# Bind all three
bind_rows(df_a, df_b, df_c)

# ---------------------------------------------------------------------------
# 5. Add identifier column when binding
# ---------------------------------------------------------------------------
bind_rows(list(A = df_a, B = df_b, C = df_c), .id = "source")

# ---------------------------------------------------------------------------
# 6. Bind a list of data frames
# ---------------------------------------------------------------------------
dfs <- list(df_a, df_b, df_c)

bind_rows(dfs)

# ---------------------------------------------------------------------------
# Bonus: bind_rows() vs base rbind()
# ---------------------------------------------------------------------------
# rbind() fails if columns differ
# rbind(df_a, df_c) # ❌ Error
#
# bind_rows() handles different columns automatically 👍
bind_rows(df_a, df_c)

# ---------------------------------------------------------------------------
# End of script — Use bind_rows() when stacking tables by rows!
# ---------------------------------------------------------------------------
# 💡 Tip:
# bind_rows() is ideal for combining datasets from multiple files or years.
###############################################################
