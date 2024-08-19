// enable dsl2
nextflow.enable.dsl=2


// import modules
include {fastp} from '../modules/illumina/fastp.nf'
include {fastqcRawPE} from '../modules/misc/fastqc.nf'
include {fastqcTrimmedPE} from '../modules/misc/fastqc.nf'
include {minimap2PE} from '../modules/misc/minimap2.nf'



workflow illuminaShotgun {
    Channel
        .fromFilePairs("${params.inDir}/*{,.trimmed}_{R1,R2,1,2}{,_001}.{fastq,fq}{,.gz}", flat:true)
        .ifEmpty{error "Cannot find any reads matching: ${params.inDir}"}
        .set{ch_sample}
        

    main:
        fastqcRawPE(ch_sample)
        //fastp(ch_sample)
        //fastqcTrimmedPE(fastp.out.trimmed)

        //minimap2PE(fastp.out.trimmed)

}