# Soil Carbon Dynamics Following Mountain Pine Die-off

This repository contains R code for analysing soil organic carbon (SOC) dynamics across elevation gradients following mountain pine die-off. The code integrates field measurements and forest landscape simulations from the model iLand (Seidl et al., 2012).

## Research Questions

1. How does declining mountain pine health influence SOC stocks and SOC spatial variability?
2. To what extent do changes in soil volume and soil carbon concentration drive changes in SOC stocks?
3. When do soil organic carbon dynamics reach a tipping point and shift from a carbon sink to a carbon source after mountain pine death?

## Methods

- **Statistical analyses**: Linear mixed-effects models across three elevation bands (≤1300m, 1300-1500m, >1500m a.s.l.) and variation partitioning
- **Carbon cycle simulation**: Three-pool soil organic carbon model (labile, refractory, SOC) parameterised from field and iLand data, with sensitivity analyses for varying mountain pine die-off durations and erosion intensities.

## QRepository structure

├── carbon_stock_analysis.R      # Statistical analyses
└── soil_carbon_simulation.R     # Three-pool soil organic carbon model

## Quick Start Guide

### Prerequisites

- **Installed R Packages:** `readxl`, `tidyverse`, `lme4`, `sjPlot`, `vegan`, `AICcmodavg`, `MuMIn`, `performance`, `DHARMa`, `ggplot2`, `gridExtra`, `cowplot`
- **External code:** `HighstatLibV13.r` (Zuur et al., 2010)

## Key Functions

- **`check_model()`**: Custom model diagnostics (e.g. AICc, R², residuals)
- **`Mypairs()`**: correlation matrix plots adapted from Zuur et al. (2010)
- **`kobayashi_maru()`**: Main SOC simulation, also outputs the time until carbon tipping points and transition thresholds

## Key outputs

- Fixed effect estimates for how mountain pine condition other predictors affect SOC stocks
- Variance partitioning of SOC drivers
- Simulations of SOC dynamics following mountain pine die-off by elevation
- Timing until SOC pools transition from sink to source as well as to the new, unstocked stable state
- Sensitivity analyses for different disturbance scenarios

## Citation

If you use this code, please cite:
[publication details]

##  Code authors

- **Barbara M. P. B. de Araujo** - Statistical analysis, field data integration, simulation of SOC dynamics
- **Werner Rammer** - iLand source code
- **Christina Dollinger** - iLand data processing

## Licence

GNU General Public License v3.0

## Contact

For questions about the code or methodology, please contact:
Barbara M. P. B. de Araújo (barbara.araujo@tum.de)

---
