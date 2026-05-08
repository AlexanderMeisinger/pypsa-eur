#!/bin/bash
cfgs_scenarios=(
  "/home/alex-charly/AP3/analyse-h2g-a-ap3-eu/config/H2Global-meets-Africa/config.gridfreeze.yaml"
  "/home/alex-charly/AP3/analyse-h2g-a-ap3-eu/config/H2Global-meets-Africa/config.lowH2cost.yaml"
  "/home/alex-charly/AP3/analyse-h2g-a-ap3-eu/config/H2Global-meets-Africa/config.highcarbon.yaml"
  "/home/alex-charly/AP3/analyse-h2g-a-ap3-eu/config/H2Global-meets-Africa/config.lowcarbon.yaml"
  "/home/alex-charly/AP3/analyse-h2g-a-ap3-eu/config/H2Global-meets-Africa/config.highH2demand.yaml"
  "/home/alex-charly/AP3/analyse-h2g-a-ap3-eu/config/H2Global-meets-Africa/config.main.yaml"
) 

for cfg in "${cfgs_scenarios[@]}"; do
  echo "Running $cfg"
  if snakemake \
    --cores 32 \
    --rerun-incomplete \
    --configfile "$cfg"; then
    echo "Run for $cfg finished successfully."
  fi
done

