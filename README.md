it process the current variable as "file"  
The workflow begins by taking user-defined input for chromosome selection from "standard_selection.tsv."

The rule all provides the final output file is named "file_filtered_sorted.bed."  


# Filtering and Merging

The filtering rule merges two BED files, "shuf.a.bed" and "shuf.b.bed," based on the specified chromosome selection.  


# Sorting and Organizing

The sorting rule utilizes an AWK command to organize the filtered data according to the specified chromosome order.  


