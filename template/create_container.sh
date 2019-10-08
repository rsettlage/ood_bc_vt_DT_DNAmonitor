#!/bin/bash

###########################################################################
### this scripts creates singulairyt containers, needed to ensure full node
### sbatch --account=useralloc --export=NONE,IMAGE=image SLURM_create_sif.sh
###########################################################################

####### job customization
##SBATCH --job-name=NGS-QC-control
##SBATCH -N 1
##SBATCH --exclusive
##SBATCH -t 01:00:00
##SBATCH -p normal_q
####SBATCH -A ondemand2
##SBATCH --mail-user=rsettlag@vt.edu
##SBATCH --mail-type=FAIL

###########################################################################
echo building Singularity container
date '+%D %T'
echo running on `hostname`
echo in job $SLURM_JOB_ID
echo with tmpfs $TMPFS
echo with tmpdir $TMPDIR
## echo quick peek at tmpdir
## ls -lh /scratch-local/
###########################################################################
echo
echo

module load singularity

set -x
export http_proxy="http://uaserve.cc.vt.edu:8080"; export https_proxy="http://uaserve.cc.vt.edu:8080"
unset XDG_RUNTIME_DIR

# pull the RStudio Server
singularity pull --force $1

echo
echo
###########################################################################
echo finishing script
date '+%D %T'
