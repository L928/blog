---
layout: default
title: Direct Code Review
date: 2026-10-07
categories: [articles, software maintainability]
---

# recap: what is maintainability
"to maintain software" does not reflect the original meaning of "to maintain" (to keep in a desired/workable state). We talk about "maintaining software" actually for whatever work we do on the software, in fact, changing the source code in any way, be it bug fixing, new features, cleaning, refactoring.
That actually means **reading** and **writing**. I repeat. Changing code happens by reading code and writing code. So, maintainability becomes "readability" and "writability". Can I read that code? Can I write code that fixes a problem? Can I change a wrong variable name? Can I clean up some parts that are difficult to work with?

(Reading obviously implies understanding, so "reading the code" means of course "understanding the code".)

Reading code is one thing. Writing code is the other half. For example, "technical debt" finally just means "can't be written". For whatever reason. "We don't have time for cleaning". "It works, don't touch it, that's too dangerous".

Trivial, obvious, blatant as it is, there is almost a cult of mysteries around that. Dissertations (Top 25 for example, anyone remember?). Countless books (I love them).

"Maintainability Index" is "The magic number that reveals everything". The machinery behind the computation of that number is actually a business model! Companies that offer static code checkers make a lot of money from that promise to deliver "maintainability". I personally have it seen in practice, as all of us, but I have not seen that the problem of unmaintainable code disappeared.

And that "machinery" is suspicious. People disagree a lot. I don't go into that here. False positives, endless blogs, and so on. There isn't even an agreement on how to get that magic value. Everyone has his own version, and that is certainly the right one (or "better", for smaller attack surface).

Maintainability is readability and writability. Anything else is secondary to that.

Maintainability is the one big problem in software development. There is no other problem. This is the one that makes everything unpredictable.

# recap: the purpose of code review
Usually, people understand "one is blind toward own mistakes" and therefore consider that a reviewer is supposed to point out mistakes, like styleguide violations. The practice of code review is usually something like: CI/CD triggers code review, with a text communication interface for annotations, discussions, back and forth, ping pong, until several "clutter commits" (fixed typo, fixed whitespace...) later, it is done.

I consider this very inefficient (effort vs. gain) and very ineffective (don't fix the original problem really).

So, I propose a different method of code review, that addresses the problem of maintainability more directly.

# Direct code review
1) A reviewer should do only one thing: Read the code. 

If he can read it, the code is readable. If he can't, the code is not readable and something must be done about it.

(Trivial exception: “Understanding the language’s syntax is essential for a reviewer.”)

No tool whatsoever can do that. Only a human can do that. And that's why code review is more important than those tools or rules or heuristics.

Machines can detect style guide violations and so on, but they can't "read the code".

2) Seniors are not relieved from being reviewed.

If a junior can't read the code of a senior, there is no excuse: That code is not readable (again, given the junior understand the programming language of course). 
A random assignment would be honest. How about building a fortune wheel, or throw dice, or implement a schedule system that guarantees that every senior gets reviewed as well as the juniors?

3) Review must not only target changed code.

How about skipping the review of changes in CI/CD at all and instead spend that time on reviewing the code as a whole? Or at least a mix? 

4) Review should be early

Why not sitting together **before** committing? It is more efficient.

5) What about writability?

That is still an open question.

I see the biggest problem in the "micromanagement" of "modern scrum": Everything is a jira issue, and the pull/merge request must not have something else.
So, the "boy scout rule" = leave it cleaner than you found it - simply can't be applied.

Similar circumstances happen for several other fundamental points, but that is another story.
