# vim-wordy

> A writer’s tool for uncovering potential usage problems

## Features of this plugin

* Pure Vimscript; no external services or libraries needed
* Uses Vim’s native spell-check engine
* Includes 13 dictionaries covering different types of word usage
* Buffer-scoped configuration (leaves your global settings alone)

## What is _wordy_?

_wordy_ is not a grammar checker. Nor is it a guide to proper word usage.
Rather, _wordy_ is a lightweight tool to assist writers in identifying
those words and phrases known for their history of misuse, abuse and
overuse, at least according to usage experts.

For example, if _wordy_ highlights ‘moreover’ in your document, a word for
which there may be no good usage, you might consider a rewrite to
eliminate it. But if it highlights ‘therefore’ in a sentence, you may
consider the usage worthy and elect to keep it, _wordy_ be damned.

Existing proofreading software can scan your text for potential problems
and provide comprehensive feedback. However, it may require a complex
software installation or transmission of your work to a remote server for 
checking. 

In contrast, _wordy_ stands ready as a simple alternative to these
comprehensive tools, focusing narrowly on identifying potential problems
in usage.

_wordy_ is best used in concert with books and websites that focus on
usage.

## Requirements

May require a recent version of Vim.

## Installation

Best installed using Pathogen, Vundle, Neobundle, or your favorite Vim
package manager.

## Configuration

You’ll typically use this plugin on-demand. It does not require any
special configuration.

Important note: on the first use of each of the plugin’s dictionaries,
a spell file will be built. This produces a message that resembles:

```
Reading word file /Users/reede/.vim/bundle/vim-wordy/data/en/cred.dic ...
Compressing word tree...
Compressed 618 of 1738 nodes; 1120 (64%) remaining
Writing spell file /Users/reede/.vim/bundle/vim-wordy/spell/cred.en.utf-8.spl ...
Done!
Estimated runtime memory use: 5600 bytes
Press ENTER or type command to continue
```

As instructed, press the enter key and it will disturb you no longer, at
least until it needs to build again.

## Commands

You can switch _wordy_ on and off. You’ll use the commands described below
to enable it. To disable and restore your previous spell environment,
enter the command:

```
:NoWordy
```

### Weak and lazy usage

```
:LazyWordy
```

Lazy and weak words are common in first drafts.

We sabotage our writing though weak language, kicking the legs out from
beneath our verbs and tearing at the foundations of our nouns, watering
down the very points that we are trying to drive home.

* “I _got_ up and _went_ to work.” (weak)
* “I awoke and drove to work.” (better)

We diminish the weight of our ideas by adding modifiers and fillers.

* “The regiment _that_ took the hill was _perhaps_ a hundred strong.” (weak)
* “Despite heavy losses, the regiment took the hill.” (better)

Words can also be weakened through overuse.

* “He _actually_ drove to work in the blizzard.” (weak)
* “He drove to work in spite of the blizzard.” (better)

When using this dictionary, scrutinize each highlighted word or phrase,
asking whether it detracts from the point you are trying to make.

### Redundant and problematic phrases

```
:WordyWordy
:ProblemWordy
```

Did you ever receive an ‘advance warning’ when a mere warning would do?
Why plan when you can ‘plan ahead’? Why need a thought to ‘occur to me’
when the thought can merely ‘occur’?

But redundancies may not actually be redundant: ‘invited guests’ may not
be redundant if some of the guests have crashed your event. Or dialect
differences can erase redundancies, as the British will ‘protest against’
where Americans may simply ‘protest’.

### Puffery and Jargonese

> “The man embodies _authenticity_; his _disruptive_ ideas on
> _self-actualization_ reflect his _dynamic_ and _transformative_
> personality.” (puffery and jargonese)

```
:PuffWordy
:JargoneseWordy
```

Instead of puffery, demonstrate through details.

* “The Empire State Building is _breathtakingly_ tall.” (puffery)
* “My ears popped several times during the rapid minute-long elevator ride
  to 80th floor.” (better)

### Manipulative language

```
:WeaselWordy
```

Words can be used to hide or obscure a weak position, or to cast doubt on
a strong one. They can be used to mislead, to evade blame, to claim credit,
as well as to cast doubt on a strong one.

* “mistakes were made”
* “discounted up to 50% off”
* “most voters feel that my opponent can’t be trusted”
* “it’s widely thought among voters that my opponent is not trustworthy”

Assuming that you’re not consciously trying to manipulate others, you will
seek to purge such loaded words from your writing.

### Forms of to be

```
:BeingWordy
```

You may find this dictionary useful in avoiding overuse of the many forms
of the verb to be.

### Colloquialisms, Idioms, and Similies

```
:ColloquialWordy
:IdiomaticWordy
:LikeWordy
```

I couldn’t have said it better myself.

### Miscellaneous

```
:SaidWordy
:OpinionatedWordy
:TimeWordy
```

A few dictionaries to serve specific needs.

If you’re writing to be neutral, you will want to avoid editorializing
your use of ‘said’ and other words.

_TimeWordy_ finds where you are using general descriptions of time where
you could be more specific.

## See also

If you like this plugin, you might like these others from the same author:

* [vim-colors-pencil](http://github.com/reedes/vim-colors-pencil) — A color scheme for Vim inspired by IA Writer
* [vim-lexical](http://github.com/reedes/vim-lexical) - Building on Vim’s spell-check and thesaurus/dictionary completion
* [vim-litecorrect](http://github.com/reedes/vim-litecorrect) - Lightweight auto-correction for Vim
* [vim-pencil](http://github.com/reedes/vim-pencil) - Rethinking Vim as a tool for writers
* [vim-quotable](http://github.com/reedes/vim-quotable) - extends Vim to support typographic (‘curly’) quotes
* [vim-thematic](http://github.com/reedes/vim-thematic) — Conveniently manage Vim’s appearance to suit your task and environment

## Future development

This early version supports for English and utf-8 encoding. Support for
other languages can be added if there’s interest.

_wordy_ is a work in progress. If you’ve spotted a problem or have an idea
on improving this plugin, please post it to the github project issue page.
Contributions are welcome.

<!-- vim: set tw=74 :-->
