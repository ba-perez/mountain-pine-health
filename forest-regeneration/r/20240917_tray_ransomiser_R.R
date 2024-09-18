### Randomise seed and control placement in propagation trays - R Version
### Coder: Barbara Araujo
### Date: 2024.09.17.

library(dplyr)
library(tidyr)
library(purrr)
library(stringr)
library(glue)
library(knitr)

# Define the objects and their counts
objects <- c(rep('E', 3), rep('P. abies', 5), rep('P. cembra', 5), rep('A. pseudoplatanus', 5), rep('S. aucuparia', 5))
num_plates <- 72
plate_size <- c(4, 6)

# Define a fixed position for 'L' (row, col).
position_L <- c(2, 2)

# Function to generate a single plate with correct counts
generate_plate <- function() {
  # Create an empty plate
  plate <- matrix('', nrow = plate_size[1], ncol = plate_size[2])
  
  # Assign 'L' to its fixed position
  plate[position_L[1], position_L[2]] <- 'L'
  
  # Create a list of all other positions except the fixed 'L' position
  available_positions <- expand.grid(row = 1:plate_size[1], col = 1:plate_size[2]) %>%
    filter(!(row == position_L[1] & col == position_L[2]))
  
  # Ensure there are enough positions for the given counts
  if (nrow(available_positions) < length(objects)) {
    stop("Not enough available positions for the given objects.")
  }
  
  # Randomly shuffle the positions
  available_positions <- available_positions[sample(nrow(available_positions)),]
  
  # Assign the remaining objects to the available positions
  for (i in seq_along(objects)) {
    pos <- available_positions[i,]
    plate[pos$row, pos$col] <- objects[i]
  }
  
  return(plate)
}

# Display plate
display_plate <- function(plate, plate_number) {
  symbol_map <- c(
    'E' = 'leer',  
    'L' = 'logger',  
    'P. abies' = 'P. abi',  
    'P. cembra' = 'P. cem',  
    'A. pseudoplatanus' = 'A. pse',  
    'S. aucuparia' = 'S. auc'
  )
  
  plate_coloured <- plate %>% as.data.frame() %>%
    mutate(across(everything(), ~ symbol_map[.])) %>%
    as.matrix()
  
  cat(glue("Plate {plate_number}\n"))
  
  # Convert matrix to data frame and remove row names
  plate_df <- as.data.frame(plate_coloured)
  rownames(plate_df) <- NULL
  
  # Print table without column names
  print(kable(plate_df, format = "pipe", align = "c", col.names = NULL))
  cat("\n")
}

# Generate all 72 plates
plates <- replicate(num_plates, generate_plate(), simplify = FALSE)

# Output all plates
for (i in seq_along(plates)) {
  display_plate(plates[[i]], i)
}