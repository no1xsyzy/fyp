---
title: 'Outline for Interim Report'
author: 'Siyuan XU, SBC-14-1014'
date: 2017-10-30
biblio-style: 'authoryear-ibid'
biblio-title: 'Bibliography'
biblatexoptions:
  - 'backend=bibtex'
bibliography:
  - references.bib
csl: iso690-numeric-en.csl
...

# Introduction

## Reactive Systems

1. Organizations are building "reactive" systems [@reactive_manifesto]
2. Better for applications nowadays [@whatisreactiveprogramming]
3. Responsive, Resilient, Elastic, Message Driven [@rp_vs_rs]
4. There are not very good languages

## Microservices

1. Seperating the whole system into small pieces [@what_are_microservices]
2. Takes advantage of reactive systems [@reactive_microservice]
3. "Cloud" (computing, storage, etc.) [@cloud_computing]
4. Easy tools to automatically operations. (Docker, Kubernetes, etc.)

## Performance vs Ease

1. Low level languages (C, C++, etc.) run fast [@performance_comparison]
2. But difficult to develop with
3. High level languages (Python, JavaScript, etc.) are easy to develop with [@python_slow_dont_care]
4. But slow in runtime [@why_high_level_slow] [@haswell_cache_cycles]

## Better Workflow

### Modularization

1. Modularization is important in cooperating programming. [@CathedralBazaar]
2. De-coupling is important in modularization; with object-oriented, de-coupling is not ensured [@mezini2004variability]; with reactive paradigm, de-coupling is ensured.
3. Modularization before programming.

### Premature Works

1. Premature optimizaiton is not good. [@knuth_1974, vol. 6]
2. Premature design is not good. [@graham_2004, vol. 2]
3. Tinker on the fly makes programmer prevents premature optimizaiton and premature design.

## Other Problems about Existing Languages

1. Too many hidden traps in common languages [@c_trap_pitfall]
2. (Too) much effort to implement logging or debugging or bug reporting [@log4c] [@python_logging]
3. Almost impossible to reproduce the runtime
4. Cannot tinker/hack upon program on the fly [@on-the-fly_programming] [@wang2004fly]

## Aims and Objectives

Make a programming language which (is):

* Uses "reactive" principle
* Helps to design "reactive" systems
* Easy to develop with
* Runs fast
* Helps to split programs into modules quickly
* Supports on-the-fly Programming
* Exposes all "traps"
* Built-in logging/debugging
* Easy to Reproduce Any Runtime Events

# Literature Review

# Plan

\clearpage

# References
