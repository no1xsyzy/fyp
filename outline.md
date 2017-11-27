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

## Other Problems about Existing Languages

1. Too many hidden traps in common languages
2. (Too) much effort to implement logging or debugging or bug reporting
3. Almost impossible to reproduce the runtime

## Aims and Objectives

Make a programming language which (is):

* Uses "reactive" principle
* Helps to design a "reactive" system
* Easy to develop
* Runs fast
* Built-in logging/debugging
* Exposes every programming traps

# Literature Review

# Plan

\clearpage
