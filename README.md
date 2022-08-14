# ClimateChangeAndConflict

## Conflict in Africa 

![ConflictDevAfrica](https://github.com/Luca-Frank/ClimateChangeAndConflict/blob/8ad7964cd80bde38019926f0478a7521d3200e9e/plots/ConflictDevAfrica.png)


<p align="center">
Figure 1: Development of Protests and Riots in different Regions in Africa between 1997 and 2021. Calculated with Armed Conflict & Event Location Dataset based on a Poisson regression model.
</p>

## Water Stress
From the [Aqueduct 3.0](https://www.wri.org/research/aqueduct-30-updated-decision-relevant-global-water-risk-indicators) Dataset Figure 2 and 3 show the raw data of the baseline water stress and the water stress for the agricultural industry. For the latter index, 13 water related indicators have been weighted to the more accurately describe the water stress for the agricultural industry. More on the methodology is in the [documentation for Aqueduct 3.0](https://files.wri.org/d8/s3fs-public/aqueduct-30-updated-decision-relevant-global-water-risk-indicators_1.pdf). 
<p float="left">
  <img src="plots/bwsOG.png" width="400" />
  <img src="plots/agrOG.png" width="400" /> 
</p>

The Aqueduct 3.0 has the geomeotry type of Multipolygon, which is not compatible with other datasets. Therefore, I restructed the Aqueduct to fit onto [districts](https://www.naturalearthdata.com/downloads/10m-cultural-vectors/10m-admin-1-states-provinces/). Which is also useful for adding political variables.
<p float="left">
  <img src="plots/bws.png" width="400" />
  <img src="plots/agr.png" width="400" /> 
</p>


## Catastrophes
In addition looking at water stress levels, the total amount of catastrophes, specifically droughts and floods are calculated per district. The data is from the [Geocoded Disaster (GDIS) Dataset](https://sedac.ciesin.columbia.edu/data/set/pend-gdis-1960-2018).
<p float="left">
  <img src="plots/flood.png" width="400" />
  <img src="plots/drought.png" width="400" /> 
</p>


## Additional Variables
For the moderated mediation models, multiple control variables are added. Such as food Insecurity by [Food Insecurity Hotspots Dataset](https://sedac.ciesin.columbia.edu/data/set/food-food-insecurity-hotspots), which captures food insecurity with the  [FEWS NET Food Insecurity Severity Scale (FNFIS)](https://sedac.ciesin.columbia.edu/downloads/docs/food/food-food-insecurity-hotspots-documentation.pdf) that  ranges from 1, generally food secure to 5, famine. The Population density per district is from the [Africa Continental Population Dataset (2000 - 2020)](https://github.com/Luca-Frank/ClimateChangeAndConflict/blob/e9f6edd24b1485605966ba0b57a7b5c48d5e2564/data/AfricaPopulation/Population%20Codebook.pdf).

<p float="left">
  <img src="plots/inscecurity.png" width="400" />
  <img src="plots/density.png" width="400" /> 
</p>

## Models

## Predictions

## Results
