---
title: 'Interim Report'
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
  - microservices.bib
  - reactivemicroservice.bib
  - cloudcomputing.bib
csl: iso690-numeric-en.csl
...

# Introduction

## Reactive Systems

Nowadays, organizations of different industries and fields are building systems with similar proception, which is called "reactive". [@reactive_manifesto]
Reactive systems fits better with today applications in many ways: [@whatisreactiveprogramming]

* Responsive. Users are requiring quicker and quicker response from service. Traditional applications are difficult to guarantee a quick response.
* Resilient. The system must endure a level of failure. Failure here means unpredictable problem of the runtime environment, such as lack of memory or network breakdown or natural disasters. Old systems deal with failure by killing the whole system instead of keeping running.
* Elastic. Reactive systems can react to the load, which means less waste of computing resources and the ability just fits the demand.
* Message driven. By using message driven method, the system is allowed to be de-coupled of time and of space. This is the base of resilience and elasticity.

Also, there are many techniques to achieve it. Futures or promises can set up what will be executed next after former result has been retrieved or former operation is completed. Streams can set up flows of data without any coupling behaviour. Dataflow can ensure data change repectively among different parts of system. [@rp_vs_rs]

There haven't been really good languages to write a reactive system. Most popular languages are based on object-oriented programming paradigm, which emphasizes on packing properties and methods in one object, just like how we understand the realworld. Another programming paradigm is called functional programming, which comes from pure mathematics. Neither of them is good for representing data exchanges between parts of the whole application. What's more, trying to build a reactive system in those languages still need sequential codes instead of markups to assign all those parts together.
<!-- TODO: citation needed -->

Briefly, reactive systems are good but hard to create.

## Microservices

Microservice architecture is a designing style that assembles a number of loosely-coupled parts, called microservices, into a complete application. [@what_are_microservices]
This kind of architecture can take advantage of reactive design. Loose coupling means message driven, which enables use of reactive programming paradigm. Each microservice is isolated so that failure will not result in larger failure, and any failure can be solved by each part. [@reactive_microservice] Isolation is the core concept of the microservices: it is the source of all its advantages.

"Cloud" seems to be providing an easy way to solve failures: when one server failed, just delete it and create a new one. It has been greatly affected by microservice architecture and thus is similar to how microservices works.
An interesting metaphor explains it vividly. Traditional ways to operate a server is like raising a pet, with naming and curing. Cloud servers are like cattles, with numbering and sending to curer. Cloud servers with container and microservices are like chicken, with counting and abandoning. Each is profitting more than the former by intergrating management. [@cloud_computing]

Container technology is an important part of the microservices. With container, the isolation is guaranteed in system level without any understanding to the low-level implementation details. In addition, automatic deployment, scaling and management makes things even easier. Deleting failed server and setting up a new server becomes so easy.
<!-- TODO: citation needed -->

However, those tools will not concern the links between microservices, but just throw all of these parts together and expecting them work as expected. It is not message driven but isolation that is guaranteed. Designs may lead to well isolated but strongly coupled parts. It has advantages of isolation, but still keeps unnecessary complexities in development.
<!-- TODO: citation needed -->

Briefly, microservice architecture is a good try to build reactive systems.

## Performance vs Ease

## Other Problems about Existing Languages

## Aims and Objectives
