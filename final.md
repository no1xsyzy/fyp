---
title: 'Design and Implementation of a new Programming Language and a new Programming Paradigm'
subtitle: 'Final Report'
author: 'Siyuan XU (SBC-14-1014) \thanks{Supervised by Mr. J.C. Abad}'
date: 'Friday, December 1st, 2017'
abstract: >
  There is a great necessity of a new language for a reactive based programming.
  Analysis of existing languages and software industry can be used for supporting it.
  In this project, a new language will be designed and implemented.
  Its underlying paradigm will be discussed.
  After the technical information, the conclusion will be made.
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

\listoffigures

\listoftables

\clearpage\pagestyle{fancy}\setcounter{page}{1}

# Introduction

## Background

The argument about the best programming language
    have been existing for a long time. [@nanz2015comparative]
However, The best programming language should change over time
    as a result of progress in hardware. [@graham_2004, chap. 11]
Trends nowadays shows that more and more dynamic languages are being used and
    there is less complaint about its slowness.
Then how will programming languages be if
  all preconceptions of language are banished
  and all efficiency bounds are removed?
That will be a challenging question.

There are some aspects that are very probably unchanged
    or even more emphasized after years of evolution.
  The first point of attention should be learning difficulty.
    Requirements for skilled programmers are becoming stronger and stronger.
    In other words, it is essential that a programming language is easy to learn and to use.
  The second point of analysis may be less useless concerns.
    With the growth in complexity and scale of the system to be built,
    if the connections between different parts of the system
        keeps working like an inseparable, coherent whole,
      the system will quickly become unmaintainable.
  The last point may be code reusing.
    It is a waste of human resource to invent the wheel again.
    So it is a great and obvious approach to improve efficiency by code reusing.

Focusing on the aspects above,
  it is possible to carry out a really best language.
  Along with an understanding of recent trends in languages and programming,
    a more future-oriented language can be designed and implemented.
  The balance between removing prejudice on language and considering recent trends
      should be taken into account carefully.

## Aim

The aim of the project is to design a data flow oriented programming language, which should include the following advantages:

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
4. Write a syntax parser for the interpreter
5. Make a "hello world" program with this language
6. Create a simple HTTP server with this language

## Limitations

Due to the time limit of the project,
  the interpreter cannot be carried out with C language.
  There is not enough time for a full stack of libraries.
It is also almost impossible to write a high-efficiency interpreter.
  The existing language I chose for implementing the new language is slow.
  There is not much time for optimization, either.

## Structure

The whole report contains four parts.
  First part is the introduction as above.
    It consists of
      backgrounds,
      aims and objectives,
      limitations and
      the structure outline.
  The second part is about the relevant studies, including
    comparisons between existing languages,
    advantage and disadvantages of them,
    possible improvements to programming languages.
    These research will finally point to the necessity of the new language.
  The third part is the technical content.
    This part particularly means the statement of the designed language, including
      the designs of the new language and
      the implementation of the interpreter.
  The last part is the conclusion.
    In this part, the pros and cons of the new language will be discussed.
    Future improvements will also be discussed.

# Research

## Reactive Systems

Currently, organizations of different industries and fields are building systems
  with similar proception,
    which is called "reactive". [@reactive_manifesto]
Reactive systems fit better with today applications in many ways: [@whatisreactiveprogramming]

* Responsive.
  Users are requiring quicker and quicker response from service.
  Traditional applications are difficult to guarantee a speedy response.
* Resilient.
  The system must endure a level of failure.
  "Failure" means an unpredictable problem of the runtime environment,
    such as lack of memory or network breakdown or natural disasters.
  Antiquated systems can only kill the whole system when there is a failure.
* Elastic.
  Reactive systems can react to the load, which means
    less waste of computing resources and that the ability just fits the demand.
* Message-driven.
  By using the message-driven method, the system is capable of being de-coupled of time and of space.
  This is the base of resilience and elasticity.

Also, there are many techniques to achieve it.
  Futures or promises can set up what will be executed next after
    the former result has been retrieved or anterior operation is completed.
  Streams can set up flows of data without any coupling behaviour.
  The data flow can ensure data change respectively among different parts of the system. [@rp_vs_rs]

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
This kind of architecture can take advantage of the reactive design.
  Loose coupling means message-driven,
    which enables the use of reactive programming paradigm.
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
  Cloud servers are like cattle,
    with numbering and sending to curer.
  Cloud servers with container and microservices are like chicken,
    with counting and abandoning.
  Each is profiting more than the former by integrating management. [@cloud_computing]

Container technology is an important part of the microservices.
  With containers, the isolation is guaranteed in system level
    without demand for any understanding of the low-level implementation details. [@fink2014docker]
  In addition, automatic deployment, scaling, and management
      makes all the matters even easier. [@balalaie2016microservices]
  Deleting failed server and setting up a new server becomes so easy that
    many corporations prefer to run their service in that way. [@balalaie2016microservices]

However, those tools will not concern the links between microservices, but just
  throw all of these parts together and expect them to work as expected. [@container_communication]
It is not message-driven but isolation that is guaranteed.
  Designs may lead to well isolated but strongly coupled parts.
  It has benefits of isolation, but still keeps the possibility of complexities in development.

Briefly, microservice architecture is a good try to build reactive systems.

## Performance vs Ease

Lower level languages like C or C++ runs fast than higher level languages such as Python or JavaScript. [@performance_comparison]
Cache misses and garbage collection may be the main cause of their slowness. [@why_high_level_slow]
For Haswell Microarchitecture, reading in RAM is about 50 times slower than reading in level one cache. [@haswell_cache_cycles]
Most high-level languages are slow because they don't take advantages of caches, and uses expensive garbage collection. [@why_high_level_slow]

However, ease of development is another issue.
  First, there is less typing in dynamic typeless languages. [@scripting]
    Developing in dynamic languages are usually
      of 2 times the speed of development in static languages. [@prechelt2000empirical]
    The length of the resulting programs is also of this ratio. [@prechelt2000empirical]
  Generally, dynamic languages can produce more concise programs. [@nanz2015comparative]
Learning difficulties will also be concerned. It is obvious that
    a programming language that is easy to program with should be also easy to learn.

Briefly, there are few programming languages that can run fast while being easy to develop with.

## Better Workflow

### Modularization

Modularization is important for cooperating programming. Modularization means the program is structured into separate modules and each part does not wonder other parts. There are 3 aspects of importance. First, by assigning a programmer to a module, the programmer will feel responsible for the module of code, which improves the quality. Second, by assigning a module to a programmer, duplication of effort is prevented. Third, modularization makes the structure and architect of the program clear, which stick to the Keep It Simple Stupid principle and decreases learning cost. [@CathedralBazaar]

To achieve modularization, de-coupling is necessary. A program is never modularized if the codes from one module must depend on the implementation details of another module. Only if the modules are de-coupled, the program is modularized. In object-oriented paradigm, more work should be done to ensure de-coupling. [@mezini2004variability] In reactive paradigm with a message-driven base, the only way to share data between codes are messages. With messages as the only interface between modules, programs are forced to be de-coupled, thus truly modularized.

What's more, it will be essential if splitting modules can be done before programming. The earlier modules are split and made clear, the clearer programmers are about their parts. An inevitable problem is that modules are often split around the main module. This kind of splitting method usually takes a long time.

Briefly, modularization is very important to cooperating programming but requires much effort to achieve it.

### Premature Efforts

Premature efforts can hardly be good. Premature optimization usually leads to bad workflow. Making something done is more important than making it good. Doing optimizations too early is called premature optimization. Only after the critical code that lags the whole program has been found can we do efficient optimization. [@knuth_1974, vol. 6]

The premature design is also another bad pattern. Programmers are more like painters than engineers. [@graham_2004, chap. 2] Making a final design is a dangerous thing because many of the aspects of a problem are made clear in the process of programming. This includes how it works, how its inside communication works and many other things to be decided.

In order to prevent the badness of premature efforts, good programming languages must be fully hackable. It must be easy to tinker something around with this programming language. Even the programming is running, the running process must also be easy to tinker around. There must be time travelling feature, which allows stepping back instead of forward, makes debugging easier. There must be hot module replacing, making it possible to change the implementation or even the functionality of a module. Injecting another module at any point should also be possible since it is easier to patch than fully rewrite the whole module.

Briefly, premature efforts are usually harmful to programming and therefore should be prevented with the better programming language.

## Other Problems with Existing Languages

### Hidden Traps in Languages

There are numerous traps in C language. [@c_trap_pitfall] Lexical, syntactic pitfalls, and semantic pitfalls are three types of common pitfalls in many languages. Most of the time, the traps come from functions that are not pure functions. The word "pure" has meanings in two aspects. On one hand, there is no side effect, i.e., nothing will be manipulated by pure function. On the other hand, the parameters passed to it are the only factors that will change the output of the function. In other words, the only data exchanges between pure functions and the outside are parameters and returning values.
<!-- TODO: citation needed -->

Traps are necessary for most programs. A program usually has to change particular files to output the procession result. There are usually displays on screen and many other side effects. Even in languages famous for its pure function, such as Haskell or Erlang, there are still impure parts. However, what turns it into a bad thing is that many traps are just hidden by the language. Pure functions and impure functions are just thrown together and expecting programmers to remember all of them or to investigate documentation of every function and method.

Briefly, many programming languages hide traps and add indetermination.

### Too Much Effort to Log

Most programming languages require too much effort to create a log system.

For example, a logging library in C language `log4c` [@log4c] contains 25 files to produce a complete logging library, while logging with this logging library is still complicated. There are extra lines of codes that initialize and clean up runtime of the library. To make matters worse, logging methods

In Python language, logging is usually done with its standard library `logging` [@python_logging], which is designed to be "pythonic". It enhances simplicity while keeps customizability. Logging with this library requires little coding for initialization. Summarizing say, there is only one line importing the library, and all other lines with logging library have some actual effect, such as setting up log file path or filter some logs out. But there are still different ways to log. For instance, the famous asynchronous library or framework `tornado` has its own logging system. If you use normal `logging`, the asynchronism will be broken.

Briefly, most existing programming languages are usually difficult to generate logs or have too many ways to do so.

### Inability to Reproduce Problems

For most of the programs, it is really difficult to reproduce a runtime. After a bug or any problems occurred, when reporting it to the developer, users tend to think their environments be either certainties or regardless of the bug. However, problems are usually relevant to the environment. For lack of necessary information, developers are usually hard to track down the bug just because they do not have this kind of bug and they are not able to reproduce it. To make matters worse, users are usually unable to find out all the relevant environments. Free (libre) or open source software eliminate this issue by making the source code software accessible to users. [@CathedralBazaar] They can track down the bug by themselves. If they can know how the bug occurs by themselves, they can help software developers to deal with problems. But this approach requires one assumption that most users, at least users who are able to reproduce the problem, know how to trace the reason for the problem. However, the truth is just opposite. Most users do not know anything about programming.

Briefly, most programming languages lack a way to reproduce the runtime.

### Inability to Change the Program on the Fly

Nowadays various interpreted languages are very easy to change. Unlike compiled languages, it is very easy to change the content of a script file and restart the whole software.

However, it is still challenging to change them on the fly. By "on the fly", it is meant that when you are debugging or even running the code, you can actually take full control over the runtime status of the program. [@on-the-fly_programming] [@wang2004fly] There are a few frameworks that allow on-the-fly programming and achieve it by a technique called hot module replacing. This technique mainly depends on splitting the code into separate modules.

## Aims and Objectives

The aim of this project is to design and implement a new type of programming language, which should meet the following specifications.

### Uses "Reactive" Principle

As discussed above, the reactive paradigm is useful in different aspects. This paradigm is going to be the main paradigm of this programming language. To use the principle of reactive, this language should be designed as natively message-driven. With message-driven as the basis of this language, the language can benefit most from the paradigm.

### Helps to Design "Reactive" Systems

Reactive systems are difficult to design. With this language, it should be easier to design such reactive systems with its native support for the features of reactive paradigm.

### Easy to Develop With

This language should use dynamic types to enhance comfort in development. What's more, the structure of a program written in this language should be very clear.

### Runs Fast

This is not a target of high priority. Although it is attracting to have it fast, it will not be so terrible if it is slow. More importantly, it will be more an issue about the implementation than the language design.

### Helps to split programs into modules quickly

This feature should be attained with the design. With good design, any splitting of functionalities will be a subset of an available splitting of modules in this language. In other words, one should be able to split the functions and divide them into modules without any detailed consideration.

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

SINPL

: Name for the new-designed language.
  It represents for "SINPL Is Not Programming Language" and
  contains the hope that this language will be very simple.

Module

: A basic interacting unit.
  The implementation of the Module is not concerned by the top-level.

Message

: A basic package of data transferred.
  The content of the message will not influence the transmission.

Message priority

: How prior the Message should be processed.
  There are four possible priorities numbered from 0 to 3.
  Smaller number represents higher priority.
  One message can be processed only when there are no messages with higher priority.

Dataflow

: Pure data. Repeating it will not cause any effect.

Event

: Data that is particular. Repeating it will cause the system to work more.

Net

: A network that Messages can be transferred to it.
  One Net can receive Messages from multiple Ports and transmit the data to multiple Ports

Port

: The only interface of a module. It can be configured to be connected with zero or more Net(s).

System

: A combination of Modules and Net that can be run as a whole program.

Stage

: The whole running process is divided into four stages: build, const, start, idle.
  Each corresponds to a priority.
  These are Messages that put into the message queues before the System starts.

## Dataflow

The first kind of message that is transmitted on the net is data flow.
  It represents a constant or calculated value.
  Dataflow should be idempotent.
    No wonder how many times the same value was transmitted, no state would be changed at all.
There are different modules to process flowed data.

### Constants (`constnum` and `conststr`)

The module `constnum` is shown in [@fig:constnum].
  It accepts a literal integer from the configuration and outputs it as an integer or a number.

![`constnum` Module](images/constnum.png){#fig:constnum}

Another module `conststr` is shown in [@fig:conststr].
  It accepts a literal string from the configuration and outputs it as a string.

![`conststr` Module](images/conststr.png){#fig:conststr}

`constnum` and `conststr` can be used to provide a constant value from their configurations.

### Elementary Arithmetics (`add`, `subtract`, `multiply` and `divide`)

Elementary arithmetics are basis of mathematics.
[@Fig:add; @fig:subtract; @fig:multiply; @fig:divide] shows the modules for elementary arithmetics.
Although in the figures, the inputs of modules in these figures are constant values,
  they may also be results from other modules.
As long as the input is changed, the output will also be changed.
This forms kind of "binding", but with better illustrations.

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
  It works like the reverse of `structure` module.
  The output ports are named with key name.
Both modules are data flow modules, and the output will change upon change of input.

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

Despite data flow, the other kind of messages is event.
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
      To solve this issue, a pseudo-event can be added to input to "push" former event out.

![`route` Module](images/route.png){#fig:route}

## Turing Completeness

Turing completeness is important in programming languages.
  With Turing completeness, a programming language can do everything that another language can do.
However, there is not enough time to design a Turing complete language or to prove it.
    with a selected set of modules.
  The main limit exists because of the non-imperative structure.
    It is more difficult to program like "do something then something then something"
  So, the language can be extended with Python
    so that the language can guarantee Turing completeness as Python is.

## Run Stage

To make the execution of a program written in SINPL clearer and more controllable,
    run stage is introduced.
  Run stage is special pulses on 4 specified net.
    They are:

* Build stage. The pulse is on `build` net.
  This stage represents the building procedure of a program.
    At build stage, configurations are resolved and nets are connected.
    Before build stage, all modules have only the `build` net connect to the `build` port.

* Const stage. The pulse is on `const` net.
  This stage represents the constant values are set up.
  As mentioned above, calculations are in the same priority.

* Start stage. The pulse is on `start` net.
  This stage represents the startup of the program.
    Servers can bind to the ports at this stage.

* Idle stage. The pulse is on `idle` net.
  It represents the whole program is idle.
  This stage will occur forever.
  As long as there is no message on the net, there will be a new idle message.

## Details of Implementation

Since I chose to make the language extensible with Python,
  it is obvious that I am using Python to implement this language.
In order to lessen the time so as to fit time limit, I used Object-Oriented Programming.

### Module

Class `Module` is an abstract of module.
The code below shows definition and the initialization method of the class.

```{.python .numberLines startFrom="95"}
class Module(object):
    """the base of all modules"""
    pliner = {}

    def __init__(self, structure):
        self.structure = proxy(structure)
        self.state = None
```

Class member `pliner` is used for shortcut configurations.
Member `structure` is a weak reference proxy to the structure where the module is in.
  In Python, all objects including classes has a reference count.
    If that count becomes zero, the object will be unreachable,
      which means that it is safe to completely remove the object.
    If strong reference is used here, the module and the structure will keep each other to live.
    By using weak reference, the modules will not keep the structure to exist.
    It becomes easier to manage these modules.
Member `state` is the state of the modules.
  It includes everything of the module that should be recorded.

```{.python .numberLines startFrom="41"}
def StateAttribute(entry, default_factory=None):
```

```{.python}
    # .......
```

```{.python .numberLines startFrom="107"}
    ports = StateAttribute("ports", lambda: defaultdict(list))
```

A state attribute is a state with attribute interface,
  e.g., `mod.ports` can be used to access all the ports.
  `entry` of a state attribute marks the key in state.
  `default_factory` provides a callable that creates the default value for this value.

```{.python .numberLines startFrom="110"}
def load(self, state):
    if self.state is not None:
        raise AttributeError("Loading before dumping")
    self.state = state

def dump(self):
    if self.state is None:
        raise AttributeError("Dumping before loading")
    return self.state

def recycle(self):
    if self.state is None:
        raise AttributeError("Recycling before loading")
    result = self.state
    self.state = None
    return result
```

The methods above provides persistence.
  An empty module can load from a setting.
  A nonempty module dump itself to a setting.
  Recycling will dump itself and become empty.

```{.python .numberLines startFrom="127"}
    @wants("build")
    def p_build(self, msg):
        if "name" in msg and msg["limit"] != self.name:
            return
        self.m_reset()
        self.m_procconf()
        self.m_solvewants()
        self.m_setsensitives()
        self.m_setfeeds()
        self.m_name()
```

Members which names like `p_<port name>` means a port.
The decorator `wants` will mark the function of port to connect to that port as default.
`p_build` marks default behaviour in build stage. It calls 6 other functions.
This is for convenience in replacing part of the behaviour.

```{.python .numberLines startFrom="138"}
    def m_reset(self):
        with suppress(KeyError):
            del self.ports
            del self.sensitives
            del self.feeds
            del self.positionals
```

Method `m_reset` resets the settings.
By using `with suppress(KeyError)`, any key error is suppressed if that attribute don't exists.

```{.python .numberLines startFrom="145"}
    def m_procconf(self):
        for conf in self.confs:
            for k, v in rcuts(conf):
                if k in self.pliner and self.pliner[k](self, v):
                    break
            else:
                if "=" in conf:
                    k, v = conf.split("=", 1)
                    if hasattr(self, "p_" + k):
                        self.ports[k].append(v)
                    elif k in self.state:
                        self.state[k] += "," + v
                    else:
                        self.state[k] = v
                else:
                    self.positionals.append(conf)
        del self.confs
```

Method `m_procconf` processes the configuration lines.
  For each line, the longest prefix that is the same as the key as in `pliner` is connected.
  The corresponding function will be called with the module and the rest value not in `pliner`.
  When the function returns truthy value, the pliner works well,
    so proceed to the next configuration line.
  If no pliner fits, the first equal sign "`=`" will be used to split key and value.
  The key will be tested whether being a port.
    If so, the port and net will be connected.
    Otherwise the state will be modified.
  If no equal sign "`=`" in that line, the line will be stored verbatim as positional configurations.

```{.python .numberLines startFrom="163"}
    def m_solvewants(self):
        for port, func in ((func[2:], getattr(self, func))
                           for func in dir(self) if func.startswith("p_")):
            if port not in self.ports and hasattr(func, "wants"):
                self.ports[port] = list(func.wants)
```

Method `m_solvewants` will detect all ports which
  wants a net by `wants("<net name>")` decorator but
  is not connected to any ports.
Then the port will be connected with the wanted nets.

```{.python .numberLines startFrom="169"}
    def m_setsensitives(self):
        for port in (func[2:] for func in dir(self) if func.startswith("p_")
                     and callable(getattr(self, func))):
            if port in self.ports:
                for net in self.ports[port]:
                    self.sensitives[net].append(port)
```

Method `m_setsensitives` sets sensitive tables as a reverse map of ports
  where the port is method.
Sensitive table is a multi-map from net to ports.

```{.python .numberLines startFrom="176"}
    def m_setfeeds(self):
        sensports = set(sensport for sensnet in self.sensitives.values()
                        for sensport in sensnet)
        for port in self.ports:
            if port not in sensports:
                self.feeds.append(port)
```

Method `m_setfeeds` sets feeds.
It contains all ports that is not sensitive of data.

```{.python .numberLines startFrom="183"}
    def m_name(self):
        if "name" not in self.state:
            self.name = uuid.uuid4()
```

Method `m_name` sets the name of the module if the name is absent.

### Structure

Next packing is `Structure`, which is an abstract of system structure.
  It contains zero or more modules, although it is meaningless to have zero modules.
  It can process a message with its `procMsg` method.

### RunState

Next packing is `RunState`, which represents the current status of a system.
  It contains a structure as well as a message queue.
  When its `runnext` (run next) method is called,
    Earliest message of the highest available priority will be processed using the structure in it.

### Lexical Analyzer and Syntax Analyzer

Lexical analyzer
  translates plain text
  into token stream.
Syntax analyzer is a translator
  from token stream
  to program.
Since I am focusing on the interpreter core, I chose to make the syntax analyzer simple.
It is implemented with `shlex` library,
    which is a simple and naive lexical analyzer for POSIX shell.
  However, it will be useful enough for this simple lexical analyzer.

Line 15 through 26 in [@lst:main] shows the lexical and syntax analyzer.
`__main__.py` is run the python module is called.
The first parameter from command line is regarded as filename.
Every line is processed with `shlex.shlex`.

## Applications

To demonstrate the new programming language, two applications are used.

### Hello World Program

This program should do these procedures one by one:

1. Print a string "Hello World!"
2. Exit

[@Lst:hw-sinpl] shows the program written in literal SINPL.
For comparison, a program for same usage written with Python is shown in [@lst:hw-py].
The program in sinpl is one line longer with literal writing.
However, it will be almost same if a better syntax analyzer is used.
In that case, the program can be written in one line like `conststr "Hello World!"|write`.

```{#lst:hw-sinpl .bash caption="Hello World Program Written in SINPL Literal" .numberLines}
write input=data then=end
conststr out=data data="Hello World!"
```

[@Lst:hw-sinpl] contains two lines.
  The first line creates a `write` module.
  The second line creates a `conststr` module.
In the const stage, the string in conststr is supplied to net `data`.
In the start stage, the string is printed to output.
The `write` module decides its output in the following order:

1. "`writer`", "`writers`" in the message reached port `on`
2. "`outfiles`" of its own
3. if neither of above works, standard output is used.

```{#lst:hw-py .python caption="Hello World Program Written in Python" .numberLines}
print("Hello World")
```

### Hello World Server

This program should work as following:

1. Start an HTTP server at all interfaces on port 80.
2. Keeps listening port 80.
3. On receiving any request, respond with a string "Hello World!".

[@Lst:hwserver-sinpl] shows the program written in literal SINPL.
For comparison, a program for same usage written with Python is shown in [@lst:hwserver-py].
The Python program is slightly longer than the SINPL program.
The program written with SINPL can be even shorter with better syntax analyzer.

```{#lst:hwserver-sinpl .bash caption="Hello World Server Written in SINPL Literal" .numberLines}
http_server @0.0.0.0:80 solve=solve
write input=data on=solve then=closer
conststr out=data data="Hello World!"
close on=closer
```

The program in [@lst:hwserver-sinpl] contains four lines.
  The first line starts an HTTP server in start stage.
    It will bind to port 80 on all interfaces ("`@0.0.0.0:80`")
    The request reader and response writer is passed in one message to net `solve`.
  The second line creates a `write` module and writes to the writer from message.
  The third line supplies the write module with the string "Hello World".
  The fourth line closes the writer.

```{#lst:hwserver-py .python caption="Hello World Server Written in Python" .numberLines}
from flask import Flask
app = Flask(__name__)

@app.route('/')
@app.route('/<path:path>')
def hello_world(path=None):
    return 'Hello World!'

if __name__ == '__main__':
    app.run("0.0.0.0", 80)
```

# Discussion and Conclusions

## Easy for Reactive Applications

As talked above, reactive systems are responsive, resilient, elastic and message-driven.
  Modules between SINPL language can only communicate with.
  With this design, the broken instances can be abandoned and created with another instance.
  Adding more instances for same module can provide better performance for the module.
    These instances can be distributed among different
  The language itself will keeps serving required informations as soon as possible.
    It don't need to wait for parallel parts to complete in order to carry out next job.
    So it is almost impossible that the program is blocked by some operation
        while the other operations are able to be performed.
  The design and paradigm of the new language is so similar to the reactive principle that
    it is reasonable to think the language is good for building reactive programs.

## Enhanced Modularization

With loose binding between modules and highly de-coupled parts of the function,
  it is easier to achieve modularization with SINPL language.
After sketching the system, it is possible to cut the system to smaller parts easily.
Any random cutting will be possible for modularization.
This enables the system architect not to make detailed analysis on the system before splitting.
  By splitting a project into parts quickly,
    the programmers can start code earlier and thus can find out the defect in the design earlier,
      which can decrease the lost in refactoring.
  What's more, the earlier the work begins, the earlier the work is done.
    If programmers can work earlier, the final result can be carried out earlier.
      This usually means quicker to get payback or even huge advantage in a new field.

## Better for CPU Optimization

Modern CPUs are using out-of-order execution and branch predictor.
  These techniques are used to boost CPU computation.
  They are so widely used that even caused critical vulnerabilities. [@Lipp2018meltdown; @Kocher2018spectre]
  Almost all modern processors were influenced.
  It is obvious that almost all processors are the same.

If using SINPL language at system level,
  the user space program could not even control what executes first.
  The vulnerabilities would just disappear.
These are just estimates, but I have a strong confidence in its possibility.

## Inconformity

First part that is not carried out is the injection.
  This requires higher skills in abstraction.
  The injection requires an injecting position selector,
    which is partially carried out but with foreseeable bugs and shortages.
  And with injection, the easy logging is not working.
  Also, the in-field programming is not able to work.

Another shortage of the implementation is lack of libraries.
  It requires years to make a complete bundle of libraries.
  To solve that, it is allowed to use Python to extend the language and to create libraries.
  With varies of libraries from Python, it will be easier to build new libraries.

There are also downsides of the language itself.
  First, the language highly relies on parallel executing in one process.
    This kind of functionality requires asynchronous input and output APIs.
    If the operating system doesn't support asynchronous APIs, like Windows,
      the performance will fall.
  What's more, the language cannot control the imperative directions.
    By emphasizing parallel and dealing with data as soon as possible,
    It cannot control which code is run first very well.
    And controlling it manually will cause performance degradation greatly.
  In addition, it will seem to be strange to most software engineers.
    Most software engineers have been familiar with imperative languages.
    They would feel the new language unfamiliar and strange
      if it cannot control every executive order.

## Future Improvements

The first possible improvement is the selector utilities.
  As long as the selector can work, many other functionalities can work as well,
    such as injection and automatic logging.

Another improvement can be hot update.
  As long as the source file is changed,
    the program should be able to update to new program without any downtime.
  This can increase availability greatly.

Libraries can also be an improvement.
  This will be a long-term work.
  And I suggest adding modules when demanded.
  Thus the modules can be optimized for ease of use.

Inspired by Python library Plumbum, it seems also possible to create a DSL in Python
    by overloading magic methods of Python.
  It can be described as to write Python alike SINPL,
    or to write SINPL with Python.
  If that worked, it is possible to even take advantage of Python's syntax.
  At that point, SINPL will not be a programming language but a useful extension of Python.

## Conclusions

In this project, a new programming language and underlying paradigm are designed and implemented.
  This language depends on data flow and events and can be extended with Python.
  This language is based on messages between smaller parts.
  So the application can extend as required.
  The failure can also be easily solved.
  Therefore, it is very easy to create reactive applications with this language.
It is also possible to improve this language with some other bits of help.
The language takes advantage of the strength of Python and principles of reactive.

\clearpage

# Appendix A: Code

```{.python .numberLines #lst:main caption="`__main__.py`"}
# __main__.py

from .runstate import RunState
from .asynciorunner import AsyncioRunner
import shlex
import sys
scriptfn = sys.argv[1]
confs = sys.argv[2:]
modules = []

rs = RunState()
rs.structure.initiate()

with open(scriptfn) as scriptf:
    for line in scriptf:
        if line.startswith("#"):
            continue
        m = shlex.shlex(
            line,
            punctuation_chars=True,
            posix=True)
        m.wordchars += "@:<>"
        toks = list(m)
        if toks:
            print(toks)
            rs.structure.addModule(toks)

rs.defaultstart()
AsyncioRunner(rs).run_forever()
```

```{.python .numberLines #lst:asynciorunner caption="`asynciorunner.py`"}
# asynciorunner.py

import asyncio
from aiohttp import web
from .modules import register, alias_port, StateAttribute, wants, Module
from .runstate import Msg


class AsyncioRunner:
    def __init__(self, runstate, loop=None):
        self.runstate = runstate
        self.loop = loop

    @property
    def loop(self):
        return self.runstate.structure.loop

    @loop.setter
    def loop(self, loop=None):
        self.runstate.structure.loop = loop or asyncio.get_event_loop()

    def run_once(self, loop=None):
        loop = loop or self.loop
        self.runstate.runnext()
        loop.call_soon(self.run_once, loop)

    def run_forever(self):
        self.loop.call_soon(self.run_once, self.loop)
        self.loop.run_forever()


@register
class delay(Module):
    pliner = {
        "&&:=": alias_port("on"),
        ":&&=": alias_port("then"),
    }

    delay = StateAttribute("delay", list)

    def p_input(self, data):
        self.delay = data

    def m_delayed(self, msg):
        for net in self.ports["then"]:
            self.structure.adds(Msg(net, msg, 2))

    @wants("start")
    def p_on(self, msg):
        self.structure.loop.call_later(self.delay, self.m_delayed, msg)


def setbinding(self, v):
    try:
        interface, port = v.split(":")
        self.interface = interface
        self.port = int(port)
        return True
    except Exception:
        return False


class ResponseIO:
    def __init__(self, resp, req, loop=None):
        self.resp = resp
        self.req = req
        self.loop = loop or asyncio.get_event_loop()
        self.locked = False
        self.q = asyncio.Queue()

    def write(self, s):
        print("write ", s)
        if self.locked:
            return
        if self.resp.prepared:
            print("#raw write")
            self.loop.create_task(self.resp.write(bytes(s, "utf-8")))
        else:
            if s[0] == ":" and ":" in s[1:]:  # TODO: pseudo as status
                print("#change meta")
                _, k, v = s.split(":", 2)
                v = v.lstrip(" ")
                if k == "status":
                    self.resp.status = int(v)
            elif ":" in s:
                print("#add header")
                k, v = s.split(":", 1)
                v = v.lstrip(" ")
                self.resp.headers.add(k, v)
            else:
                print("#prepare and write")
                self.loop.create_task(self.resp.prepare(self.req))
                self.loop.create_task(self.resp.write(bytes(s, "utf-8")))

    def close(self):
        print("close")
        if self.locked:
            return
        if not self.resp.prepared:
            self.loop.create_task(self.resp.prepare(self.req))
        self.loop.create_task(self.resp.write_eof())
        self.loop.create_task(self.q.put(None))

    def lock(self):
        print("lock")
        new_rio = ResponseIO(self.resp, self.req, self.loop)
        self.locked = True
        return new_rio

    async def finish(self):
        await self.q.get()


@register
class http_server(Module):
    pliner = {
        ":|=": alias_port("solve"),
        "@": setbinding
    }

    interface = StateAttribute("interface", lambda: "127.0.0.1")
    port = StateAttribute("port", lambda: 9980)

    # def __getattr__(self, key):
    #     if key.startswith("p_solved_"):
    #         key[9:]
    #     super().__getattr__(self, key)

    async def m_handler(self, request):
        print("handle")
        resp = web.StreamResponse(
            status=200,
            reason='OK',
            headers={'Content-Type': 'text/html'})
        rio = ResponseIO(resp, request, self.structure.loop)
        msg = {"writer": rio, "reqhead": {
            ":method": request.method,
            ":url": request.url,
            ":rel_url": request.rel_url,
            ":scheme": request.scheme,
            "host": request.host,
            ":remote": request.remote,
            **{k: request.headers.getall(k) for k in request.headers.keys()}
        }, "reader": request.content}
        for net in self.ports["solve"]:
            self.structure.adds(Msg(net, msg, 2))
        await rio.finish()
        return resp

    @wants("start")
    def p_start(self, data):
        print("start at %s:%d" % (self.interface, self.port))
        if not hasattr(self, "_app"):
            self._app = web.Application()
            self._app.router.add_route('GET', '/{tail:.*}', self.m_handler)
        self.structure.loop.create_task(self.structure.loop.create_server(
            self._app.make_handler(), self.interface, self.port))

    p_solve = None

    def m_setbinding(self, v):
        try:
            interface, port = v.split(":")
            self.interface = interface
            self.port = int(port)
            return True
        except Exception:
            return False
```

```{.python .numberLines #lst:modules caption="`modules.py`"}
# modules.py
"""
overall basic process with modules
"""

import sys
import uuid
from collections import defaultdict
from contextlib import suppress
from weakref import proxy


# class StateAttribute:
#     "Emulate PyProperty_Type() in Objects/descrobject.c"
#
#     def __init__(self, entry, default_factory=None, doc=None, *,
#                  beforeget=None, afterget=None, aroundget=None,
#                  beforeset=None, afterset=None, aroundset=None,
#                  beforedel=None, afterdel=None, arounddel=None):
#         self.entry = entry
#         self.default_factory = default_factory
#         if doc is not None:
#             self.__doc__ = doc
#
#     def __get__(self, obj, objtype=None):
#         if obj is None:
#             return self
#         if self.entry not in obj.state and self.default_factory is not None:
#             obj.state[self.entry] = self.default_factory()
#         return obj.state[self.entry]
#
#     def __set__(self, obj, value):
#         obj.state[self.entry] = value
#
#     def __delete__(self, obj):
#         if self.fdel is None:
#             raise AttributeError("can't delete attribute")
#         self.fdel(obj)


def StateAttribute(entry, default_factory=None):
    """Factory for wrapped state"""
    def getx(self):
        if entry not in self.state and default_factory is not None:
            self.state[entry] = default_factory()
        return self.state[entry]

    def setx(self, value):
        self.state[entry] = value

    def delx(self):
        del self.state[entry]

    return property(getx, setx, delx, "wrapped state '%s'" % entry)


def alias_port(name):
    def aliaser(self, v):
        self.ports[name].append(v)
        return True
    return aliaser


def alias(name):
    def aliaser(self, v):
        self.state[name] = v
        return True
    return aliaser


def wants(*netname):
    def wantsnet(func):
        if not hasattr(func, "wants"):
            func.wants = []
        func.wants.extend(netname)
        return func
    return wantsnet


def rcuts(s):
    i = len(s) - 1
    while i > 0:
        yield (s[:i], s[i:])
        i -= 1


registry = {}


def register(module):
    registry[module.__name__] = module
    return module


class Module(object):
    """the base of all modules"""
    pliner = {}

    def __init__(self, structure):
        self.structure = proxy(structure)
        self.state = None

    positionals = StateAttribute("positionals", list)
    confs = StateAttribute("confs", list)
    sensitives = StateAttribute("sensitives", lambda: defaultdict(list))
    feeds = StateAttribute("feeds", list)
    ports = StateAttribute("ports", lambda: defaultdict(list))
    name = StateAttribute("name")

    def load(self, state):
        if self.state is not None:
            raise AttributeError("Loading before dumping")
        self.state = state

    def dump(self):
        if self.state is None:
            raise AttributeError("Dumping before loading")
        return self.state

    def recycle(self):
        if self.state is None:
            raise AttributeError("Recycling before loading")
        result = self.state
        self.state = None
        return result

    @wants("build")
    def p_build(self, msg):
        if "name" in msg and msg["limit"] != self.name:
            return
        self.m_reset()
        self.m_procconf()
        self.m_solvewants()
        self.m_setsensitives()
        self.m_setfeeds()
        self.m_name()

    def m_reset(self):
        with suppress(KeyError):
            del self.ports
            del self.sensitives
            del self.feeds
            del self.positionals

    def m_procconf(self):
        for conf in self.confs:
            for k, v in rcuts(conf):
                if k in self.pliner and self.pliner[k](self, v):
                    break
            else:
                if "=" in conf:
                    k, v = conf.split("=", 1)
                    if hasattr(self, "p_" + k):
                        self.ports[k].append(v)
                    elif k in self.state:
                        self.state[k] += "," + v
                    else:
                        self.state[k] = v
                else:
                    self.positionals.append(conf)
        del self.confs

    def m_solvewants(self):
        for port, func in ((func[2:], getattr(self, func))
                           for func in dir(self) if func.startswith("p_")):
            if port not in self.ports and hasattr(func, "wants"):
                self.ports[port] = list(func.wants)

    def m_setsensitives(self):
        for port in (func[2:] for func in dir(self) if func.startswith("p_")
                     and callable(getattr(self, func))):
            if port in self.ports:
                for net in self.ports[port]:
                    self.sensitives[net].append(port)

    def m_setfeeds(self):
        sensports = set(sensport for sensnet in self.sensitives.values()
                        for sensport in sensnet)
        for port in self.ports:
            if port not in sensports:
                self.feeds.append(port)

    def m_name(self):
        if "name" not in self.state:
            self.name = uuid.uuid4()


@register
class write(Module):
    """write to stdout or predefined writer(s)"""
    pliner = {
        "<": alias_port("input"),
        ">>": lambda self, v: self.outfiles.append(open(v, "a")) or True,
        ">": lambda self, v: self.outfiles.append(open(v, "w")) or True,
        "&&:=": alias_port("on"),
        ":&&=": alias_port("then"),
    }

    outfiles = StateAttribute("outfiles", list)
    data = StateAttribute("data", str)

    @wants("start")
    def p_on(self, msg):
        if "writers" in msg or "writer" in msg:
            writers = msg.get("writers", [])
            if "writer" in msg:
                writers.append(msg["writer"])
            for writer in writers:
                writer.write(self.data)
        elif self.outfiles:
            for writer in self.outfiles:
                writer.write(self.data)
        else:
            sys.stdout.write(self.data)
        return [[net, msg] for net in self.ports["then"]]

    p_then = None

    def p_input(self, data):
        self.data = data


@register
class close(Module):
    """close writer"""
    pliner = {
        "&&:=": alias_port("on"),
        ":&&=": alias_port("then"),
    }

    def p_on(self, msg):
        writers = []
        if "writers" in msg:
            writers.extend(msg["writers"])
        if "writer" in msg:
            writers.append(msg["writer"])
        for writer in writers:
            writer.close()
        return [[net, msg] for net in self.ports["then"]]

    p_then = None


@register
class conststr(Module):
    """"""
    pliner = {
        ">": alias_port("out"),
        ":|=": alias_port("out"),
    }

    data = StateAttribute("data", list)

    @wants("const")
    def p_const(self, msg):
        if 'data' in self.state:
            data = self.state['data']
        else:
            data = self.positionals[0]
        return [[net, data] for net in self.ports["out"]]

    p_out = None
```

```{.python .numberLines #lst:runstate caption="`runstate.py`"}
# runstate.py
"""
provides a runstate
"""
import uuid
from .structure import Structure


class Msg:
    def __init__(self, net, data, priority, uid=None):
        self.net = net
        self.data = data
        self.priority = priority
        self.uid = uid or uuid.uuid4()

    def dump(self):
        return {"net": self.net, "data": self.data,
                "priority": self.priority, "uid": self.uid}


class RunState:
    def __init__(self, structure=None):
        self._structure = structure or Structure()
        self._structure.runstate = self
        self._structure.adds = self.adds
        self._pmsgs = [[], [], [], []]

    def defaultstart(self):
        for p, m in enumerate(["build", "const", "start"]):
            self._pmsgs[p].append(Msg(m, {}, p))

    def nextmsg(self):
        for i in range(4):
            if self._pmsgs[i]:
                return self._pmsgs[i].pop(0)
        return Msg("idle", {}, 3)

    @property
    def structure(self):
        return self._structure

    def dump(self):
        return {"structure": self._structure.dump(),
                "msg": [[j.dump() for j in i] for i in self._pmsgs]}

    def adds(self, msg):
        self._pmsgs[msg.priority].append(msg)

    def runnext(self):
        msg = self.nextmsg()
        raws = self._structure.procMsg(msg)
        for rawmsg in raws:
            net, data, priority = (rawmsg+[msg.priority])[:3]
            self.adds(Msg(net, data, priority))
```

```{.python .numberLines #lst:structure caption="`structure.py`"}
# structure.py
"""

"""
__all__ = ["Structure"]

from .modules import registry


class Structure:

    def __init__(self):
        self._modules = None
        self._inject_before = None
        self._inject_after = None
        self._inject_on = None

    def initiate(self):
        if self._modules is not None:
            raise AttributeError("Initializing before clearing")
        self._modules = []
        self._inject_before = []
        self._inject_after = []
        self._inject_on = []

    def load(self, structure):
        if self._modules is None:
            raise AttributeError("Loading before clearing")
        self._modules = list(structure["modules"])
        self._inject_before = list(
            j for i, *j in structure["injects"] if i == "before")
        self._inject_after = list(
            j for i, *j in structure["injects"] if i == "after")
        self._inject_on = list(
            j for i, *j in structure["injects"] if i == "on")

    def addModule(self, mconfig):
        if self._modules is None:
            raise AttributeError("Structure not initialized")
        job = mconfig[0]
        newmodule = registry[job](self)
        newmodule.load({"ports": {"build": ["build"]},
                        "confs": mconfig[1:],
                        "sensitives": {"build": ["build"]}})
        self._modules.append(newmodule)

    def dump(self):
        if self._modules is None:
            raise AttributeError("Structure not initialized")
        return {"modules": [m.dump() if callable(m.dump) else m
                            for m in self._modules],
                "injects":
                    [["before"] + x for x in self._inject_before] +
                    [["after"] + x for x in self._inject_after] +
                    [["on"] + x for x in self._inject_on]}

    def inject(self, *confs):
        if self._modules is None:
            raise AttributeError("Structure not initialized")
        for position, *setting in confs:
            if position == ['on']:
                self._inject_on.append(setting)
            elif position == ['before']:
                self._inject_before.append(setting)
            elif position == ['after']:
                self._inject_after.append(setting)

    def select(self, sel):
        if self._modules is None:
            raise AttributeError("Structure not initialized")
        return list(filter(sel, self._modules))

    def recycle(self):
        if self._modules is None:
            raise AttributeError("Structure not initialized")
        result = self.dump()
        self._modules = None
        self._inject_before = None
        self._inject_after = None
        self._inject_on = None
        return result

    def procMsg(self, msg):
        feededs = self.select(lambda mod: msg.net in mod.sensitives)
        raws = []
        for feeded in feededs:
            for portname in feeded.sensitives[msg.net]:
                raws += getattr(feeded, "p_" + portname)(msg.data) or []
        return raws
```

\clearpage

# References
\
