+++
title = "Literate Programming for LLMs"
slug = "literate-llm"
date = 2025-04-14
description = "Exploring a novel use case for Donald Knuth's literate programming style"

[taxonomies]
tags = ["ai", "emacs", "programming"]
+++

LLMs have brought fourth a flurry of new development tools, purpose built IDEs and agentic pair programming partners. With varying purpose and capability among them. Tools like Replit enable whole codebases to be generated entirely from natural language. Cursor and Zed as editors give the same power and utility in the form of an IDE, and we're starting to see agent's that submit pull requests and perform code review on others.

With ever growing context windows, tool use and reflection, we've seen a growth from what started as prompts for "generate a function" or "explain this file" to "build a directory skeleton for the codebase, populate it with examples and create a demo page using the attached styleguide". Locating bugs in huge codebases is now possible. What doesn't fit in the context window, can be gathered by tool use. One shot bug fixes are possible when an LLM is able to perform a trial and error process with tool use in real time.

The way we write programs is changing, and the role of "software engineer" will evolve to a more skilled role of "software architect". LLMs increase the throughput of "blue collar tech worker" roles. Documentation, bug fixes, and minor changes are no longer hourly tasks. We're now acting as shepherds to a fleet of tools, rather than artisans.

So how can we work best with our new fleet? The capabilities of new models, the growing context windows will scale until the models catch up with the hardware, Moore's law, and available data. Adding more context and context length has a point of diminishing return, and it feels like we're close to that. It seems like more data is needed to train more intelligent models, and there is a cap to the amount of data that is available. 

Optimizing the context that we provide to the LLMs seems like a logical best step. My idle observation has been that tools across the board, Replit, Cursor, Zed, Claude code, etc, tend to exhibit the same behavioral issues in different manners. Reports like "GPT in Cursor deleted my project", or "Claude submitted a 2,400 line delta PR to change the color of a button" seem ubiquitous between different models, and different tools. I use GPTel in emacs, with tools to interact with the file system, repos, etc. 

Personally, what I experience:
- A model with too much context can get stuck in a diagnostic loop. Clearing the context and starting a new conversation opens up new trains of thought
- A model with too little "dialogue" context will work beyond scope of it's task. It may start refactoring a project to solve a line item issue.
- A new session brings  a lot of non-deterministic behavior out, and the "personality" and approach of that model becomes scoped as the conversation continues.
- The model can focus big picture, focus little picture, and somewhere in between. But not all at once. Big details like "don't use recursion in this project" get lost, but it generates  an otherwise perfect chunk of code.

I do a lot of metacognition. I feel that understanding how I think can help me understand how to adjust to a problem. When I think about the hiccups I've experienced when programming with the aid of LLMs, I try to compare cognitive patterns of the LLM with cognitive patterns I've had before. Since reading Dale Carnegie, I've built the subtle habit of thinking from the perspective of another. 

So, when thinking from the perspective of an intelligent, but uniformed LLM, waking up with their memory wiped and a leetcode problem before them, I try to think about what might guide me to do best. What would give me the best context to do a change and keep it scoped? And what would entice me to refactor the entire project to do a style change? 

When taking over a new, complicated and foreign codebase, I've seen other developers, and I've even seen myself, feel the desire to refactor everything. Maybe it's working, but a lot of times that refactoring is the learning tool. 

When learning a new programming concept, language or library, I've found that the "tutorial" format is great. Heavy commentary paired with a section of code, and examples. The Svelte tutorial is great. While I'm not a machine learning guy, I have been able to Grok a ton from Jupyter notebooks. There are a ton of great literate emacs configurations that have been published as webpages. All share a common format matching Donald Knuth's literate programming style. It's the 'socratic method' of computers.

Literate programming is seen in places where explaining and documenting thoughts counts for something. What we forget when programming with our LLM friends, is their ephemeral state of mind. A simple reasoning prompt, asking the model to reflect on it's response and describe it's thought process, increases response quality tenfold. When a model looses context between problems, it looses it's thought process. Humans don't do that. The way we code now, we rely increasingly on memory and knowing our own programming style to understand what we've done. 

I'd like to think that augmenting documentation with more background, more context, with the reasoning, will let a model enter the perspective of it's past self more readily. Step into the shoes of the author. 

These are the thoughts have lead me to start working with LLM's on projects using a literate programming style. In my next post, I'll go over how exactly I am doing that, and what sort of improvements I've seen.
