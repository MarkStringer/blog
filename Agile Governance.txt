31/08/2015
#Agile Governance
OK - this is a commonplace - so what I write here doesn't have to put anybody at their "Cognitive Ease" (I'm listening to "Thinking Fast and Slow" to put me to sleep at nights).

First of all, governance - look it up in a dictionary.

>[**govern (v.)**]( www.etymonline.com/index.php?term=govern&allowed_in_frame=0) 
>late 13c., "to rule with authority," from Old French governer "steer, be at the helm of; govern, rule, command, direct" (11c., Modern French gouverner), from Latin gubernare "to direct, rule, guide, govern" (source also of Spanish gobernar, Italian governare), originally "to steer, to pilot," a nautical borrowing from Greek kybernan "to steer or pilot a ship, direct as a pilot," figuratively "to guide, govern"

The notion of *governance* is metaphorical, it comes for the Greek word for steering a ship.  Control is about steering. And what do you need to steer a ship - well you need *controls* - a wheel you can turn - a tiller you can push and some ropes that you can pull. But also - this should be really obvious, but it seems to get forgotten more than it should - you need to be able to see where your going and you need to see the results of pushing the tiller and pulling on the ropes - you need **feedback**.

And these steps - 

* Looking at where you are 
* Deciding that's not where you want to be
* Deciding how to operating the controls in a way that will get you nearer where you want to be
* Looking at what the effect has been of operating the controls

These steps have to be done in any situation that involves governance - and they have to arranged in a loop. There are lots of names for the loop:

* Inspect and Adapt
* Plan, Do, Check, Act
* Observer, Orient, Decide, Act
* Plan, Show and Tell, Retrospective (Scrum)

What's common about all of them is that they are **feedback loops**: 

**the product of one cycle through the set of steps is "fed back" into the next set of steps**

When we come back to the origin of the term, we realise that this is fundamental to governance: the pilot of the barge can't set the controls and then just wander away. Except - well, no, actually sometimes you can, when the wind is reliably blowing from a certain direction and he's in open seas, the steersman (kybernetes) *can* tie of the ropes and the tiller and go for a break. But in such situations, the steersman would be listening very carefully for any sign that the wind was changing.

This makes clear a second, *very* important aspect of control, which might not be initially obvious because it's so obvious in the example of steering a ship:

**The time it takes to get around the feedback loop - the required tempo of the loop - will vary according to the navigation conditions.**

In calm seas, it might be half an hour (with an ear always out) in twenty feet waves, it might be less than a second.

In general:

**If there isn't a feedback loop, there isn't any governance**

**If the tempo of the feedback loop doesn't match the conditions, there isn't any governance.**

But something very disturbing seems to creep into a lot of conversations about governance of software development, especially governance of *Agile* development.  This is the idea that in software, governance doesn't really require feedback. That the piloting of a software development project - even a software development programme - can somehow pilot itself, given the right line-and-box diagram for the programme structure. All the "Governor" at the top of the pyramid (and it's always a pyramid) has to do is to set the direction and the governance structure will "auto-pilot" to the required destination.

Sometimes, a sort of feedback is built into these line and box pyramid structures and is termed "gate review".  There is a feeling amongst the people who suggest these structures that the necessary control can be provided by having a strict gate review where the "governors" give feedback at then end of each period of development.

It's taken me a while to understand what's wrong with "strict gate reviews", but finally, I think I understand.  The problem with "strict gate reviews" is simply that they occur at the wrong tempo. They are feedback - but they're feedback like a air crash investigation is feedback. Having a gate review every 6, 8, 10 weeks is the equivalent of the steersman coming up on deck every two or three hours during hurricane Katrina.

So there needs to be some more connective tissue here - a better linking passage from what I've just been talking about to what I'm going to be talking about - John Boyd and his thinking around command and control.

Boyd's thinking around command and control is presented - as tends to be the way with Boyd - as a rather opaque set of notes for a presentation - or "briefing" as they are called in the military. Boyd is writing at a period in his life when he's been reading a *lot* of military history and developing ideas which explain the success of guerrilla warfare in terms of his flavour of the empirical "Inspect and Adapt" cycle - the OODA loop.  Boyd's idea is that if you and your team can get round a cycle of observing, orienting, deciding and acting *faster* than your opponent, then you will win.  Another concept that Boyd is developing here is one that he borrowed from Clauswitz in his work "On War."  

Boyd was simultaneously respectful and critical of Clauswitz. He thought that Clauswitz's analysis of war was ultimately lacking some important features, but he did agree with Clauswitz that one of the most important features in war was to remove "Friction" within your forces - that is, remove the things that are slowing you down.  Friction for Clauswitz included poor communications, poor supplies chains, poor equipment and lack of clarity in direction from leaders.

Another example of "friction" from the long career of Boyd can be given in Boyd's investigation of the reasons that the American F-86 fighter out-performed the Soviet MIG-15 **by a factor of up 10 to 1** in the Korean war.  On paper, the Soviet MIG-15 was a better plane - it was on a par with the F-86 it terms of manoeuvrability according to Boyd's calculations.  However, there were two things that made the F-86 far superior to the MIG-15.

Firstly - the F-86 had 360 degree visibility through a bubble canopy - trying to see out of the cockpit of a MIG-15 was compared to "looking through a Coke bottle."

Secondly the F-86 had hydraulic controls - the MIG's were manual.  The hydraulic controls weren't tiring to use - it was easy to do one manoeuvre followed by another, followed by another. Just flying the MIG in normal flight was exhausting. 

So, here I am getting finally to a vision of what Agile governance looks like. 

**Agile governance doesn't look much different from traditional governance - but it has two main differences.**

1)	Feedback loops - which are lengthened and shortened adaptively 
2)	An ongoing focus on reducing "friction"

OK - so how do you reduce friction? Well, first of all you attack those things that increase friction: 
##1. Filtered Feedback
What feedback there is in a governance structure is very often processed and filtered so that **only good news is passed up the tree**.  Think back to the steersman steering the ship - does he want only good news? No! He needs *all* of the news - he needs to know where the rocks are relative to the bow and how the bow has responded relative to his most recently push on the tiller.

##2. Lateralisation
One of the ways of appearing to reduce friction, which actually makes thing much, much worse, is grouping people with common outlooks and common skills together. I've seen this just recently - each team had a UX designer and an architect and a tester.  The leaders of those groups pushed and pushed for UX designers, the architects and the testers to become separate teams.

##3. Cliques
The opposite of lateralisation is a multi-functional team that doesn't communicate with anyone outside of the team.  This also leads to "uncooperative centres of gravity" as Boyd calls them. A team needs to continuously have input from the outside, in order to gain trust and in order to gain "integrity" - a picture of the world which is getting closer to the world. 

##4. Assuming that there is a "one size fits all" approach to governing software development.
The best way of making an Agile governance process low friction is to understand that it is empirical - the process itself must be continuously inspected and adapted and that part of that process is to continually look for ways to reduce friction.

Things that reduce friction:
##1. Trust
The more the members of the organisation that is being governed trust each other, the lower the friction between then and the easier it is for them to communicate.

##2. Common culture/understanding/approach
The more that the members of the organisation have a common culture/understanding/approach, the easier it will be for them to communicate with each.

##3. Freedom for actors
The people in the organisation who actually do things, should have a considerable degree of freedom in *how* they do what they do (note that this conflicts to a degree with common culture).  In Agile development this applies particularly to Product Owners and development teams. 

##4. Simple interfaces, ruthlessly applied
One way to allow freedom of actors is to create simple interfaces. This is discussed in this leaked blog post. Where the power of Amazon is revealed to be in allowing teams to develop their code how they liked but ruthlessly applying a rule that dictates that any software that is development exposes an interface as a service (this is in essence Boyd's enthusiasm for guerrilla warfare interpreted as software).

##5 Leadership - Clear, Simple Commands
The leadership requirement that accompanies the requirement for freedom for actors and simple interfaces is clear simple commands.  This recognises that the detail will necessarily have to worked out by the actors on the ground.

##6. Multiple sources of feedback
A successful steersman has multiple sources of feedback.  He's watching the sea, he's watching the boat, he's watching multiple instruments.

##7. Integrity
The governing organisation needs to be integral - that means that it needs to be set up to match reality. The organisation, in its structures and in its ideas needs to have a good model of the problems it is solving. What makes integrity so difficult is that **the organisation's view of the world is always slightly wrong** that's why we need iterations, that's why we need to modify our decisions and actions in light of actual performance.

A sign that you have integrity in your organisation is that conflicts are being identified and as a result, fundamental changes are being made to how the organisation operates and what the organisation's understanding is of its mission. A sign that you don't have integrity in your organisation? Missed deadline, after missed deadline and missed deadline and the presence of whistleblowers.

##8. Appreciation - clear interpretation of feedback
Feedback is useless if nobody is paying attention to it.  In order for the steersman to steer the boat, it's not enough that he can *see* what's happening, he has to also *look* at what he can see and attribute value to it.

##9. Variable tempo
One way to understand why a traditional up-front plan and hierarchical command and control structure is unsuccessful - even though to so many people it *looks* like the right kind of thing, is to think that it *is* the right kind of thing, but it just is being done at the wrong tempo (once, or at most several times per project rather that, at some points every week, and maybe every day) and without anywhere near the right amount of feedback.  In my experience, in the early stages of software development projects, there are fundamental problems that require high levels of organisational knowledge and seniority to fix (security passes, office furniture, wireless networking and hardware purchasing).  Later on, when teams have got past their storming and norming phases, it may be that the feedback loops can be longer.  Later on still when software is being released, it may be that the feedback loops need to be less than a day.

##10. Tidying Up - continually removing friction
Just as an engine gets dirty and inefficient, a sail gets ragged and the clean cut of a rudder through the water gets broken up by weed and barnacles an organisation will tend to increase in friction. An Agile approach to governance needs to focus explicitly on identifying and removing friction, certainly through inspection and adaptation - but, also, picking up on the simultaneously mystical and fundamentally scientific aspects of Boyd's thinking regarding the second law of thermodynamics, an organisation should look to bring in "new blood".

##11. Feedback champions and feedback professionals
Feedback doesn't craft itself. Somebody has to write it, or draw it, or whisper it in somebody's ear. The Scrum framework creates, in the role of Scrum Master a tremendously powerful feedback champion, almost some might think an internal whistle blower. Unfortunately, this role isn't universally appreciated.

By all means use a wiki like Conflence to capture technical documentation and how-tos.  By all means use an Agile Lifecycle Management tool like Jira. But also understand the quality of the governance is the quality of the feedback, and in order to get quality feedback, you need people to provide that feedback who not only understand what it means, but can express what it means.  If you want good communications (and you do want good communications) you need to hire good communicators. Artists who can put together data visualisations, writers and editors who can turn what's in the wiki into prose. 
