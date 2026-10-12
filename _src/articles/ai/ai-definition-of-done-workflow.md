---
layout: default
title: dod ping-pong - an efficient ai workflow 
date: 2026-10-12
categories: [articles]
---

# Introduction
My experience with ai coding: Either let ai decide and code, and get software that may work but is certainly unmaintainable, or explain to ai in nitty gritty details how to do it right. It is a lot of effort to make ai produce software that is actually maintainable.

I found a way to make this much more efficient.

This workflow I found very useful, I now use it all the time, I won't miss it. It is very simple.

"dod ping pong" means basically, pushing a "definition of done" list back and fore between ai and the human, as a much more controlled workflow.

## the benefits
- reduces prompt traffic
- work is coordinated, documented, and revision controlled
- workflow is not in the ai memory, but documented
- ai work production is tightly controlled
- the human is in control of all details
- work pace can be controlled very granular

## it's simple, but needs a little explaination first

### definition of done
A todo list is great for organized work, but just write it as if it was done makes it much simpler. You don't explain the "how", but just the "what", example:
A todo would be `dodo: fix bug 42`.
A dod would be `bug 42 is fixed`.
(Just to make the point, of course that can be much more detailed, like
```
[ ] bug 42 is fixed
  [ ] local test passed
  [ ] code change is implemented and committed
  [ ] CI/CD test passed
```
This has now sub-items.

### assigning work
I don't use unicode, but that's just personal taste. I use `J` as checkmark (the shape of the letter resembles a hook). Now I can assign tasts to ai with `a`, example:
[a] bug 42 is fixed
And when ai has it done, it can set it to a LOWER CASE j, so one can immediately grasp the situation: What is open, what is approved by a human, what is assigned to ai, what is done by ai. Example:
```
[a] bug 42 is fixed
  [j] local test passed
  [ ] code change is implemented and committed
  [ ] CI/CD test passed
```
This tells what is the situation, and I personally revision control this. And when it's finished, it is supposed to look like this
```
[J] bug 42 is fixed
  [J] local test passed
  [J] code change is implemented and committed
  [J] CI/CD test passed
```
That's the basics, now comes the magic.

### the simple ping-pong magic: ai generate dod, user edit it, ai do the work
I use two commands (ai abilities, whatever):
`=todo (prompt)` This makes ai generate a definition of done list as a prompt response. I can then just copy it into a file `dod.md`, and edit it to my needs, clearify, adjust, reject, add more, rephrase, whatever, all in one go.

Then I mark as many items as i see feasible on one leap with `[a]` and then i use `=go`.
This makes ai do all the work assigned by `[a]`, without further inquiry or interruption, except if it is not doable, and then it just says so, and give the item line number for items that can't be done, and why.

The main point is that this makes all "discussions" with ai much more straightforward, to the point. And the user control tightly how the work is done.

### setting up ai
To do this, it needs only a little bit ai-policy setup in `AGENTS.md` (or however your coding ai works):

`````

## working with a definition of done list
The file dod.md holds a list of items that define behaviour if work is finished.
It is 'dod' = definition of done.
This is a "todo list but expressed as done-states".

example:
```markdown
[a] the gui has a tool bar with buttons.
  [J] a manifest defined a button: name, image path, trigger callback
  [ ] two example buttons :
    [J] popup test
    [ ] toggle light/dark mode

[ ] refactor:the callbacks are each in it's own file
```
`[ ]` means not done.
`[J]` means tested and it works
`[a]` means, not done, assigned to ai
```
10.AI is expected to make proposals as todo-items in the prompt.
11.AI must never edit dod.md, except marking items as done with [j]
  (the small letter j inidcates that AI has set this task to done).

## commands 

=todo <prompt>
Propose items for 'dod.md', so the user can take them as starting point.
Format proposed dod items inside a code fenced markdown block, like this:
```
[ ] item
  [ ] sub item
```
With proper newline, indentation, and no extras.

=go
For all available, visible, accessible dod.md files:
Check all items assigned to ai by `[a]` and validate if they can be implemented.
For each such item that can be implemented, do so so without any additinal question or discussion.
For each such item that can not be implemented, give the dod.ms file line number where that item starts, and give the reasons why it can't be implemented. Don't be verbose, give a short and concise note.
`````

## final words
Of course feel free to extend, adapt, re-think this is any way you want. It is just an example of how ai can be 'tamed'.

AI, in my opinion, can certainly **NOT** produce high quality software, but maybe in the future it will. Until then, I use this workflow to get maintainable software. So, I agree that the human must be in the loop, and I find the idea to "not look at AI generated code any more" completely insane.

completely


