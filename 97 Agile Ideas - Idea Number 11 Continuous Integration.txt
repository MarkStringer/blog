# 97 Agile Ideas - Idea Number 11
# Continuous Integration

When a bunch of developers are working on a new piece of software they tend to be working individually (or in pairs) on a local copy - one that's held on their own computer. Continuous integration (CI) is the practice of regularly synchronising the bits of "local" work centrally and crucially making sure the all changed bits work together.

An important component of the practice of continuous integration is a source code repository: this is a place which keeps the most recent "official" version of any part of a software system. A typical pattern of work for a software developer might be to download a group of files from the repository; make changes to add some new functionality; check that the changes work locally; and then upload those files back to the repository. For this practice to be "continuous" it needs to happen frequently and often, ideally at least once a day.

When those files are uploaded, a piece of software called continuous integration server notices that these changes have been made and tries to make sure that the software still "works." Depending on the programming languages used, this might mean compiling the programme language code, and there could be errors there, but it will definitely also involve running a series of automated unit tests and functional tests to ensure that the changes haven't caused any tests to fail.

This check, or series of checks, is often given a colour. A "Green" CI build means that everything was put together without problems and all the automated tests ran without problems.  A "Red" CI build means that something went wrong and some of the new changes causes a problem that needs to be fixed. By focusing on submitting code to a central repository regularly and on keeping the CI build Green. Continuous integration achieves two important Agile goals: it limits the work in progress and in puts the focus of work on delivering working software.

