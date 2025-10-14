#!/bin/bash
cfgs_GreenDeal=(
  "/home/alex-charly/SSD/H2GMA/Github/AP10/analyse-h2g-a-ap10/config/base-wp10-overnight/config.GreenDeal_2030.yaml"
  "/home/alex-charly/SSD/H2GMA/Github/AP10/analyse-h2g-a-ap10/config/base-wp10-overnight/config.GreenDeal_2050.yaml"
) 

cfgs_BAU=(
  "/home/alex-charly/SSD/H2GMA/Github/AP10/analyse-h2g-a-ap10/config/base-wp10-overnight/config.BAU_2030.yaml"
  "/home/alex-charly/SSD/H2GMA/Github/AP10/analyse-h2g-a-ap10/config/base-wp10-overnight/config.BAU_2050.yaml"
)

for cfg in "${cfgs_GreenDeal[@]}"; do
  echo "Running $cfg"
  if snakemake \
    --cores 32 \
    --rerun-incomplete \
    --resources mem_mb=480000 \
    --configfile "$cfg"; then
    echo "Run for $cfg finished successfully."

    # Zielordner
    folder="results/base-wp10-overnight/config.GreenDeal"
    fname=$(basename "$cfg" .yaml)  

    if [ -d "$folder" ]; then
      mv "$folder" "results/base-wp10-overnight/${fname}"
      echo "Renamed $folder → results/base-wp10-overnight/${fname}"
    fi
  fi
done

for cfg in "${cfgs_BAU[@]}"; do
  echo "Running $cfg"
  if snakemake \
    --cores 32 \
    --rerun-incomplete \
    --resources mem_mb=480000 \
    --configfile "$cfg"; then
    echo "Run for $cfg finished successfully."

    folder="results/base-wp10-overnight/config.BAU"
    fname=$(basename "$cfg" .yaml)

    if [ -d "$folder" ]; then
      mv "$folder" "results/base-wp10-overnight/${fname}"
      echo "Renamed $folder → results/base-wp10-overnight/${fname}"
    fi
  fi
done
