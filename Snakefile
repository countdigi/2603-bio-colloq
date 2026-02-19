# Snakefile

SAMPLES = ["a", "b", "c"]

rule all:
    input: 
       expand("tmp/wrk/result.csv"),

rule filter:
    input:
        csv="data/{sample}.csv",
    output:
        csv="tmp/wrk/filter/{sample}.csv",
    params:
        threshold="50",
    shell:
        """
        awk -F: '{{ if ($3 >= {params.threshold} ) print }}' {input.csv} > {output.csv} 
        """

rule result:
    input:
        csvs=expand("tmp/wrk/filter/{sample}.csv", sample=SAMPLES),
    output:
        csv="tmp/wrk/result.csv",
    threads:
        2
    resources:
        mem="1G",
        runtime="1h",
    shell:
        """
        # add header from first element in array csvs

        head -n1 {input.csvs[0]} > {output.csv}

        # append all results from all files in version-sort sorted order

        for csv in {input.csvs}; do
          tail -n+2 $csv
        done \
        | sort --version-sort >> {output.csv}
        """

# vim: filetype=snakemake tabstop=4 shiftwidth=4 softtabstop=4 expandtab
