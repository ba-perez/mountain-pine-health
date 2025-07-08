# Soil Carbon Dynamics Following Mountain Pine Die-off

This repository contains R code for analysing soil organic carbon (SOC) dynamics across elevation gradients following mountain pine death.
We here integrate field and forest simulation data to understand carbon cycling responses to large-scale mountain pine die-off.

## Research Overview

**Primary Research Questions:**
1. How does declining mountain pine health influence SOC stocks and spatial variability?
2. To what extent do changes in soil volume and soil carbon concentration drive changes in SOC stocks?
3. When do soil organic carbon dynamics reach a tipping point and shift from a carbon sink to a carbon source after mountain pine death?

## Repository Contents

### Analysis Scripts

1. **`carbon_stock_analysis.R`** - Statistical analysis of field and laboratory data
2. **`soil_carbon_simulation.R`** - Three-pool soil carbon model simulation

### Key Features

- **Statistical methods**: Linear mixed-effects modelling and variation partitioning
- **Carbon cycle simulation**: Three-pool model (labile, refractory, soil organic carbon)
- **Sensitivity analyses**: Simulation of possible carbon cycle scenarios, including different rates of mountain pine die-off and of soil erosion intensity after mountain pine death
- **Analysis and simulation throughout an elevation gradient**: Low (<= 1300 m a.s.l.), intermediate (between 1300 and 1500 m a.s.l.), and high (> 1500 m a.s.l.)

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
- Dataset with soil measurements and mountain pine health classifications
- `HighstatLibV13.r` script for correlation analysis (available from Zuur et al., 2010: doi.org/10.1111/j.2041-210X.2009.00001.x)

## Data Structure

### Input Data

The dataset should contain the following columns:
- `plot_id`: Unique plot identifier
- `condition`: Mountain pine health status (healthy, ailing, unstocked)
- `triplet`: Plot grouping ID; each group includes one plot condition
- `elevation_m`: Elevation in metres
- `northerness`: Aspect as northerness value
- `Cstock_tperha`: Organic carbon stock in tonnes per hectare
- `sd_Cstock`: Standard deviation of organic carbon stock
- `cv_Cstock`: Coefficient of variation of organic carbon stock
- `soil_vol_cm3`: Sampled soil volume in cubic centimetres
- `Corg_percent`: Percentage of organic carbon in the soil sample

### Model Parameters

The simulation uses three carbon pools, in tonnes per hectare:
- **Young Labile (YL)**: Fast-decomposing, e.g. litter
- **Young Refractory (YR)**: Slow-decomposing, e.g. deadwood  
- **Soil organic carbon (SOC)**: Soil organic matter

Parameters are elevation-specific and derived from:
- Field measurements (this study)
- iLand simulation data

## Key Functions

### Statistical analysis (`carbon_stock_analysis.R`)

- **`check_model()`**: Custom model diagnostics including AICc, R², and residual analysis
- **`Mypairs()`**: Publication-ready correlation matrix plots adapted from Zuur et al. (2010)

### Carbon cycle simulation (`soil_carbon_simulation.R`)

- **`kobayashi_maru()`**: Main SOC simulation function, also outputs the time until carbon tipping points and transition thresholds

## Results and Outputs

### Statistical analysis
- Correlation matrices
- Linear mixed-effects model summaries
- Diagnostic plots and residual analyses
- Variance partitioning results

### Carbon cycle simulation
- Elevation-specific long-term SOC trajectory plots
- Identification of carbon sink-to-source transition points
- Sensitivity analyses for different die-off durations and erosion scenarios

## Interpretation Guide

### Key Transition Points
- **Tipping Point**: Year when SOC begins declining from its highest post-disturbance value, becoming a carbon source
- **Unstocked Threshold**: Year when SOC reaches levels observed in our unstocked plots

## Scientific Background

The research associated with this script addresses important knowledge gaps in mountain pine carbon dynamics under the threat of climate change, including:
- Elevation-dependent as well as ecosystem-level SOC responses to widespread mountain pine die-off
- Long-term effects of mountain pine die-off on the soil carbon cycle
- Possible erosion impacts following loss of mountain pine vegetation cover

## Citation

If you use this code, please cite:
[publication details]

##  Code authors

- **Barbara M. P. B. de Araujo** - Statistical analysis and field data integration
- **Werner Rammer** - iLand forest simulation code
- **Christina Dollinger** - iLand simulation data

## Licence

GNU General Public License v3.0

## Contact

For questions about the code or methodology, please contact:
Barbara M. P. B. de Araújo (barbara.araujo@tum.de)

---
