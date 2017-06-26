Version - 0.1 - Aristotle

# Chapter 3 

# Some and All in the Agile Manifesto 

*We will glorify war - the world's only hygiene - militarism, patriotism, the destructive gesture of freedom-bringers, beautiful ideas worth dying for* 

***Filippo Tommaso Marinetti - The Futurist Manifesto*** 

*We are uncovering better ways of developing software by doing it and helping others do it.* 

*Through this work we have come to value:*

* *Individuals and interactions over processes and tools*

* *Working software over comprehensive documentation* 

* *Customer collaboration over contract negotiation*

* *Responding to change over following a plan*

*That is, while there is value in the items on the right, we value the items on the left more.*

***The Manifesto for Agile Software Development***

### The Agile Manifesto 
As we can see from the brief quotation of the Futurist manifesto, some manifestos state a position strongly and powerfully. They are a statement of strongly held beliefs and ideas. They are a call to action. 

But the Agile manifesto starts out like this: 

*We are uncovering better ways of developing software by doing it and helping others do it.* 

Compared to many other manifestos, the Agile manifesto seems unsure of itself. Notice the ways that are being uncovered are not necessarily the *best* ways. They are merely better ways. They aren't even completely known, they are being discovered. In its very first line the Agile manifesto emphasises the importance of *some* rather than *all*. 

The Agile manifesto then moves on to talk about four things that its signatories have "come to value," all of which are worth looking at in detail. 

### “individuals and interactions over processes and tools” 

This is a doubly uncertain statement. It says that individuals and interactions are to be valued over processes and tools. Note that it *doesn't* say that there's *no* value in processes and tools. It also puts forward the idea of software development as an ongoing conversation rather than something that can be captured completely in a document. 

But what this means for software development is only really clear if it is set against the background of the waterfall thinking which was prevalent at the time and which we talked about in Chapter 2.

If something is open to discussion, it is not finalised, it is not complete and the entire appeal of a waterfall approach relies on completeness. 

If software development is an ongoing conversation, then the whole way that we approach it is going to have to change because the old approach of waterfall relies on the notion of the conversation being able to stop, for it to be possible for a stage in the process to be regarded as complete, conversation over.

### "working software over comprehensive documentation" 

This is worded gently but, in its own way, it's dynamite. This is not an absolute statement (get *something* working rather than documenting *everything*). But there *is* something absolute about the idea of working software, and the Agile manifesto values it. 

For the people deeply involved in the development and testing of software what exactly constitutes working software might be a lively debate. But on a more basic level, working software is an absolute requirement. There's a piece of software, somewhere on some machine that will either run and do something, or it won't. It either works or it doesn't. 

The process of getting *anything* to work *at all* is threatening to a project and its sponsors for one reason: when you try to get something to work, especially in software development, there's a chance you might not succeed. What if the very first bit of a project that you try to get working doesn't work? What does that mean for the big idea of the whole project? What would that mean for your reputation? 

Trying to get something working and failing is a dangerous business. In fact the only thing that's potentially *more* dangerous to a project is, well, *getting* something working. Why on earth would getting some software to work be threatening? Maybe now it’s time for another story.  

I was working on a fraud detection project for a big retail bank. I was supposed to be the  “Agile Coach”. But all the time that I'd been working on it, it had been a good, old-fashioned waterfall project. Often, trying to earn my keep as an Agile coach, I suggested that the best thing to do would be to start doing some actual development: “Working software over detailed documentation.” But I was told that that could only be done when the project was sufficiently detailed it could be estimated within “plus or minus ten percent.” When I asked what we needed to do to satisfy ourselves that we’d reached this level of certainty, I found that whoever I was talking to suddenly remembered that they had a dental appointment, or that they needed to rush off and pick up their kids from school. Even the ones that I knew didn’t have any kids. 

Then, suddenly, requirements gathering stopped.  Not because everybody was now certain how much development would cost within the fabled plus or minus ten percent, but for a far more powerful reason. The budget for analysis ran out. 

And so, with the budget for analysis exhausted, the team started to do development in an Agile and iterative fashion, using an Agile method called Scrum (we'll talk about Scrum a lot more in the next chapter).  We planned just a fortnight's worth of work at a planning meeting. Not all of the work. Just some. The development team worked on it for a fortnight. Every morning we had a stand-up meeting where we talked about the work that we'd done the day before and the work that we were going to do. Again, not even all of the work for the fortnight, just the small part that we were currently working on. 

At the end of the two weeks we had a “Show and Tell” where we demonstrated this small bit of working software that we'd done to the people who represented the customer, the product owners (in Scrum there's only supposed to be one product owner, but this was a far from perfect Scrum set up, so there were three); the stakeholders who'd instigated the project and the users inside the bank who would actually use the software when it was finished. 

Fraud detection is a really important function in a retail bank. There were lots of stakeholders interested in seeing how the project was coming along. The Show and Tell wasn't just a packed meeting room, but also people dialling in and sharing the presentation screen: in India where some of the development was happening; in Scotland; Northern Ireland; and in the South East of England where people who worked with the current system really wanted to know what the new one would look like. 

One of the product owners talked through the working software showing very first screen of the new fraud detection system. And in the room and online, on what had been a very noisy conference call, there was a very awkward silence. 

“I thought we'd agreed that the workflow would be organised by account holder rather than account number,” somebody said eventually. 

I was in the room with the lead business analyst (BA). She frowned “No, I don't remember that being agreed anywhere.” On the conference call there were gasps, sighs and sharp intakes of breath. “See the problem is...” continued the same voice “...fraud detection only really makes sense to us if we can look at all of the accounts held by one individual, rather than just looking at one account.” 

Up to this point, millions had been spent on business analysis for this project. Months, if not years, of time, had been spent on it. And remember, so much of that time and money was spent in the hope of getting a complete specification, a specification that captured *all* of the requirements “within plus or minus ten percent.” Although nobody who could plausibly claim to have either teeth or children would ever admit to knowing what that meant. 

But after less than ten minutes of letting the people who would actually use it look at the *working software*, it became obvious that a lot of that work would either need to be redone, or thrown away entirely. 

This is what makes the Agile manifesto's emphasis on working software so powerful, but it's also what makes it so threatening and dangerous. No manager, no stakeholder, wants to find out that they've spent huge amounts of time and money on the wrong thing. 

### "customer collaboration over contract negotiation"

Again this value emphasises the incomplete, partial and conversational nature of software development. Just as there is no requirements document that can capture *all* the details.  There is no *contract* that can capture all of the eventualities and guarantee, either valuable software for the client, or a reasonable margin for the developers. The whole process needs to be a continuing collaboration.

But remember, this isn't to say that software development projects don't need contracts. Looking carefully at what the manifesto actually says. It says that it values customer collaboration over contract negotiation. People react to this line in the manifesto in some strange ways. In fact what they do is to react to the suggestion of partial solutions absolutely.

For example, one way that people react is to say “There's no way that we can do business without a contract.” This is to hear the idea that's suggested in the manifesto - “contracts aren't everything” and interpret absolutely as “there should be no contracts.”

Another way that people react to the suggestion of an Agile approach is to say “OK, you need to tell me exactly what an Agile contract will look like that will absolutely ensure that this project will be a success.” Yes, this is crazy, but variations of this demand are quite common. 

Let's think about what's being asked for here. In response to the suggestion that customer collaboration should be valued more than contract negotiation, some one has said “OK, but I'd like you to tell me what the contract looks like that guarantees the success of this kind of approach.”

Could a contract be written that allows for *every* eventuality? Is it worth trying to capture *every* eventuality? Is the time spent on the “development team fall victim to alien abduction” clause worth the effort.  As with the story I told above about the fraud detection project, how would you know when you were finished, even if you allowed yourself the margin of “plus or minus ten percent.”

But none of this really addresses the real reason that it's not worth the time to try to get a perfectly-crafted contract and a minutely detailed specification. The real reason that either of those is a waste of time is because the situation that you're drafting a contract for isn't the situation you'll find yourself in and the specification of what you think you want now isn't anywhere near what you'll ending up want. Or what you'll finally get.  Why? Because things change.

### "responding to change over following a plan" 

Let's go back to that story of the fraud detection project and the awkward conversation that happened just a few minutes after looking at some working software. The way I told it, and the way it played out, was that people who currently did fraud detection, the people who were going to use it, had known all along that the system would only make sense if transactions were grouped by individuals rather than by account. But what if that wasn't true? 

What if the users had started to realise that this was a really important requirement once they'd seen the screens? What if their understanding of what they wanted had *changed* as a result of them thinking about what they wanted, or as a result of looking at what they'd asked for.

Highlighting that responding to change is the business that we're in, rather than delivering on a plan attacks the whole idea of a project as being merely a missing peg on the peg board. 

When we think of project management of software as the management of change it becomes more obvious that the empty slot in the peg board could indicate *anything but 3* rather than just a 3-shaped whole that still just happens to need to be filled. 

Management of software development isn't just a delivery of something that fits in a slot, it's an exploration of what might fit in the slot.  And as with any exploration, as we explore, our understanding changes.

## The Power of Mildly Suggesting "Some" 

The Agile manifesto gets its power from almost doing the opposite of what's expected of a manifesto. It gently suggests that to *some* degree we try to do *some* of *some* things, that we do partial things partially rather than complete things totally. Taking these suggestions seriously, for example, by looking getting *some* working software as early as possible in a project, has powerful implications for how software development gets done.

By doing this, the Agile starts to give us an idea, possible a very counterintuitive idea, of how we might go about delivering the promise of this book - the impossible.

What the Agile manifest *doesn't* do, and how could it in so few words, is give any good ideas about what we might do to make this actually happen in software development.

For that we need a method that essentially tells us that we need to keep doing *some* *all* of the time. And by far the most successful approach to that is a method called Scrum which we'll deal with in the next chapter. 

