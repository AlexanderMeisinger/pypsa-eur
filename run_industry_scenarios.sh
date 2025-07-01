#!/bin/bash
scenarios=(
    "config.industry_gdp-0.02" 
    "config.industry_gdp+0" 
    "config.industry_gdp+0.02"
    )

for scenario in "${scenarios[@]}"; do
    path="/mnt/e/H2GMA/Github/AP10/analyse-h2g-a-ap10/config/base-EU-climate-goals/${scenario}.yaml"
    echo "Running $path"
    snakemake --cores all --configfile "$path"
done
