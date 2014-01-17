# vim-wordy

> Writer’s tool for identifying potential problems in word usage

## Features of this plugin

* Pure Vimscript; no external services or libraries needed
* Uses Vim’s native spell-check engine
* Buffer-scoped configuration (leaves your global settings alone)

## What is _wordy_?

_wordy_ is not a grammar checker. Nor is it a guide to proper word usage.
Rather, _wordy_ is a rudimentary tool to assist writers in identifying
words and phrases in their text that suffer from a history of misuse,
abuse and overuse, at least according to usage experts.

For example, if _wordy_ highlights ‘moreover’, a word for which there may
be no good usage, a rewrite to eliminate it would be prudent. But if it
highlights ‘therefore’ in a sentence, you may consider the usage worthy
and elect to keep it, _wordy_ be damned.

Existing proofreading software can scan your text for potential problems
in grammar and usage and provide comprehensive feedback. However, some
services require transmission of your work to a server for checking.
Others require installation and configuration of a complex software
package, where integration with your editor of choice may prove
infeasible.

_wordy_ stands ready as a lightweight alternative to these comprehensive
tools, focusing narrowly on identifying potential problems in usage.

_wordy_ is best used in concert with books and other resources on good
usage in writing.

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

### Redundant phrases

``` 
:WordyWordy
```

Did you ever receive an ‘advance warning’ when a mere warning would do?
Why plan when you can ‘plan ahead’? Why need a thought to ‘occur to me’
when the thought can merely ‘occur’?

But redundancies may not actually be redundant: ‘invited guests’ may not
be redundant if some of the guests have crashed your event. Or dialect
differences can erase redundancies, as the British will ‘protest against’
where Americans may simply ‘protest’.

### Puffery and Jargonese

``` 
:PuffWordy
:JargoneseWordy
```

“The man embodies authenticity; his disruptive ideas on
self-actualization reflect his dynamic and transformative personality.”
(puffery and jargonese)

Instead of puffery, demonstrate through details.

* “The Empire State Building is breathtakingly tall.” (puffery)
* “My ears popped several times during the minute-long elevator ride to 80th floor.” (better)

### Manipulative language

``` 
:WeaselWordy
```

Words can be used to hide or obscure a weak position, as well as to cast
doubt on a strong one.

“Common sense will show that you can’t trust my opponent.”

Rather than provide the reasoning and evidence, we’ll unconsciously sneak
in weasel words to shore up a weak facade.

Similarly, we’ll skip reasoning and evidence and instead sneak in weasel
words to cast fear, uncertainty and doubt upon points we seek to tear
down.

### WordyToBe

If you’re not writing in the third person, you’ll want to ensure that
you’re not overusing.

"You were there!" by Walter Cronkite

“‘Was’ is a passive, lazy bum that hangs around your writing eating all
the snacks and drinking all the beer.” via Claire Grasse


### Combos

TODO figure out which combos are best

TODO show how you can define your own combo

### What this plugin will miss

Adverbs and adjectives.

## See also

If you like this plugin, you might like these others from the same author:

* [vim-quotable](http://github.com/reedes/vim-quotable) - extends Vim to support typographic (‘curly’) quotes
* [vim-pencil](http://github.com/reedes/vim-pencil) - Rethinking Vim as a tool for writers
* [vim-thematic](http://github.com/reedes/vim-thematic) — Conveniently manage Vim’s appearance to suit your task and environment 
* [vim-litecorrect](http://github.com/reedes/vim-litecorrect) - Lightweight auto-correction for Vim
* [vim-colors-pencil](http://github.com/reedes/vim-colors-pencil) — A color scheme for Vim inspired by IA Writer

## Future development

_wordy_ is a work in progress. If you’ve spotted a problem or have an idea
on improving this plugin, please post it to the github project issue page.
Contributions are welcome.

<!-- vim: set tw=74 :-->
