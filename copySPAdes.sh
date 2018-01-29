#!/bin/bash
##############################
### Copywright Zhen Li 2017### 
##############################
# This script is used after SPAdes de novo assemble. 
# It copies the contigs.fasta file in each sample folder into a fasta file named after the sample folder name. 
# It then moves the new fasta files from each folder into a new folder name "contigfiles". 

mkdir contigfiles

for dir in *_output; do
	pushd $dir	
	base_dir=$(basename $dir)
	echo ${base_dir}
	target_filename=${base_dir/_output/.fasta} 
	touch ${target_filename}
	cp contigs.fasta  ${target_filename}
	mv ${target_filename} ../contigfiles	
	popd
done

