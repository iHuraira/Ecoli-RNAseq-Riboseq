process fetch_sra_files {
    conda "./envs/sra_tools.yaml"

    input:
    val sample

    output:
    tuple val(sample), path("${sample.run}/${sample.run}.sra")

    publishDir "./results/${sample.data_type}/${sample.genotype}/${sample.treatment}/${sample.nutrient_concentration}/${sample.replicate}/Sra",
        mode: 'copy'

    script:
    """
    prefetch ${sample.run}
    """
}
