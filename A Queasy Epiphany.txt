# A Queasy Epiphany

So this week I was working on a bid. And the part of the bid that, for me is the hardest to do is the part where you say how project is going to be governed.

What makes this so hard is that the truth is that nobody really knows. It's going to be different in every organization. This is especially a problem if you don't know anything about the organization.  The only thing that is harder than saying how the governance will work in an organization you don't know, is saying how it will work in an organization that you DO know.

I was asked once to get involved in a presentation to a government department, it was a government that I'd already worked in.  I knew they had a lot of problems. Specifically, I knew that they had terrible problems getting development environments and even worse problems getting live environments.  Two previous projects that I'd worked on for this department had been delayed for months because of problems with live environment provision. (See Note 1).

So part of my pitch to this department was along the lines of "We know that your department experiences some difficulties getting environments, we've got experience of working through those difficulties."

In the response to our bid, someone from the Department wrote "The Department doesn't have any difficulties with technology, we've won awards for our digital innovation, you look you'd be a difficult person to work with."

So, back to the bid and project at hand.  It's going to be more than one team. Some of those teams are going to be Kanban, some of them are going to be Scrum. What sort of "governance" are you going to put on top of that?

Well, I hate to say it, but it looks a lot like SAFE.


(Note 1)
One environment that we tried to install our software on had persistent problems because whenever we tried to run our Ansible and Vagrant scripts to install Tomcat, we found that Tomcat was already installed. Eventually it turned out that the company that had the contract to supply the development environment were in dispute with the Department and so were following the letter of a contract to provide environments with certain software pre-installed. But, here's the kicker.  The terms of that contract were secret, so when our guys tried to install something on top of something that had already been installed and got a problem, they were just acting dumb. 
