# Soil Carbon Dynamics Following Mountain Pine Die-off

This repository contains R code for analysing soil organic carbon (SOC) dynamics across elevation gradients following mountain pine death.
We here integrate field data with forest simulation data to understand carbon cycling responses to large-scale mountain pine die-off.

## Research Overview

**Primary Research Questions:**
1. How does declining mountain pine health influence SOC stocks and spatial variability?
2. To what extent do changes in soil volume and soil carbon concentration drive changes in SOC stocks?
3. When do soil organic carbon dynamics reach a tipping point and shift from a carbon sink to a carbon source after mountain pine death?

## Repository Contents

### Core Analysis Scripts

1. **`carbon_stock_analysis.R`** - Statistical analysis of field and laboratory data
2. **`soil_carbon_simulation.R`** - Three-pool soil carbon model simulation

### Key Features

- **Field Data Integration**: Laboratory soil analyses with forest health classifications
- **Statistical Modelling**: Linear mixed-effects models with variance partitioning
- **Carbon Cycle Simulation**: Three-pool model (labile, refractory, soil organic matter)
- **Elevation Gradient Analysis**: Low, intermediate, and high elevation comparisons
- **Erosion Impact Assessment**: Sensitivity analysis for soil loss scenarios

## Quick Start Guide

### Prerequisites

**Required R Packages:**
```r
# Data manipulation and analysis
install.packages(c("readxl", "tidyverse", "tidyr", "broom", "dplyr"))

# Statistical modelling
install.packages(c("lme4", "sjPlot", "vegan", "AICcmodavg", "MuMIn"))

# Model diagnostics
install.packages(c("performance", "DHARMa"))

# Visualisation
install.packages(c("ggplot2", "gridExtra", "grid", "cowplot"))
```

**Additional Requirements:**
- `HighstatLibV13.r` script for correlation analysis (available from Highland Statistics)
- Excel data files with soil measurements and mountain pine health classifications

### Basic Usage

1. **Statistical Analysis of Field Data:**
   ```r
   source("carbon_stock_analysis.R")
   # Analyses SOC differences between healthy, ailing, and unstocked plots
   # Generates correlation matrices and mixed-effects model results
   ```

2. **Carbon Cycle Simulation:**
   ```r
   source("soil_carbon_simulation.R")
   # Simulates long-term carbon dynamics following mountain pine mortality
   # Identifies tipping points and unstocked thresholds
   ```

## Data Structure

### Expected Input Data

Your Excel file should contain the following columns:
- `plot_id`: Unique plot identifier
- `condition`: Forest health status (healthy, ailing, unstocked)
- `triplet`: Matched plot grouping
- `elevation_m`: Elevation in metres
- `northerness`: Aspect as northerness value
- `Cstock_tperha`: Carbon stock in tonnes per hectare
- `sd_Cstock`: Standard deviation of carbon stock
- `cv_Cstock`: Coefficient of variation of carbon stock
- `soil_vol_cm3`: Soil volume in cubic centimetres
- `Corg_percent`: Organic carbon percentage

### Model Parameters

The simulation uses three carbon pools:
- **Young Labile (YL)**: Fast-decomposing litter
- **Young Refractory (YR)**: Slow-decomposing deadwood  
- **Soil Organic Matter (SOC)**: Stable carbon pool

Parameters are elevation-specific and derived from:
- Field measurements (this study)
- iLand simulation data

## Key Functions

### Statistical Analysis (`carbon_stock_analysis.R`)

- **`check_model()`**: Comprehensive model diagnostics including AICc, R², and residual analysis
- **`Mypairs()`**: Publication-ready correlation matrix plots following Zuur et al. (2010) protocols

### Carbon Simulation (`soil_carbon_simulation.R`)

- **`calculateYear()`**: Single-year carbon pool calculations based on ICBM model (Andrén & Kätterer, 1997)
- **`stablestates()`**: Calculates decomposition rates from steady-state conditions
- **`simulate_dieoff()`**: Simulates carbon dynamics following mountain pine mortality
- **`kobayashi_maru()`**: Main simulation function calculating tipping points and transition thresholds

## Results and Outputs

### Statistical Analysis Outputs
- Linear mixed-effects model summaries
- Variance partitioning results
- Diagnostic plots and residual analyses
- Publication-ready correlation matrices

### Simulation Outputs
- Long-term SOC trajectory plots
- Identification of carbon sink-to-source transition points
- Sensitivity analyses for different erosion scenarios
- Elevation-specific carbon cycle dynamics

## Model Validation

The three-pool carbon model is validated against:
- Field measurements from healthy, ailing, and unstocked forest plots
- Steady-state carbon pool calculations
- Literature-based decomposition rates

## Interpretation Guide

### Key Transition Points
- **Tipping Point**: When SOC begins declining from peak post-disturbance values
- **Carbon Source Threshold**: When area transitions from carbon sink to source
- **Unstocked Threshold**: When SOC reaches levels typical of unstocked forest areas

### Elevation Effects
- **Low Elevation**: Faster carbon cycling, earlier transitions
- **Intermediate Elevation**: Moderate carbon dynamics
- **High Elevation**: Slower carbon cycling, delayed transitions

## Troubleshooting

### Common Issues
1. **Missing Data**: Ensure all required columns are present in input Excel files
2. **Package Dependencies**: Install all required packages before running analyses
3. **File Paths**: Update file paths in scripts to match your directory structure
4. **Memory Issues**: Use `gc()` function if experiencing memory constraints with large datasets

### Model Convergence
If mixed-effects models fail to converge:
- Check for highly correlated predictors
- Consider scaling/centering continuous variables
- Reduce model complexity if necessary

## Scientific Background

This research addresses critical knowledge gaps in post-disturbance carbon dynamics:
- Integration of field measurements with process-based modelling
- Elevation-dependent responses to large-scale forest mortality
- Long-term carbon cycle implications of mountain pine beetle outbreaks
- Erosion impacts on soil carbon retention

## Citation

If you use this code, please cite:
[publication details]

## Authors

- **Barbara M. P. B. de Araujo** - Statistical analysis and field data integration
- **Werner Rammer** - iLand forest simulation code
- **Christina Dollinger** - iLand simulation data

## Licence

[licence here]

## Contact

For questions about the code or methodology, please contact:
[contact information]

---
