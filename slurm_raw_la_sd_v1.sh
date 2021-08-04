#!/bin/bash
#SBATCH --time=02:00:00
#SBATCH --array=1
#SBATCH --mem=0
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=24
 
#module load usc geos proj gdal sqlite udunits freetype fontconfig cairo pandoc r 

cd /project/dconti_624/tao

Rscript --vanilla raw_la_sd_v1.R