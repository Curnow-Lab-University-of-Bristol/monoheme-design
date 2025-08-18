#!/bin/bash

#SBATCH --job-name=ESMrelax
#SBATCH --partition=cpu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3-00:0:00
#SBATCH --mem=6GB
#SBATCH --array=1-28

module load apps/rosetta/3.13

rosetta_scripts.serialization.linuxgccrelease @flags_relax -out:suffix ${SLURM_ARRAY_TASK_ID} -out:prefix $SLURM_JOBID -out:file:silent struct_$SLURM_ARRAY_TASK_ID

