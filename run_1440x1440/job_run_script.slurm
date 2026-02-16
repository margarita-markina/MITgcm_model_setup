#!/bin/bash

# Slurm job options (job-name, compute nodes, job time)
#SBATCH --job-name=CTRL_ABS_NO_SUBMESO
#SBATCH --time=23:59:0
#SBATCH --nodes=5
#SBATCH --tasks-per-node=123
#SBATCH --cpus-per-task=1

# Replace [budget code] below with your project code (e.g. t01)
#SBATCH --account=n01-SNAPD 
#SBATCH --partition=standard
#SBATCH --qos=standard

#SBATCH --mail-user=margarita.markina@earth.ox.ac.uk
#SBATCH --mail-type=begin
#SBATCH --mail-type=end

# Setup the job environment (this module needs to be loaded before any other modules)
module load epcc-job-env
#module load cray-netcdf/4.7.4.2

# these next 3 lines are not used in the code, it's just for us to keep in mind tile separation and number of cpu used
nprocs=615
snx=45
sny=45

# Set the number of threads to 1
#   This prevents any threaded system libraries from automatically
#   using threading.
export OMP_NUM_THREADS=1


# Launch the parallel job
#   Using 256 MPI processes and 128 MPI processes per node
#   srun picks up the distribution from the sbatch options
srun --distribution=block:block --hint=nomultithread ./mitgcmuv




