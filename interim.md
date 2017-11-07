---
title: 'Outline for Interim Report'
author: 'Siyuan XU, SBC-14-1014'
date: 2017-10-30
biblio-style: 'authoryear-ibid'
biblio-title: 'Bibliography'
biblatexoptions:
  - 'backend=bibtex'
bibliography:
  - reactivemanifesto.bib
  - whatisreactiveprogramming.bib
  - frp.bib
  - rpvsrs.bib
csl: iso690-numeric-en.csl
...

# Introduction

## Reactive Systems

Nowadays, organizations of different industries and fields are building systems with similar proception, which is called "reactive".[@reactive_manifesto]
Reactive systems fits better with today applications in many ways: [@whatisreactiveprogramming]

* Responsive. Users are requiring quicker and quicker response from service. Traditional applications are difficult to guarantee a quick response.
* Resilient. The system must endure a level of failure. Failure here means unpredictable. Old systems deal with failure by killing the whole system instead of keeping running.
* Elastic. Reactive systems can react to the load, which means less waste of computing resources and the ability just fits the demand.
* Message driven. By using message driven method, the system is allowed to be de-coupled of time and of space. This is the base of resilience and elasticity.
