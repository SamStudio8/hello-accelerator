#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process sayHelloFast {
  input:
    val x
  output:
    stdout
  accelerator 1
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHelloFast | view
}
