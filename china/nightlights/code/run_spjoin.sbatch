#!/bin/sh

#SBATCH --job-name=NTL_china_sp_join
#SBATCH --output=slurmlogs/Nightlights_China_sp_join%j.out
#SBATCH --error=slurmlogs/Nightlights_China_sp_join%j.err
#SBATCH --array=10-60:10
#SBATCH --time=10:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=10g
#SBATCH --mail-type=END,FAIL

module load geos/3.7.0
module load gdal/2.3.2
module load udunits/2.2
module load proj/4.9
module load R

Rscript sp_join.R "$(cat ../input/proj4string.txt | sed 's/mm/m/') " $geo $year ${SLURM_ARRAY_TASK_ID} > sp_join.log
