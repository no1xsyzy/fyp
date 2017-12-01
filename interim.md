---
title: 'Design and Implementation of a new Programming Language and a new Programming Paradigm'
subtitle: 'Interim Report'
author: 'Siyuan XU (SBC-14-1014) \thanks{Supervised by Mr. J.C. Abad}'
date: 'Friday, December 1st, 2017'
biblio-style: 'authoryear-ibid'
biblio-title: 'Bibliography'
biblatexoptions:
  - 'backend=bibtex'
bibliography:
  - references.bib
csl: iso690-numeric-en.csl
link-citations: true
toc: true
toc-depth: 3
fontsize: 11pt
linestretch: 1.5
mainfont: Times New Roman
geometry:
  - left=30mm
  - top=20mm
  - right=20mm
  - bottom=30mm
...

\clearpage\pagestyle{fancy}\setcounter{page}{1}

# Introduction

Argument about the best programming language have been existing for a long time. [@nanz2015comparative] However, The best programming language should change over time as a result of progress in hardware. [@graham_2004, chap. 11] Trends nowadays shows that more and more dynamic languages are being used and they are less complaint about its slowness. Then how will programming languages be if all preconceptions of language are banished and all efficiency bounds are removed? That will be a challenging question.

There are some aspects that is very probably unchanged or even more highlighted after years of evolution. The first point of attention should be learning difficulty. Requirements for skilled programmers are becoming stronger and stronger. In other word, it is essential that a programming is easy to learn and to use. Second point of analysis may be less useless concerns. With the growth in complexity and scale of system to be built, if the connections between different parts in the system keeps working like an inseperable, coherent whole, the system will quickly become unmaintainable. The last part may be code reusing. It is a waste of human resource to invent the wheel again. So it is a good and obvious approach to improve efficiency by code reusing.

Focusing on the above aspects, it is possible to make a really best language. Along with understandings of recent trends of languages and programming, a more future-oriented language can be designed and implemented. Balance between removing prejudice on language and considering recent trends should also be considered carefully.

The aim of the project is to design a future-oriented programming language, which should include the following advantages:

* Uses "reactive" principle
* Helps to design "reactive" systems
* Easy to develop with
* Runs fast
* Helps to split programs into modules quickly
* Supports on-the-fly Programming
* Exposes all "traps"
* Built-in logging/debugging
* Easy to reproduce any runtime events

# Literature Review

## Reactive Systems

Nowadays, organizations of different industries and fields are building systems with similar proception, which is called "reactive". [@reactive_manifesto]
Reactive systems fits better with today applications in many ways: [@whatisreactiveprogramming]

* Responsive. Users are requiring quicker and quicker response from service. Traditional applications are difficult to guarantee a quick response.
* Resilient. The system must endure a level of failure. Failure here means unpredictable problem of the runtime environment, such as lack of memory or network breakdown or natural disasters. Old systems deal with failure by killing the whole system instead of keeping running.
* Elastic. Reactive systems can react to the load, which means less waste of computing resources and the ability just fits the demand.
* Message driven. By using message driven method, the system is allowed to be de-coupled of time and of space. This is the base of resilience and elasticity.

Also, there are many techniques to achieve it. Futures or promises can set up what will be executed next after former result has been retrieved or former operation is completed. Streams can set up flows of data without any coupling behaviour. Dataflow can ensure data change repectively among different parts of system. [@rp_vs_rs]

There haven't been really good languages to write a reactive system. Most popular languages are based on object-oriented programming paradigm, which emphasizes on packing properties and methods in one object, just like how we understand the real world. [@oop] Another programming paradigm is called functional programming, which comes from pure mathematics. [@functional_programming] Neither of them is good for representing data exchanges between parts of the whole application. What's more, those languages are still imperative language, which need codes to "assign" them together.

Briefly, reactive systems are good in varies of aspects but hard to create.

## Microservices

Microservice architecture is a designing style that assembles a number of loosely-coupled parts, called microservices, into a complete application. [@what_are_microservices]
This kind of architecture can take advantage of reactive design. Loose coupling means message driven, which enables use of reactive programming paradigm. Each microservice is isolated so that failure will not result in larger failure, and any failure can be solved by each part. [@reactive_microservice] Isolation is the core concept of the microservices: it is the source of all its advantages.

"Cloud" seems to be providing an easy way to solve failures: when one server failed, just delete it and create a new one. It has been greatly affected by microservice architecture and thus is similar to how microservices works.
An interesting metaphor explains it vividly. Traditional ways to operate a server is like raising a pet, with naming and curing. Cloud servers are like cattles, with numbering and sending to curer. Cloud servers with container and microservices are like chicken, with counting and abandoning. Each is profitting more than the former by intergrating management. [@cloud_computing]

Container technology is an important part of the microservices. With container, the isolation is guaranteed in system level without any demand for understanding to the low-level implementation details. [@fink2014docker] In addition, automatic deployment, scaling and management makes all the matters even easier. [@balalaie2016microservices] Deleting failed server and setting up a new server becomes so easy that many cooperations prefer to run their service in that way. [@balalaie2016microservices]

However, those tools will not concern the links between microservices, but just throw all of these parts together and expecting them work as expected. [@container_communication] It is not message driven but isolation that is guaranteed. Designs may lead to well isolated but strongly coupled parts. It has advantages of isolation, but still keeps unnecessary complexities in development.

Briefly, microservice architecture is a good try to build reactive systems.

## Performance vs Ease

Lower level languages like C or C++ runs fast than higher level languages such as Python or JavaScript. [@performance_comparison] Cache misses and garbage collection may be the main reason of their slowness. [@why_high_level_slow] For Haswell microarchitecture, reading in RAM is about 50 times slower than reading in level one cache. [@haswell_cache_cycles] Most high level languages are slow because they don't take advantages of caches, and uses expensive garbage collection.

However, ease in development is another issue. First, there is less typing in dynamic typeless languages. [@scripting] Developing in dynamic languages are usually of 2 times the speed of development in static languages. The length of the resulting programs are also of this ratio. [@prechelt2000empirical] Generally, dynamic languages can produce more concise programs. [@nanz2015comparative] Learning difficulties will be also concerned. It obvious that a programming language that is easy to develop with should be also easy to learn.

Briefly, there are few programming languages that can run fast while be easy to develop with.

## Better Workflow

### Modularization

Modularization is important on cooperating programming. Modularization means the program is structured into seperated modules and each part do not wonder other parts. There are three aspects of importance. First, by assigning programmer to module, the programmer will feel responsible for the module of code, which raises the quality. Second, by assigning module to programmer, duplication of effort is prevented. Third, modularization makes the structure and architect of the program clear, which stick to the Keep It Simple Stupid principle and decreases learning cost. [@CathedralBazaar]

To achieve modularization, de-coupling is necessary. A program is never modularized if the codes from one module must depend on the implementation details of another module. Only if the modules are de-coupled, the program is modularized. In object-oriented paradigm, more works should be done to ensure de-coupling. [@mezini2004variability] In reactive paradigm, with message-driven base, the only way to sharing data between codes are message. With message as the only interface between modules, programs are forced to be de-coupled, thus truly modularized.

What's more, it will be essential if splitting modules can be done before programming. The earlier modules are splitted and made clear, the clearer programmers are about their parts. An inevitable problem is that modules are often splitted around a main module. This kind of splitting method usually takes long time.

Briefly, modularization is very import in cooperating programming, but requires much effort to achieve it.

### Premature Efforts

Premature efforts can hardly be good. Premature optimization usually leads to bad workflow. Making something done is more important than making it good. Doing optimizations too early is called premature optimization. Only after the critical code that lags the whole program has been found can we do efficient optimization. [@knuth_1974, vol. 6]

Premature design is also another bad pattern. Programming is more like painting than engineering. [@graham_2004, chap. 2] Making a final design is a dangerous thing because many of the aspects of a problem is made clear in the process of programming. This includes how it works, how its inside communication works and many other things to be decided.

In order to prevent the badnesses of premature efforts, good programming languages must be fully hackable. It must be very easy to tinker something around with this programming language. Even the programming is running, the running process must also be easy to tinker around. There must be time travelling feature, which allows to step back instead of forward, makes debugging easier. There must be hot module replacing, making it possible to change the implementation or even the functionality of a module. Injecting another module at any point should also be possible, since it is easier to patch than fully rewrite the whole module.

Briefly, premature efforts are usually harmful to programming and therefore should be prevented with better programming language.

## Other Problems about Existing Languages

### Hidden Traps in Languages

There are many traps in C language. [@c_trap_pitfall] Lexical, syntatic pitfalls, and semantic pitfalls are three types of common pitfalls in many languages. Most of the time, the traps comes from functions that are not pure functions. The word "pure" has meanings in two aspects. In one hand, there is no side effect, i.e., nothing will be changed by pure function. In the other hand, the parameters passed to it are the only factors that will change the output of the function. In other words, the only data exchanges between pure functions and the outside are parameters and returning values.
<!-- TODO: citation needed -->

Traps are necessary for many programs. A program usually have to change particular files to output the procession result. There is usually display on screen and many other side effects. Even in languages famous for its pure function, such as Haskell or Erlang, there is still impure parts. However, what makes it a bad thing is that many traps are just hidden by the language. Pure functions and impure functions are just thrown together and expecting the programmers to remember or investigate documentations of every function and method.

Briefly, many programming languages hide traps and add indetermination.

### Too Much Effort to Log

Most programming languages require too much effort to create a log system.

For example, a logging library in C language `log4c` [@log4c] contains 25 files to produce a complete logging library, while logging with this logging library is still complicated. There are extra lines of codes that initiaze and clean up runtime of the library. To make matters worse, logging methods

In python language, logging is usually done with its standard library `logging` [@python_logging], which is designed to be "pythonic". It enhances simplicity while keeps customizability. Logging with this library requires little coding about initiazation. Summarizingly say, there is only one line importing the library, and all other lines with logging library has some actual effect, such as setting up log file path or filter some logs out. But there are still different ways to logging. For example, the famous asynchronous library or framework `tornado` has its own logging system. If you use normal `logging`, the asynchronism will be broken.

Briefly, most existing programming languages are usually hard to log or have too many ways to log.

### Inability to Reproduce Problems

For most of the programs, it is really difficult to reproduce a runtime. After a bug or any problems occurred, when reporting it to the developer, users tend to think their environments be either certainties or regardless to the bug. But problems are usually relevant to the environment. For lack of necessary information, developers are usually hard to track down the bug, just because they do not have this kind of bug and they are not able to reproduce it. To make matters worse, users are usually unable to find out all the relevant environments. Free (libre) or open source software eliminate this issue by making the source code software accessible to users. [@CathedralBazaar] They can track down the bug by themselves. If they can know how the bug occur by themselves, they can help software developers to deal with problems. But this approach requires one assumption that users, at least users who are able to reproduce the problem, know how to problem. However, the truth is just opposite. Most users do not know about programming.

Briefly, most programming languages lack a way to reproduce the runtime.

### Inability to Change the Program on the Fly

Nowadays many interpreted languages are very easy to change. Unlike the compiled languages, it is very easy to change the content of a script file and rerun the whole software.

However, it is still difficult to change them on the fly. By "on the fly", it is meant that when you are debugging or even running the code, you can actually take full control over the runtime status of the program. [@on-the-fly_programming] [@wang2004fly] There are a few frameworks that allow on-the-fly programming and achieve it by a technique called hot module replacing. This technique mainly depends on splitting the code into different modules.

## Aims and Objectives

The aim of this project is to design and implement a new type of programming language, which should meet the following specifications.

### Uses "Reactive" Principle

As discussed above, reactive paradigm is useful in different aspects. This paradigm is going to be the main paradigm of this programming language. To use the principle of reactive, this language should be designed as natively message-driven. With basic layer of this language is message-driven,

### Helps to Design "Reactive" Systems

Reactive systems are difficult to design. With this language, it should be easier to design such reactive systems with its native support for the features of reactive paradigm.

### Easy to Develop With

This language should use dynamic types to enhance ease in development. What's mroe, the structure of program written in this language should be very clear.

### Runs Fast

This is not a prior target. Although it is attracting to have it fast, but it will not be so bad if it is slow. More importantly, it will be more an issue about the implementation than the language design.

### Helps to split programs into modules quickly

This feature should be done with design. With well design, any splitting of functions will be a subset of available splitting of modules in this language. In other words, one is able to split the functions and divide them into modules without any detailed consideration.

### Supports on-the-fly Programming

First, it should be hackable when debugging. As long as the program is changed, the interpreter should read the file again for new program and substitude current one with the new one.

### Exposes all "traps"

Any modules with programming "traps" should be explicitly marked the type of trap. Since traps are needed in every program, at least all traps should be stated clearly. The kind of trap should be part of the program.

### Built-in logging/debugging

By adding only one word to the program, the logging will be done automatically. If more logging features are required, it should be also easy to set up.

### Easy to Reproduce Any Runtime Events

With some type of runtime recording method is applied, along with the program, the runtime should be replayable.

# Plan

[@Fig:plan] shows the remainder of the project. With a time scale in hours, it seems using 206 hours for this project. There is also a high uncertaintity that several times have been estimated wrong, either more or less. There are also risks that the project could not be completed. The first risk is that time limit cannot be met. Under this circumstance, the specification should be lowered to make time limit met. The second risk is that some of the specification could be impossible to achieve. If the corruption of specification list happened, there were two ways to fix. First way is to find a alternative functionality to implement. If first way also failed, then the functionality should be eliminated and some targets should be replaced to make it possible.

![Plan for remainder of the project](plan.png){#fig:plan}

\clearpage

# References
