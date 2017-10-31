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
csl: iso690-numeric-en.csl
...

#Introduction

## Reactive Manifesto

1. Organizations are building "reactive" systems [@reactive_manifesto]
2. Better for applications nowadays
3. More flexible, more scalable, more robust, more resilient
4. There is not very good pattern
5. Using sequential language to create such system sucks

## Microservices

1. Seperating the whole system into small pieces
2. Takes advantage of reactive systems
3. "Cloud" (computing, storage, etc.)
4. Easy tools to automatically operations. (Docker, Kubernetes, etc.)
5. Difficult to design

## Performance vs Ease

1. Low level languages (C, C++, etc.) run fast
2. But difficult to develop with
3. High level languages (Python, JavaScript, etc.) are easy to develop with
4. But slow in runtime

## Other Problems about Existing Languages

1. (Too) much effort to implement logging or debugging or bug reporting
2. Almost impossible to reproduce the runtime
3. Too many hidden traps in common languages

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
