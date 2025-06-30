process sra_download {
    tag "$sra_id"

    input:
    val sra_id

    output:
    file "${sra_id}.sra"

    conda = 'envs/sra_tools.yaml'

    publishDir 'results/sra', mode: 'copy', saveAs: { file -> "${sra_id}/${file}" }

    script:
    """
    prefetch $sra_id --output-directory .
    mv ${sra_id}/${sra_id}.sra .
    """
}
