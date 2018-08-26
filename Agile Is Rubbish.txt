# Why I hate Agile *

\* Note: I don't hate Agile. Agile literally changed my life. 

But I don't work as a developer on Agile teams.  

This is a series of complaints from a friend of mine who's been working as a developer on Agile projects for years and years. I've attempted to find some answers and then I'll give him a chance to respond. 

>>1) Things are considered by those with the loudest voices/fastest responses, not necessarily the best placed to provide an answer.

>>Some idiot is barking out unintelligible random words in a backlog refinement session, skewing the session so nobody really knows what's going on and everyone's too shit-scared of appearing ignorant.

>>Just hold up your estimation card with an average value and nod along with the rest of the doomed.

This isn't just a problem unique to Agile, but it's a problem that Agile teams can be susceptible to. 

When I'm coaching I spend a lot of time persuading teams that they don't have agree with each other and that it's OK to foreground the disagreements. 

Not all developers are introverts, not all developers are conflict averse, but some of the ones with the best ideas are. If you think there's a conflict, look for places to make that clear. Preferably of course, quietly and politely. If you think your opinions aren't getting the consideration that they should, you should also make that clear. 

Retrospectives are the right place from an Agile point of view. But there's also a lot of power in doing it in a "topical" way - i.e. when the thing that's bugging you happens.

I used to say that there were no dumb questions until someone asked my wife (who's a London Blue Badge Tourist Guide) why they built Windsor castle so close to the airport. But if you think about it, even asking a dumb question like that reveals a fundamental misunderstading that needs correcting. If you've got a dumb question, ask it. You're a senior developer now, have the courage to ask the dumb questions and look dumb. Very often when you ask these questions, it turns out nobody knows the answer.
 
>>2) Anybody can do anything at anytime.  Really ?
>>Like so I want a house built, so I employ a load of builders and they want to build it on Agile principles.  Eric the electrician isn't available, but Pete the plasterer says he once saw a video on YouTube about wiring a house, so he'll give it a go.  
>>As if anyone would ever do that.
>>But it might be seen as possible that a UI guy would craft some heavy-duty C# business logic ?
>>Yeah, right.

This is a misunderstanding of how Agile teams are supposed to work. Yes, everybody is supposed to help out as much as they can, and sometimes that might involve them doing things that are beyond their comfort zone and skill set, but it definitely doesn't mean that anybody can do anything. It doesn't even mean that there's an expectation that team members will normally be doing things that aren't the thing they're good at.

Software development is knowledge work. Team members are hired for their deep, subtle and rich skills and experience. The only way that you're going to get the best out of teams is to allow them to work to their strengths.  But let's be honest, there are also some rubbish jobs that need doing as part of development that no one wants to do, or where the skills of the team are missing.  This is where everyone *does* need to help out a bit. The other thing that you really want to avoid is the crossed arms "I've  done my bit" kind of vibe and any kind of "throwing stuff over the fence" dynamic.

>>3) The assumption that you have to be the fastest to market otherwise you would have failed.
>>What if you're working on a product which is going to be released but there is no 'competitive marketplace' ?

This for me is really fascinating and really isn't talked about very much.  There are loads of examples of products that were first but didn't conquer the market. One thing that I realized recently is that if you think about the [Cynefin framework](https://en.wikipedia.org/wiki/Cynefin_framework) (sorry more Agile orthodoxy) it indicates that software development is a *complex* business. But it also indicates that making money (or getting value) from software is a *chaotic* business - and like other chaotic businesses, as Albert Goldman said of the movie industry, "Nobody knows anything." Putting bad things out really fast is a strategy. As a software developer, you might not think it's a good strategy, but you're not in the position of trying to make money in a chaotic market. In my experience, everybody is embarrassed about how little they know about their business. And think about it, you've talked the board/bank/VC's into giving you several million to spend on something that might get furiously ignored and disappear without a trace.  You might be a bit embarrassed by that.

Trying to do things quickly is interesting because from a business view it sounds great and it's one of the hardest dumb strategies to argue with. I suppose it gets easier to live with when you realize that they're all dumb strategies. And compared to other dumb strategies, at least it's superficially cheap (unless it results in something expensive like leaking all your customers emails) and you will learn from it. The things you learn might not be pleasant, but hey.

>>4)  Process by the backdoor.
>>So Waterfall (hiss, boo) is baaaad because there's too much process.  And there really are problems because of this.
>>But when you do process in Agile it's good because....erm....because it's Agile.

>>In fact this works in a broader sense: you're doing stuff the Agile way, so it has to be correct...because it's Agile. Right ?

>>Retrospectives, DoD, DoR, sprints, stand ups...that's 'ceremonies', so that's OK.

Two things about this. Firstly, I find myself saying a lot as an Agile coach that Agile is a *lightweight methodology*. For me if you're doing the four Scrum meetings and you're talking to each other then you've got most of it. DoD, DoR should emerge as agreements between the team to help them produce code that's valuable to the organization more quickly and effectively.  If they're not doing that, well then, they need changing or junking.

Secondly, Agile is related to Lean.  And in Lean there's lots of process (although it's important to understand that manufacturing is very different from software development). It's not *process* that is bad necessarily. One thing that Lean focuses on as being bad is large batch sizes. That's the main problem with waterfall. Trying to get everything right, right at the beginning is expensive and doomed to failure. But what's the right size? How much detail should be in any particular requirement before it's ready for development? How much testing should have happened before we're comfortable to release it? All of these things are judgment calls and teams will get them wrong before they tend towards getting them right. From an Agile point of view, you want to at least be trying to limit what's asked for in the DoR and DoD because both of those things are actually driving up the batch size.

>>5) The idea that you can do 'pure Agile'.
What is 'pure Agile'?  Like 'pure water', or 'pure bullshit' ?
No idea.

Purity appeals to people. But, you're right. It's bullshit. Scrum is a powerful, simple, set of heuristics (rules of thumb) that are just trying to realize an empirical process. Empirical process, that's the "purity" that Agile should be aspiring to (aspiring isn't the same as attaining). Empirical process is said to have 3 pillars: inspection, transparency and adaptation.  

The whole point of the Scrum meetings is to provide inspection, transparency and adaptation (the three pillars of the empirical process) - the meetings are there so that the team (including the product Owner) can see what's going on (inspection and transparency) and change what's happening if they see a problem (adaptation). That's also the point of things like physical Agile boards.

If you're being honest with each other about how things are going (transparency); paying attention to what others are saying (inspection); and you're changing what you're doing in light of what you learn in those meetings (adaptation) *then* you're doing Agile.

>>6) "Individuals and interactions over processes and tools."
>>I remember once being encouraged by a Scrum trainer to think about handing a dev a list of bugs, sorry, issues, I found, when testing some functionality, on a piece of paper rather than writing up the issues as Bugs in a defect tracking tool.  
>>The idea was as I found them I gave them to the dev so I was, you know, working face-to-face with my colleagues and collaborating.
>>OK, all well and good.
>>So I found an issue and when I went to the dev he said he was busy as he was right in the middle of some code, so maybe I could come back later with a list of all the issues I found.
>>So I began putting together a list, but there were so many issues I had to number them, uniquely.
>>And some of the Bugs were similar to others and some were subtle, so I had to title each one and give a description of each (the piece of paper was starting to get pretty full).
>>Then when the dev got the piece of paper he wanted precise instructions of the environment and how to repro the Bug, the reproducibility %, oh, and screenshots might be nice.
>>So basically I ended up making a defect tracking tool.
>>Or I would have if I didn't have a brain - I used the defect tracking tool that was available. Job done.

Individuals and interactions over processes and tools doesn't mean no processes and tools. But there's a danger with issue tracking systems and a tendency of developers that can combine in counterproductive ways. In my experience, many, many developers are of the opinion that if only they could get the right issue tracking system and put the right detail in the tickets, they need never talk to anyone again: *that's* what "Individuals and interactions..." is trying to counter.  By all means capture detail in some kind of electronic tool, but if you don't also talk about what you're capturing, ulitmately that's going to be a problem.

>>7) "Working software over comprehensive documentation."
>>What that really means is no documentation, except for APIs.  

>>What's so special about APIs over anything else ?  DB schemas, architecture diagrams, UX wireframes ?  Search me.
>>So how do you regression test everything when the software is picked up by people after you've left the company and there's no documentation?
>>Search me, that's their problem.  It's the Agile way.
>>Or maybe you just automate everything, because all software deliverables can be 100% automated in a sprint. Ahem.

As much as possible automation *should* be used for regression testing. This becomes really important when you're building and releasing software more and more frequently (some teams are doing it hourly or daily, but most Agile teams are going to be doing it weekly of fortnightly). And acceptance-level, scenario-level automated tests really aren't that bad a way of documenting a piece of software.

The worry with documentation is that it goes stale. So if you do need to create documentation (and nobody is saying that you don't) then it's not a bad idea to put it in the same source repositories as the code that it describes or, sometimes a better idea, *in* the code that it describes.

>>8) "Customer collaboration over contract negotiation."
>>Eh ?
>>Actually I kind of know what is intended here, it's to bring the customer in.
>>Except that often the customer doesn't really know what they want except that it's got to be faster, brighter, bigger ... what they currently have but just, well just better.
>>Collaboration has to work both ways.  Just try citing this principle to upper management when you've spent 3 months working on a minor feature for a customer who is bringing in minimal revenue.  Hmmm.

We're back to the Cynefin framework and the chaotic nature of the markets that software is being deployed into. There are naive clients who will ask you to do stupid stuff. There are sophisticated clients who will ask you to do stupid stuff. But if you think that somehow relying on a contract is going to save you then you're just as deluded as the dumbest customers. 

What this third value in the Agile manifesto is really saying is that the best chance you have of succeeding with your software is to build it in close collaboration with your customers. What it's *not* saying is that this collaboration will result in success. 

Customer collaboration helps doing the "work right" but it only starts to help with doing the "right work."
Again, there are a *lot* of trade offs here. Customers can break the project in a multitude of different ways. Customers often encourage the team to do a bad job in various ways - skimp on writing automated tests, JFDI rather than bothering with thinking about architecture and design. 

And of course responding to change is generally good but there is a size and direction and frequency of change that will break any team. All of this needs pointing out to the customer preventing them from breaking the team is an important part of collaboration.

Of course, in lots of Agile projects the problem isn't that the customer is too involved, the problem is that either the customer is distant, or no one really knows who the customer is.

There can be a lot of reasons for this, one of them is not really understanding that it's important. But another is that chaos that we talked about. The smartest customers are going to understand the risks inherent in releasing software. They're going to know that there's a chance it will succeed and also a chance it will fail. The smart ones want to be left standing next to it when it succeeds and be nowhere near it when it fails.

So "customer collaboration over contract negotiation" barely scratches the surface. What it really means is "management of your relationship with your customer is the only chance you have of your project being a success but it's by no means a guarantee."

>>9) "Responding to change over following a plan."
>>Which really means let's change things because we can.  Even if it makes little sense.  Even if the old way worked.
>>Because there's no harm in trying something new is there ?
>>Well there is actually if it used to work fine.  Time and money and agro, that's what it costs you.

Obviously you can break things by changing them. You can also change what you ask a team to do at a sufficiently high rate that you break the team and leave it producing garbage.

But if you don't incorporate the possibility of change in to process you reduce the chance of success to nearly nothing. 

Most customers genuinely don't know what they want when a project starts, but Agile tries to stop that being a problem with its emphasis on working software (so the customer can see what it is they've asked for and then get an idea of what it is they *actually* want). This means constant collaboration with the customer and responding to change as the customer's understanding changes.

>>10) The fetishisation of non-tech solutions.
I just don't get why, when you've got tools out there that do the job better, you have to use postits and whiteboards.
The cleaner comes in one night, knocks some postits off the board, puts them back on the board in a random order.
No-one notices, no-one cares.

I prefer index cards with blue tac precisely for that reason. If no one is noticing and no one is caring then that's probably a sign that there's something wrong with the communication on the team. As a Scrum master keeping the board up to date gives me a chance to notice various things. Stories that are stuck - stories that nobody ever picks up, 11 stories in progress - 6 members of the team?

The low tech board also helps with stand-up. Team members can point to what they're working on. And that results in conversation. And I know lots of developers who are firmly of the opinion that if only they can get the right fields and the right work flow in their life cycle management tool they need never speak to anyone ever again. Are you certain that you're resisting the low tech way of displaying what's going on in the sprint? Or are you really resisting having a conversation about what's going on in the sprint?

I have to say I'm not precious about it - a big screen on a projector will do just as well provided that it can be set up in less than 20seconds.

>>11) Agile's good because it makes you more competitive and efficient.
>>Except when everyone's doing Agile so you lose any competitive margin or personality that your organization used to have.
>>So you end up like any other software house trying to be cool with your coffee and pizza and estimation cards and post-its and whatever.

A lot of what you've complained about all the way through is about what's sometimes called "cargo cult agile" - focusing on the practices without really understanding how they interact or help deliver software more effectively. In reality, Agile is a set of practices for improving practices. The teams that *really* understand this are going to perform multiple times better than teams that are reluctantly going through the motions of the practices.
