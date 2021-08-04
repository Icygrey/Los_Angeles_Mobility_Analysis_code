#!/bin/bash
#SBATCH --time=01:00:00
#SBATCH --array=1
#SBATCH --mem=32GB
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
 
#module load usc geos proj gdal sqlite udunits freetype fontconfig cairo pandoc r 

cd /project/dconti_624/tao

Rscript --vanilla raw_la_sd.R