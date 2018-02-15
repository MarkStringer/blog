#The WIFS Syndrome or Why Developing Software Around Third Party Applications is Different

Most of the projects that I seem to get involved with these days involve third party software.  The idea is that the bulk of the functionality will be delivered by this third party software.  For me this is a total game-changer when it comes to software development - but I haven't really seen anybody writing about it - especially in the Agile community.  

The first problem is choosing the third party application (TPA?).  How do you decide which one to use?  I've tried to assess Kanban-style project management systems and it's a very difficult and painful process.  One company that I was doing some work for recently was going spare because they had the contract to maintain all the IT for another company.  The client company was a partnership, so if one of the partners asked to have some software installed on their computer, they couldn't really refuse.  But at the same time, they had no idea what that particular piece of software might do, how it would interact with other pieces of software.

There are some other weird things that happen as a result of this shift towards using TPAs.

* The order that requirements flow through testers, BA's and developers (and Product Owners, and other stakeholders) is massively disturbed.  I have my colleague [Ben Schofield](https://www.linkedin.com/pub/ben-schofield/16/525/628) to thank for this idea. Now he's pointed out it's so obvious.
* Because the flow of requirements through BA's, testers, developers and stakeholders is different, this causes stresses and strains.
* Software is [tractable](https://en.wiktionary.org/wiki/tractable), this is dangerous when you're doing "greenfield" software development and it's even more dangerous if you're trying to customise a TPA.  It's mentioned as one of the main reasons that software is so difficult to manage in [Fred Brooks' "The Mythical Man Month"](http://www.amazon.co.uk/gp/product/B000OZ0N6M?ie=UTF8&camp=3194&creative=21330&creativeASIN=B000OZ0N6M&linkCode=shr&tag=theginmum-21&=books&qid=1396082978&sr=1-1&keywords=The+mythical+man-month) and it's why there's a picture of a [tar pit]( http://en.wikipedia.org/wiki/Tarpit) on the front cover of that book.

>>Animals are usually unable to escape from the asphalt when they fall in, making these pits excellent locations to excavate bones of prehistoric animals. The tar pits can trap animals because the asphalt that seeps up from underground forms a bitumen pit so thick that even mammoths find it impossible to free themselves before they die of starvation, exhaustion from trying to escape or from the heat that would come from the sun. Over one million fossils have been found in tar pits around the globe.
 
* You probably need to start with what you want the system to do, but once you've opted for a particular package, you then have to switch to determining what the particular package *can* do.  And then, what can it do at scale? So you really want to be involving testers right from the beginning in scaling the solution before you do anything to it (or testing the minimum configuration).  You essentially want to wrap this thing with tests, functional tests, performance tests and maybe even security tests before you even start doing any development - and it would be a bad idea to get it out onto a release environment as well.  At the same time, you want the developers and the analysts to be figuring out what this application can do.
* What we're trying to avoid here is WIFS Syndrome (Word in Flight-Simulator).  Let's say that you want a word processing package for your organisation and your organisation - maybe because it has a slightly too-cosy relationship with the salesman from a particular Microsoft product division has decided they're going to implement this as customised version of Flight Simulator.  The Product Owner comes along to some early workshop meetings and says 

>I want to be able to write letters with this software - can it do that straight out of the box?

The developers scratch their head and say 

>No, we don't think it can.  

Now the Product Owner comes up with the fateful question:

>But could it do this, if you customised it a bit?

And of course, because software is tractable.  The answer is always:

>Yes.

![Mid-Project Review Meeting](TarPit.jpg "This Mid-Project Review Meeting isn't Going as Well as Expected")

**"This Mid-Project Review Meeting isn't Going as Well as Expected"**

The developers start to get excited about how they could use the crop-spraying simulation and put weed-killer in the tanks of the crop-sprayer and therefore make brown marks on yellow cornfields and then by simply switching to the space-shuttle simulator we can view these cornfields from space as letters (yes, I know, something like this actually happened with [PostScript](http://en.wikipedia.org/wiki/PostScript) - which started off as a way of capturing three-dimensional objects, like ships and buildings around New York Harbour - do we really want to go through *that* again?). This project is already starting to look **expensive**, **error-prone** and **disastrously** difficult to maintain (how is this stuff going to work with the next update to Flight Simulator? Thought so).  This project is looking pretty bad, especially compared to good old Microsoft Word which can actually write letters *out of the box*! I've worked on a project like this.

##What needs to happen to stop this?
Testers, analysts, developers and product owners need to pick some minimum viable product requirements, and ideally pick the TPA based on those.  In order to do that, they probably need to implement some stories in *several* TPAs.  The selection of these stories should help coalesce the idea of what the minimum viable product is.  But the stories should also test what it's like to customise the TPA and push it a bit beyond its boundaries.

OK - let's try this.  What's the customer's archetypal story?

>**Story 1: As a nephew I want to write a letter so that I can thank my great aunt for the lovely jumper she knitted me**

And what's the outlier customisable story?

>**Story 2: As a nephew I want to print out this letter to my Aunt so that it looks like it was done in mediaeval script on parchment**

And how do these stories pan out in the two different applications that we've mentioned.

>**In Word: Story 1 takes 1 hour (I know the devs said it would take "2 seconds", but what can you do?)**

>**In Flight Simulator: it's estimated to take 1-3 years and 3-10 million pounds (so probably about 30 million).**

How about Story 2?

>**In Word: The devs said a couple of days - it took a couple of weeks, but there are still a few problems.**

>**In Flight Simulator: 6 months to a year (so probably another 30 million pounds).**

![The punctuation Bomber](bomber.jpg "We're planning on using this for the full stops")

**"We're planning on using this for the full stops"**

Some other things that I'm realising about this process as I'm writing.

* Understanding what your MVP is becomes even more important if you're dealing with TPAs.

* Getting these stories onto a final environment (unless of course it becomes obvious that implementing these things in the TPA is too expensive) is really important as a way of understanding what the TPA can actually do. 

* And testing it with users, load testing it, exploratory testing it.  This is a point I picked up from [Liz Keogh](http://lunivore.com/) - testers are really good at telling you why things won't work and how they're going to break - listen to them.

* One of the values that you want to choose for these initial candidate/archetype stories is *orthogonality* - although this is slightly at cross-purposes (no pun intended) with the idea of an MVP.

* Get an expert on the TPA in right from the start, if it's a new TPA these will probably have to be people from the company that wrote the TPA.  They'll seem expensive, but it's better to find out what magic needs to be wrought to make the TPA do what you want it to do now rather when you've bet the farm on Flight Simulator as a document solution.  That's when it's going to get **really expensive**.

* I've worked on a programme of projects that were trying to develop Word in Flight Simulator.  The Flight Simulator consultants made a *TON* of money.  Surprisingly the whole programme was massively expensive and largely a failure.
