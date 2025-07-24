process trim_sequences {

    conda "./envs/trim_sequences.yaml"

    input:
    tuple val(sample), path(fastq_file)

    output:
    tuple val(sample), path("*fastq")

    publishDir "./results/${sample.data_type}/${sample.genotype}/${sample.treatment}/${sample.nutrient_concentration}/${sample.replicate}/Trim",
    mode: 'copy'

    script:
    """
        trimmomatic SE -threads 4 \
        ${fastq_file} \
        ${sample.run}_trimmed.fastq \
        ILLUMINACLIP:assets/adapters/TruSeq3-SE.fa:2:30:10 \
        LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
    """

}