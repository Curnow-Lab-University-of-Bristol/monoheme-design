#!/bin/bash
#SBATCH --nodes=1
#SBATCH --partition=veryshort
#SBATCH --ntasks-per-node=1
#SBATCH --time=1:00:00
#SBATCH --nodes=1
#SBATCH --output=inv_m4D2_thread.out
#SBATCH --account=CHEM023222

module load apps/rosetta/3.12
module load languages/anaconda3/3.6.5

echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`

RANDOM=$(date +%s)
RANDOM2=$(date +%s)
rosetta_scripts.static.linuxgccrelease -s 4D2_112res.pdb \
-database /mnt/storage/software/apps/Rosetta-3.12/rosetta_bin_linux_2020.08.61146_bundle/main/database \
-parser:protocol thread_passvariable.xml \
-parser:script_vars sequence=GSPELREKHRALAEQVYATWQELLKNTSNSPELREKLRALIEQVYATGQEMLKNGSVSPSPELREKHRALAEQVIATWQELLKNTSNSPELREKFRALLEQVYATGQEMLKN
\
-chain A \
-ignore_zero_occupancy false \
-out:suffix $RANDOM$RANDOM2 \
-overwrite \



