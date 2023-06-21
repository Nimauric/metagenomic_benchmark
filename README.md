# metagenomic_benchmark
## Description
The aim of this repository is to compare long-reads metagenomic assemblers, focusing on hi-fi assemblers, but with support for lo-fi long reads assemblers and hybrid assemblers.

## Installation
Clone the repository in a cluster with slurm and conda support, then source initialise_environnement.sh

## Usage
Edit the config.yaml file to indicate which assemblers and metrics to use by commenting/uncommenting the relevant lines, and to indicate the name (used for producing output folders) and path to runs of reads.


Place your runs.fastq in the data/input_reads/ folder. If your file names aren't a SRA reference, write, for each run, a new file in ../data/runs_metadata called <name_of_the_run(without the .fastq extension)>.txt, and containing the name of the sequencing technology used : either "PacBio RS II", "MinION", or "pacbio-hifi".

If you want references based metrics, place your reference_genomes.fasta in the data/input_reference_genomes/ folder.

Edit the config/config.yaml file to both indicate which assemblers and metrics you wish to use, and to indicate to the pipeline which runs to process. Then, run (or schedule with sbatch) pipeline.sh
## Pipeline 

![dag](dag.pdf)

## Files
#### config : 
 - config.yaml : used to tell the pipeline which reads to assemble with which assemblers
 - initialise_environnement.sh : creates folders and sets up a conda environement
 - activate_environement.sh : activates the aforementioned conda environement 

#### workflow :
 - Snakefile : the pipeline itself
 - pipeline.sh : activates the environement, then calls snakemake

#### workflow/auxiliary : 
Unsupported files that are not directly involved in the pipeline, but might be (or have been) useful to prepare or analyze data

#### workflow/scripts :
 - reads_quality_checker.sh : checks the reads quality using fastQC
 - sequencer_fetcher.sh : fetches the sequencer used by a run, either from a file or from the sra database
 - metaflye_assembler.sh : assemble metagenomes using metaflye
 - canu_assembler.sh : assemble metagenomes using canu
 - miniasm_assembler.sh : assemble metagenomes using minimap, miniasm and awk
 - flye_polisher.sh : polishes metagenome assemblies with flye
 - references_free_stats.sh : checks the quality of the assemblies by checking the proportion of reads mapping to the assembly
 - references_free_stats.cpp : checks the quality of the assemblies with length-based metrics
 - references_merger.sh : congreate references genomes in a single file to help with coverage calculation
 - coverage_calculator.sh : map reads to reference genomes to infer their sequencing debth
 - assembly_quality_checker.sh : checks the quality of the assemblies using metaquast
 - references_based_stats.py : aggregates metaquast metrics and group them depending on the species abudance.


