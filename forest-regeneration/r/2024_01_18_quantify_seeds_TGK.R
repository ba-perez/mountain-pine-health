### Calculate the number of seeds out of their weight
### Coder: Barbara Araujo
### 2024.01.31.

# Define function
quantify_seeds <- function(tree_dict) {
  total_seeds <- 0
  
  # Loop through each item in the dictionary
  for (item in tree_dict) {
    tree_name <- item[[1]]
    min_weight <- as.numeric(item[[2]])
    max_weight <- as.numeric(item[[3]])
    available_weight <- as.numeric(item[[4]])
    
    # Calculate the number of available seeds (rounded down)
    max_seed_count <- floor((available_weight * 1000) / (min_weight))
    min_seed_count <- floor((available_weight * 1000) / (max_weight))
    mean_seed_count <- floor(mean(c(min_seed_count, max_seed_count)))
      
    # Print the result for each tree
    cat(
      "For", tree_name,
      "\nNo. of available seeds:", min_seed_count, "-", max_seed_count,
      "\nMean seed count:", mean_seed_count, "\n\n"
    )
  }
}

# Create a dictionary with:
# Species' scientific name
# Min. TGK (Tausendkorngewicht) of the species, in grams
# Max. TGK of the species
# Available (bought) seed weight
# Source for TGK: gebirgswald.ch, confirmed by Lexica from Schuck et al.
tree_dictionary <- list(
  c("Picea abies", 4, 8, 100),
  c("Pinus cembra", 150, 300, 2000),
  c("Acer pseudoplatanus", 100, 250, 3000),
  c("Sorbus aucuparia", 3.5, 5, 200)
)

# Apply function
quantify_seeds(tree_dictionary)