params.file_name = "data/sample_info.csv"

include { fetch_sra_files } from './processes/fetch_sra.nf'
include { fasterq_dump } from './processes/process_sra.nf'
include { quality_check as pre_quality_check } from './processes/quality_check.nf'
include { quality_check as post_quality_check } from './processes/quality_check.nf'
include { trim_sequences } from './processes/trim_sequences.nf'


workflow {

    def samples = Channel
        .fromPath(params.file_name)
        .splitCsv(header : true, strip : true)
        .first()


    fetched_sra = fetch_sra_files(samples)

    fastq_files  = fasterq_dump(fetched_sra)

    pre_quality_check(fastq_files)

    trim_files = trim_sequences(fastq_files)

    post_quality_check(trim_files)

}
