// enable dsl2
nextflow.enable.dsl=2


// Define a help message
def helpMessage = """
Usage:
    nextflow run poxer --illuminaShotgun --inDir reads --outDir results --refGenome

Options:
    --help                  Show this help message and exit
    --inDir                 Directory containing the raw reads
    --outDir                Directory of the results
    --refGenome             Path of the reference genome fasta file

Choose only one workflow.
    --illuminaShotgun       Run using the Illumina shotgun workflow
"""


// Check if help parameter is invoked and display help message
if (params.help) {
    println helpMessage
    exit 0
}


// import subworkflows
include {illuminaShotgun} from './workflows/illumina-wf.nf'

illuminaShotgun

workflow {
    main:
        if (params.illuminaShotgun) {
            illuminaShotgun()
        }

        else {
            println helpMessage
        }
}