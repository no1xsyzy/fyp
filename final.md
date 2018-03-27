---
title: 'Design and Implementation of a new Programming Language and a new Programming Paradigm'
subtitle: 'Final Report'
author: 'Siyuan XU (SBC-14-1014) \thanks{Supervised by Mr. J.C. Abad}'
date: 'Friday, December 1st, 2017'
abstract: >
  There is great necessity of a new language for a reactive based programming.
  Researches on existing languages and software industry can be used for supporting it.
  In this project, a new language will be designed and implemented.
  Its underlying paradigm will be discussed.
  After the technical informations, the conclusion will be made.
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

## Background

Argument about the best programming language
    have been existing for a long time. [@nanz2015comparative]
However, The best programming language should change over time
    as a result of progress in hardware. [@graham_2004, chap. 11]
Trends nowadays shows that more and more dynamic languages are being used and
    there are less complaint about its slowness.
Then how will programming languages be if
  all preconceptions of language are banished
  and all efficiency bounds are removed?
That will be a challenging question.

There are some aspects that are very probably unchanged
    or even more highlighted after years of evolution.
  The first point of attention should be learning difficulty.
    Requirements for skilled programmers are becoming stronger and stronger.
    In other words, it is essential that a programming language is easy to learn and to use.
  Second point of analysis may be less useless concerns.
    With the growth in complexity and scale of the system to be built,
    if the connections between different parts of the system
        keeps working like an inseparable, coherent whole,
      the system will quickly become unmaintainable.
  The last point may be code reusing.
    It is a waste of human resource to invent the wheel again.
    So it is a great and obvious approach to improve efficiency by code reusing.

Focusing on the aspects above,
  it is possible to carry out a really best language.
  Along with understanding of recent trends in languages and programming,
    a more future-oriented language can be designed and implemented.
  Balance between removing prejudice on language and considering recent trends
      should be taken into account carefully.

## Aim

The aim of the project is to design a dataflow-oriented programming language, which should include the following advantages:

* Uses "reactive" principle
* Helps to design "reactive" systems
* Easy to develop with
* Runs fast
* Helps to split programs into modules quickly
* Supports on-the-fly Programming
* Exposes all "traps"
* Built-in logging/debugging
* Easy to reproduce any runtime events

## Objectives

This project contains following objectives:

1. Define the lexical and syntax of the language
2. Design the base of the language
3. Program the basic interpreter of the language
4. Write an syntax parser for the interpreter
5. Make a "hello world" program with this language
6. Create a simple HTTP server with this language

## Limitations

Due to the time limit of the project,
  the intepreter cannot be carried out by C language.
  There is not enough time for a full stack of libraries.
It is also almost impossible to write a high-efficiency intepreter.
  The language I choose to implement the new language is slow.
  There is not much time for optimization.

## Structure

The whole report contains four parts.
  First part is the introduction as above.
    It consists of
      backgrounds,
      aims and objectives,
      limitations and
      the structure outline.
  The second part is the relevant researches, including
    comparisons between existing languages,
    advantage and disadvantages of them,
    possible improvements of programming languages.
    These researches will finally point to the necessity of the new language.
  The third part is the technical content.
    This part particularly means the statement of the designed language, including
      the designs of the new language and
      the implementation of the intepreter.
  The last part is the conclusion.
    In this part, the pros and cons of the new language will be discussed.
    Future improvements will also be discussed.

# Researches

## Reactive Systems

Currently, organizations of different industries and fields are building systems
  with similar proception,
    which is called "reactive". [@reactive_manifesto]
Reactive systems fits better with today applications in many ways: [@whatisreactiveprogramming]

* Responsive.
  Users are requiring quicker and quicker response from service.
  Traditional applications are difficult to guarantee a speedy response.
* Resilient.
  The system must endure a level of failure.
  "Failure" means unpredictable problem of the runtime environment,
    such as lack of memory or network breakdown or natural disasters.
  Antiquated systems can only kill the whole system when there is a failure.
* Elastic.
  Reactive systems can react to the load, which means
    less waste of computing resources and
    the ability just fits the demand.
* Message-driven.
  By using message-driven method, the system is capable of being de-coupled of time and of space.
  This is the base of resilience and elasticity.

Also, there are many techniques to achieve it.
  Futures or promises can set up what will be executed next after
    former result has been retrieved or anterior operation is completed.
  Streams can set up flows of data without any coupling behaviour.
  Dataflow can ensure data change respectively among different parts of the system. [@rp_vs_rs]

There haven't been really nice languages for writing a reactive system.
  Most popular languages are based on object-oriented programming paradigm,
    which emphasizes on packing properties and methods in one object,
      just like how we understand the real world. [@oop]
  Another programming paradigm is called functional programming,
    which comes from pure mathematics. [@functional_programming]
Neither of them is good for representing data exchanges between parts of the entire application.
What's more, those languages are still imperative languages,
  which need codes to "assign" them together.

Briefly, reactive systems are advantageous in varies of aspects but hard to create.

## Microservices

Microservice architecture is a designing style that
  assembles a number of loosely-coupled parts,
      called microservices,
    into a complete application. [@what_are_microservices]
This kind of architecture can take advantage of reactive design.
  Loose coupling means message-driven,
    which enables use of reactive programming paradigm.
  Each microservice is isolated so that failure will not result in larger failure,
    and any failure can be solved by each part. [@reactive_microservice]
  Isolation is the core concept of the microservices:
    it is the source of all its advantages.

"Cloud" seems to be providing an easy way to solve failures:
  when one server failed, just delete it and create a new one.
  It has been greatly affected by microservice architecture
  and thus is similar to how microservices works.
An interesting metaphor explains it vividly.
  Traditional ways to operate a server are like raising a pet,
    with naming and curing.
  Cloud servers are like cattles,
    with numbering and sending to curer.
  Cloud servers with container and microservices are like chicken,
    with counting and abandoning.
  Each is profiting more than the former by integrating management. [@cloud_computing]

Container technology is an important part of the microservices.
  With container, the isolation is guaranteed in system level
    without any demand for understanding of the low-level implementation details. [@fink2014docker]
  In addition, automatic deployment, scaling and management
      makes all the matters even easier. [@balalaie2016microservices]
  Deleting failed server and setting up a new server becomes so easy that
    many corporations prefer to run their service in that way. [@balalaie2016microservices]

However, those tools will not concern the links between microservices, but just
  throw all of these parts together and
  expect them work as expected. [@container_communication]
It is not message-driven but isolation that is guaranteed.
  Designs may lead to well isolated but strongly coupled parts.
  It has benefits of isolation, but still keeps possibility of complexities in development.

Briefly, microservice architecture is a good try to build reactive systems.

## Performance vs Ease

Lower level languages like C or C++ runs fast than higher level languages such as Python or JavaScript. [@performance_comparison]
Cache misses and garbage collection may be the main cause of their slowness. [@why_high_level_slow]
For Haswell Microarchitecture, reading in RAM is about 50 times slower than reading in level one cache. [@haswell_cache_cycles]
Most high level languages are slow because they don't take advantages of caches, and uses expensive garbage collection. [@why_high_level_slow]

However, ease in development is another issue.
  First, there is less typing in dynamic typeless languages. [@scripting]
    Developing in dynamic languages are usually
      of 2 times the speed of development in static languages. [@prechelt2000empirical]
    The length of the resulting programs are also of this ratio. [@prechelt2000empirical]
  Generally, dynamic languages can produce more concise programs. [@nanz2015comparative]
Learning difficulties will also be concerned. It is obvious that
    a programming language that is easy to develop in should be also easy to learn.

Briefly, there are few programming languages that can run fast while be easy to develop with.

## Better Workflow

### Modularization

Modularization is important for cooperating programming. Modularization means the program is structured into separate modules and each part does not wonder other parts. There are 3 aspects of importance. First, by assigning programmer to module, the programmer will feel responsible for the module of code, which improves the quality. Second, by assigning module to programmer, duplication of effort is prevented. Third, modularization makes the structure and architect of the program clear, which stick to the Keep It Simple Stupid principle and decreases learning cost. [@CathedralBazaar]

To achieve modularization, de-coupling is necessary. A program is never modularized if the codes from one module must depend on the implementation details of another module. Only if the modules are de-coupled, the program is modularized. In object-oriented paradigm, more work should be done to ensure de-coupling. [@mezini2004variability] In reactive paradigm with message-driven base, the only way to share data between codes are message. With message as the only interface between modules, programs are forced to be de-coupled, thus truly modularized.

What's more, it will be essential if splitting modules can be done before programming. The earlier modules are splitted and made clear, the clearer programmers are about their parts. An inevitable problem is that modules are often splitted around a main module. This kind of splitting method usually takes long time.

Briefly, modularization is very important to cooperating programming, but requires much effort to achieve it.

### Premature Efforts

Premature efforts can hardly be good. Premature optimization usually leads to bad workflow. Making something done is more important than making it good. Doing optimizations too early is called premature optimization. Only after the critical code that lags the whole program has been found can we do efficient optimization. [@knuth_1974, vol. 6]

Premature design is also another bad pattern. Programming is more like painting than engineering. [@graham_2004, chap. 2] Making a final design is a dangerous thing because many of the aspects of a problem are made clear in the process of programming. This includes how it works, how its inside communication works and many other things to be decided.

In order to prevent the badness of premature efforts, good programming languages must be fully hackable. It must be easy to tinker something around with this programming language. Even the programming is running, the running process must also be easy to tinker around. There must be time travelling feature, which allows to step back instead of forward, makes debugging easier. There must be hot module replacing, making it possible to change the implementation or even the functionality of a module. Injecting another module at any point should also be possible, since it is easier to patch than fully rewrite the whole module.

Briefly, premature efforts are usually harmful to programming and therefore should be prevented with better programming language.

## Other Problems about Existing Languages

### Hidden Traps in Languages

There are numerous traps in C language. [@c_trap_pitfall] Lexical, syntactic pitfalls, and semantic pitfalls are three types of common pitfalls in many languages. Most of the time, the traps come from functions that are not pure functions. The word "pure" has meanings in two aspects. On one hand, there is no side effect, i.e., nothing will be manipulated by pure function. On the other hand, the parameters passed to it are the only factors that will change the output of the function. In other words, the only data exchanges between pure functions and the outside are parameters and returning values.
<!-- TODO: citation needed -->

Traps are necessary for most programs. A program usually has to change particular files to output the procession result. There are usually displays on screen and many other side effects. Even in languages famous for its pure function, such as Haskell or Erlang, there are still impure parts. However, what turns it into a bad thing is that many traps are just hidden by the language. Pure functions and impure functions are just thrown together and expecting programmers to remember all of them or to investigate documentations of every function and method.

Briefly, many programming languages hide traps and add indetermination.

### Too Much Effort to Log

Most programming languages require too much effort to create a log system.

For example, a logging library in C language `log4c` [@log4c] contains 25 files to produce a complete logging library, while logging with this logging library is still complicated. There are extra lines of codes that initialize and clean up runtime of the library. To make matters worse, logging methods

In Python language, logging is usually done with its standard library `logging` [@python_logging], which is designed to be "pythonic". It enhances simplicity while keeps customizability. Logging with this library requires little coding for initialization. Summarizingly say, there is only one line importing the library, and all other lines with logging library have some actual effect, such as setting up log file path or filter some logs out. But there are still different ways to log. For instance, the famous asynchronous library or framework `tornado` has its own logging system. If you use normal `logging`, the asynchronism will be broken.

Briefly, most existing programming languages are usually difficult to generate logs or have too many ways to do so.

### Inability to Reproduce Problems

For most of the programs, it is really difficult to reproduce a runtime. After a bug or any problems occurred, when reporting it to the developer, users tend to think their environments be either certainties or regardless of the bug. However, problems are usually relevant to the environment. For lack of necessary information, developers are usually hard to track down the bug just because they do not have this kind of bug and they are not able to reproduce it. To make matters worse, users are usually unable to find out all the relevant environments. Free (libre) or open source software eliminate this issue by making the source code software accessible to users. [@CathedralBazaar] They can track down the bug by themselves. If they can know how the bug occur by themselves, they can help software developers to deal with problems. But this approach requires one assumption that most users, at least users who are able to reproduce the problem, know how to trace the reason of the problem. However, the truth is just opposite. Most users do not know anything about programming.

Briefly, most programming languages lack a way to reproduce the runtime.

### Inability to Change the Program on the Fly

Nowadays various interpreted languages are very easy to change. Unlike compiled languages, it is very easy to change the content of a script file and restart the whole software.

However, it is still challenging to change them on the fly. By "on the fly", it is meant that when you are debugging or even running the code, you can actually take full control over the runtime status of the program. [@on-the-fly_programming] [@wang2004fly] There are a few frameworks that allow on-the-fly programming and achieve it by a technique called hot module replacing. This technique mainly depends on splitting the code into separate modules.

## Aims and Objectives

The aim of this project is to design and implement a new type of programming language, which should meet the following specifications.

### Uses "Reactive" Principle

As discussed above, reactive paradigm is useful in different aspects. This paradigm is going to be the main paradigm of this programming language. To use the principle of reactive, this language should be designed as natively message-driven. With message-driven as basic layer of this language, the language can benifit most from the paradigm.

### Helps to Design "Reactive" Systems

Reactive systems are difficult to design. With this language, it should be easier to design such reactive systems with its native support for the features of reactive paradigm.

### Easy to Develop With

This language should use dynamic types to enhance comfort in development. What's more, the structure of a program written in this language should be very clear.

### Runs Fast

This is not a target of high priority. Although it is attracting to have it fast, but it will not be so terrible if it is slow. More importantly, it will be more an issue about the implementation than the language design.

### Helps to split programs into modules quickly

This feature should be attained with design. With well design, any splitting of functions will be a subset of available splitting of modules in this language. In other words, one should be able to split the functions and divide them into modules without any detailed consideration.

### Supports on-the-fly Programming

First, it should be hackable when debugging. As long as the program is changed, the interpreter should read the file again for the new program and substitute current one with the new one.

### Exposes all "traps"

Any modules with programming "traps" should be explicitly marked the type of trap. Since traps are needed in every program, at least all traps should be clearly stated. The kind of trap should be a part of the program.

### Built-in logging/debugging

By adding only one word into the program, the logging will be done automatically. If more logging features are required, it should be also easy to configure.

### Easy to Reproduce Any Runtime Events

With some type of runtime recording method is applied, along with the program, the runtime should be replayable.

# Technical Content

## Glossary

Module

: A basic interacting unit.
  The implementation of the Module is not concerned by the top-level.

Message

: A basic package of data transferred.
  The content of the message will not influence with the transmission.

Message priority

: How prior should the Message be processed.
  There are four possible priorities numbered from 0 to 3.
  Smaller numbers represents higher priority.
  One message can be processed only when there are no messages with higher priority.

Dataflow

: Pure data. Repeating it will not cause any effect.

Event

: Data that is particular. Repeating it will cause the system to work more.

Net

: A network that Messages can be transferred on it.
  One Net can receive Messages from multiple Ports and transmit the data to multiple Ports

Port

: The only interface of a module. It can be configured to be connected with zero or more Net(s).

System

: A combination of Modules and Net that can be run as a whole program.

Stage

: The whole runnig process is divided into four stages: build, const, start, idle.
  Each corresponds to a priority.
  These are Messages that put into the message queues before the System starts.

## Dataflow

First kind of message that is transmitted on the net is dataflow.
  It represents a constant or calculated value.
  Dataflow should be idempotent.
    No wonder how many times the same value was transmitted, no state would be changed at all.
There are different modules to process flowed data.

### Constants (`constnum` and `conststr`)

The module `constnum` is shown in [@fig:constnum].
  It accepts an literal integer from the configuration and outputs it as an integer or a number.

![`constnum` Module](images/constnum.png){#fig:constnum}

Another module `conststr` is shown in [@fig:conststr].
  It accepts an literal string from the configuration and outputs it as a string.

![`conststr` Module](images/conststr.png){#fig:conststr}

`constnum` and `conststr` can be used to provide a constant value from configuration.

### Elementary Arithmetics (`add`, `subtract`, `multiply` and `divide`)

Elementary arithmetics are basis of mathematics.
[@Fig:add; @fig:subtract; @fig:multiply; @fig:divide] shows the modules for elementary arithmetics.
Although in the figures, the inputs of modules in these figures are constant values,
  they may also be results from other modules.
As long as the input is changed, the output will also be changed.
This forms kind of "binding", but with better illustration.

![`add` Module](images/add.png){#fig:add}

![`subtract` Module](images/subtract.png){#fig:subtract}

![`multiply` Module](images/multiply.png){#fig:multiply}

![`divide` Module](images/divide.png){#fig:divide}

### Structured Data Processing (`structure` and `destructure`)

[@Fig:structure] shows how data are used for creating structured data.
  The input ports are named as `input/<keyname>`,
      where `<keyname>` is replaced with the name of the key.
  The output will be formed by making key-value pairs with all inputs.
[@Fig:destructure] shows how structured data are unpacked into data.
  It works alike the reverse of `structure` module.
  The output ports are named with key name.
Both modules are dataflow modules, and the output will change upon change of input.

![`structure` Module](images/structure.png){#fig:structure}

![`destructure` Module](images/destructure.png){#fig:destructure}

### Comparisons (`eq`, `lt`, `gt`, `le`, `ge`, `ne`)

Comparisons is widely used for running flow control.
  It accept two operands and returns boolean values.
Common comparisons includes:

* `eq` $a = b$ "equal to"
* `lt` $a < b$ "less than"
* `gt` $a > b$ "greater than"
* `le` $a \leq b$ "less than or equal to"
* `ge` $a \geq b$ "greater than or equal to"
* `ne` $a \neq b$ "not equal to"

They all accepts `op1` as $a$ and `op2` as $b$.

### Boolean (`land`, `lor` and `lnot`)

Boolean algebra is the basis of logic.
  With those three types of operators,
    all possible truth table is achievable.
  The truth table for these three boolean algebra is shown in [@tbl:booltruth]

|$a$|$b$|$a \lor b$|$a \land b$|$\lnot a$|
|---|---|---|---|---|
|$0$|$0$|$0$|$0$|$1$|
|$0$|$1$|$1$|$0$|$1$|
|$1$|$0$|$1$|$0$|$0$|
|$1$|$1$|$1$|$1$|$0$|

: Truth Table for Basic Boolean Algebra {#tbl:booltruth}

## Events

Despite dataflow, the other kind of messages is event.
  Events represents for something that is really happening, such as
    clicking with mouse,
    pressing a key,
    receiving data from network, etc.
  It can also represent the procession of an event.
  Repeating events means the event is repeated.

### Pulse

Pulse is a special type of event, which contains no payload data,
    which is represented by an empty object.
  The meaning of a pulse is determined by on which net it is transmitted.
    For example, a pulse on the `build` net causes the whole system to build up.
    A pulse on `end` network will mean the end of program.

### Array as Series (`series` and `parallel`)

The `series` module shown in [@Fig:series] is used for converting arrays into series.
When this module receives an event with array payload,
  it will create a series of events, each is one element in the array.
  To mark the beginning and the end of the array,
    special events "`#Bgn`" and "`#End`" is transmitted.
When an object is received instead of an array,
  the object will be considered as an array of key-value pairs.

[@Fig:parallel] shows the module that does almost the reverse of the `series` module.
  The only difference is that it will not convert the key-value pairs back into an object.

![`series` Module](images/series.png){#fig:series}

![`parallel` Module](images/parallel.png){#fig:parallel}

### Running Flow Control (`route`)

Controls are used to let program react to data.
  Through controls, it is possible to process different data.
Running flow controls of traditional languages contains conditional control and loop control.
In SINPL, control is processed by `route` module.
  This modules is different from most of other modules,
      so it is necessary to describe more about it.
    When an event is received from port `input`,
      The former event will be first transmitted according to `choose` value.
      Then, the payload of the input event will be copied to `test` as output.
      The priority will be also be raised to 1.
      After some calculations, the result should be transmitted to `choose` port.
    But this event can only be transmitted after next event is sent in.
      To solve this issue, a psuedo-event can be added to input to "push" former event out.

![`route` Module](images/route.png){#fig:route}

## Turing Completeness

Turing completeness is important in programming languages.
  With Turing completeness, a programming language can do everything that another language can do.
To achieve Turing completeness,
  the programming language must be able to simulate a Turing machine.

## Run Stage

To make the execution of a program written in SINPL clearer and more controllable,
    run stage is introduced.
  Run stage is special pulses on 4 specified net.
    They are:

* Build stage. The pulse is on `build` net.
  This stage represents the building procedure of a program.
    At build stage, configurations are resolved and nets are connected.
* Const stage. The pulse is on `const` net.
  This stage represents the constant values are set up.
  As mentioned above, calculations are in the same priority.
* Start stage. The pulse is on `start` net.
  This stage represents the start up of the program.
    Servers can bind to the ports at this stage.
* Idle stage. The pulse is on `idle` net.
  This stage will occur forever.

## Details of Implementation

## Applications

To demonstrate the new programming language, two applications are used.

### Hello World Program

This program should do these procedures one by one:

1. Print a string "Hello World!"
2. Exit

```
write input=data then=end
conststr out=data data="Hello World!"
```

### Hello World Server

This program should work as following:

1. Start an HTTP server at all interfaces on port 80.
2. Keeps listening port 80.
3. On receiving any request, respond with a string "Hello World!".

```
http-server @0.0.0.0:80 solve=solve
write input=data on=solve then=closer
conststr out=data data="Hello World!"
close on=closer
```

# Discussion and Conclusions

##

# References
