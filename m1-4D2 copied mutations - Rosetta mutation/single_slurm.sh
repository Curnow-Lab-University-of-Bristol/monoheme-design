#!/bin/bash

#SBATCH --job-name=TMm4D2
#SBATCH --partition=veryshort
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=6:00:00
#SBATCH --mem=6GB

module purge
module load apps/rosetta/3.12

rosetta_scripts.static.linuxgccrelease @flags -out:prefix ${SLURM_JOBID}_ -out:suffix design_${SLURM_ARRAY_TASK_ID}
