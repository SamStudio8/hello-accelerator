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

process sayHelloSlow {
  input:
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  Channel.of('Bonjoooour', 'Ciaoooo', 'Helloooo', 'Hoooola') | sayHelloSlow | view
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola') | sayHelloFast | view
}
