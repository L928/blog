---
layout: default
title: efficient todo list workflow with AI
date: 2026-10-12
categories: [articles]
---

# Introduction
Coding with AI has polarized opinions these days:
- Proponents state "it's awesome and can do anything with just the right magic prompt."
- Critics say "It can't write quality software"
I am on the critics side, but foud a way to make AI much more workable for real world projects and workflows.

The trick is, that i work with a todo-list that I control, and let AI just do the work. If I don't know how to do something, I let AI create my todo list.

And importantly, that goes all in a flow state. All flowing, flowing, flowing. Quickly, without accidents.

Here is how i do that.

## 1) definition of done
My todo list is actually a "definition of done" list, a "dod"-list, not a "todo"-list.

I find that useful, since it is easier to write down, easier to understand, and independent of the actual action. And an important psychological advantage: The result is envisioned.

I make that with sub items, herarchy as deep as i need, and use a simple typography, but that is really personal. I avoid unicode.
`[ ]` item undone
`[J]` item done (that resembles a checkmark)
`[a]` item assigned to ai
`[j]` done by ai (so it's clear what needs human review)
Example:
```
[ ] bug 42 is fixed
  [a] local test passed
  [ ] code change is implemented and committed
  [ ] CI/CD test passed
```
I name it dod.md (markdown) and I revision control it - that makes it very helpful to see the current state of the commit. I don't need big commit messages, I don't need an extra change log. All done in one strike. Very efficient !

Another important benefit: I can exactly control how much work is done by AI in one step. This way, I can follow precisely what AI is doing, and can fully supervise how the work is done.

## 2) configuring the ai
I have a few rules and commands for the AI, defined in `AGENTS.md` in my case. Soemthing like this ( feel free to make your own thing by using this as inspiration and integrating it into your workflow ).

`````
## commands

=todo <prompt>
Propose items for 'dod.md', so the user can take them as starting point.
Format proposed dod items inside a code fenced markdown block, like this:
```
[ ] item
  [ ] sub item
```
With proper newline, indentation, and no extras.

=preview
Check all items assigned to ai by `[a]` and 
validate if they can be implemented.
Give a description of how to implement it.

=go
For all available, visible, accessible dod.md files:
Check all items assigned to ai by `[a]` and 
validate if they can be implemented.

For each such item that can be implemented,
do so so without any additinal question or discussion.

For each such item that can not be implemented, give the dod.md file line number where that item starts, and give the reasons why it can't be implemented.
Don't be verbose, give a short and concise note.

`````

## how to use that
1) have a clean repo
So you can then review the changes together with their "dod" items.

2) prompt `=todo` and what you want, take the responsed "dod" list, copy it to your dod.md file and edit it to your needs.

3) just say `=go` and come back when AI is ready.

4) Now, `git diff --word-diff=color` shows the items worked on, their state, and all changes in that regard. You can now review this.

5) Repeat

6) After final polish or several refinement steps, whatever
, make your commit. 

7) get your clean commit message
You may just copy paste the first level items with their [J] and then even the git log messages are totally polished in an instance. Searchable, understandable, relatable.

It is fast, efficient and straightforward.

## final words
My experience, so far, is, that software development becomes much more efficient and high quality. I can probably program anything in any language. I tried many. And I can use my knowledge and experience to make the product high quality, maintainable, bug free, fully tested, and suitable for professional grade, or even mission critical software.

I am the human guardian that don't allow AI to produce something that goes out of my control.



