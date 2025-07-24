process quality_check {
    conda "./envs/quality_check.yaml"

    input:
    tuple val(sample), path(fastq_file)

    output:
    tuple val(sample), path("${fastq_file.baseName}_fastqc.html"), path("${fastq_file.baseName}_fastqc.zip")

    publishDir "./results/${sample.data_type}/${sample.genotype}/${sample.treatment}/${sample.nutrient_concentration}/${sample.replicate}/Pre_QC",
    mode: 'copy'

    script:
    """
    fastqc ${fastq_file}
    """
}
