process fastqcRawPE {
    container 'staphb/fastqc:0.12.1'

    tag "Checking quality of ${sample}"

    publishDir (
    path: "${params.outDir}/${task.process.replaceAll(":","_")}",
    mode: 'copy',
    overwrite: 'true'
    )

    input:
    tuple val(sample), path(fastq_1), path(fastq_2)

    output:
    tuple val(sample), path("*fastqc*"), emit: qualRaw


    script:
    """
    fastqc --outDir . $fastq_1 $fastq_2
    """
}


process fastqcTrimmedPE {
    container 'staphb/fastqc:0.12.1'

    tag "Checking quality of ${sample}"

    publishDir (
    path: "${params.outDir}/${task.process.replaceAll(":","_")}",
    mode: 'copy',
    overwrite: 'true'
    )

    input:
    tuple val(sample), path(fastq_1), path(fastq_2)

    output:
    tuple val(sample), path("*fastqc*"), emit: qualTrimmed


    script:
    """
    fastqc --outDir . $fastq_1 $fastq_2
    """
}