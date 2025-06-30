nextflow.enable.dsl=2

include { sra_download } from './modules/sra_download.nf'

workflow {

    sra_id = Channel
            .fromPath('data/sample_info.csv')
            .splitCsv(header: true)
            .map { row -> row.sra_id}

    sra_files = sra_download(sra_id)

}
