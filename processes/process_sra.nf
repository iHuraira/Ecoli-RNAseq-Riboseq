process fasterq_dump {
    conda "./envs/sra_tools.yaml"

    input:
    tuple val(sample), path(sra_file)

    output:
    tuple val(sample), path("*.fastq")

    publishDir "./results/${sample.data_type}/${sample.genotype}/${sample.treatment}/${sample.nutrient_concentration}/${sample.replicate}/Fastq",
        mode: 'copy'

    script:
    """
    fasterq-dump ${sra_file} --split-files --outdir .
    """
}
