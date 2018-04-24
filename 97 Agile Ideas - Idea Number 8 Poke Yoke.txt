# 97 Agile Ideas - Idea Number 8 
# Poke Yoke 

Poke Yoke is an idea that comes from Japanese manufacturing. It is the idea of constructing a series of small (originally) mechanical tests that make sure a task has been completed fully before a piece of work can move to the next stage of assembly. For example, if a washing machine needs four screws to attach a back panel a poke yoke device might start out with four metal screws in four recesses on a tray. Beneath each of the four recesses is a pressure sensitive switch. The worker who is attaching the back plate picks up each of the screws and screws them into the washing machine and then presses the button to move the washing machine to the next stage of production. But the poke yoke device is set up so that the washing machine will only *actually* removed if all four screws have been moved from their recesses. 

Using these simple mechanical devices at every stage of production it has proved possible to have production lines with zero or near zero defects for long periods of time.

In software development, the equivalent of poke yoke is test driven development (TDD). For every piece of code that a developer writes, an accompanying unit test is written. When the software is built as part of a process of continuous integration all of the accompanying unit tests are run and if a test fails, the "build goes red" and the priority of the developers becomes to fix the build rather before any other new development is done.
