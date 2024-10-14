file_samples = ["file"] 
selection_file = "standard_selection.tsv"

rule all:
    input:
        "sorted_bed_file_per_sample/file_filtered_sorted.bed"

rule filter_bed_by_chromosome:
    input:
        file_a="/home/ashish-gautam/workplace/project1/data/shuf.a.bed",
        file_b="/home/ashish-gautam/workplace/project1/data/shuf.b.bed",
        chrom_order=selection_file
    output:
        "file_filtered.bed"  
    shell:
        """
        cat {input.file_a} {input.file_b} | \
        grep -w -F -f {input.chrom_order} > {output}
        """

rule sort_bed_file:
    input:
        "file_filtered.bed",
        chrom_order=selection_file
    output:
        "sorted_bed_file_per_sample/file_filtered_sorted.bed" 
    shell:
        """
        awk 'BEGIN {{
            while ((getline k < "{input.chrom_order}") > 0) {{
                order[k] = ++i; 
            }}
        }} 
        {{
            if ($1 in order) {{
                print order[$1], $0; 
            }}
        }}' {input[0]} | sort -n | cut -d' ' -f2- > {output}
        """

