---
title: 'Interim Report'
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

Nowadays, organizations of different industries and fields are building systems with similar proception, which is called "reactive". [@reactive_manifesto]
Reactive systems fits better with today applications in many ways: [@whatisreactiveprogramming]

* Responsive. Users are requiring quicker and quicker response from service. Traditional applications are difficult to guarantee a quick response.
* Resilient. The system must endure a level of failure. Failure here means unpredictable problem of the runtime environment, such as lack of memory or network breakdown or natural disasters. Old systems deal with failure by killing the whole system instead of keeping running.
* Elastic. Reactive systems can react to the load, which means less waste of computing resources and the ability just fits the demand.
* Message driven. By using message driven method, the system is allowed to be de-coupled of time and of space. This is the base of resilience and elasticity.

Also, there are many techniques to achieve it. Futures or promises can set up what will be executed next after former result has been retrieved or former operation is completed. Streams can set up flows of data without any coupling behaviour. Dataflow can ensure data change repectively among different parts of system. [@rp_vs_rs]

There haven't been really good languages to write a reactive system. Most popular languages are based on object-oriented programming paradigm, which emphasizes on packing properties and methods in one object, just like how we understand the realworld. Another programming paradigm is called functional programming, which comes from pure mathematics. Neither of them is good for representing data exchanges between parts of the whole application. What's more, those languages are still imperative language, which need codes to "assign" them together.
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

Lower level languages like C or C++ runs fast than higher level languages such as Python or JavaScript. [@performance_comparison] Cache misses and garbage collection may be the main reason of their slowness. [@why_high_level_slow] For Haswell microarchitecture, reading in RAM is about 50 times slower than reading in level one cache. [@haswell_cache_cycles] Most high level languages are slow because they don't take advantages of caches, and uses expensive garbage collection.

However, ease in development is another issue. First, there is less typing in dynamic typeless languages. [@scripting] Developing in dynamic languages are usually of 2 times the speed of development in static languages. The length of the resulting programs are also of this ratio. [@prechelt2000empirical] Generally, dynamic languages can produce more concise programs. [@nanz2015comparative]

## Other Problems about Existing Languages

### Hidden Traps in Languages

There are many traps in C language. [@c_trap_pitfall] Lexical, syntatic pitfalls, and semantic pitfalls are three types of common pitfalls in many languages. Most of the time, the traps comes from functions that are not pure functions. The word "pure" has meanings in two aspects. In one hand, there is no side effect, i.e., nothing will be changed by pure function. In the other hand, the parameters passed to it are the only factors that will change the output of the function. In other words, the only data exchanges between pure functions and the outside are parameters and returning values.
<!-- TODO: citation needed -->

Traps are necessary for many programs. A program usually have to change particular files to output the procession result. There is usually display on screen and many other side effects. Even in languages famous for its pure function, such as Haskell or Erlang, there is still impure parts. However, what makes it a bad thing is that many traps are just hidden by the language. Pure functions and impure functions are just thrown together and expecting the programmers to remember or investigate documentations of every function and method.

### Too Much Effort to Log

Most programming languages require too much effort to create a log system.

For example, a logging library in C language `log4c` [@log4c] contains 25 files to produce a complete logging library, while logging with this logging library is still complicated. There are extra lines of codes that initiaze and clean up runtime of the library. To make matters worse, logging methods

In python language, logging is usually done with its standard library `logging` [@python_logging], which is designed to be "pythonic". It enhances simplicity while keeps customizability. Logging with this library requires little coding about initiazation. Summarizingly say, there is only one line importing the library, and all other lines with logging library has some actual effect, such as setting up log file path or filter some logs out.

###

## Aims and Objectives
