# vim-wordy

> There are no bad words; only writers using good words poorly.

## Features of this plugin

* A writer’s tool for identifying potential problems in word usage
* Pure Vimscript; no external services or libraries needed
* Leverages Vim’s native spell-check engine
* Buffer-scoped configuration (leaves your global settings alone)

That writing benefits from the effective use of words should be obvious.
Without good word choice, your efforts at grammar, punctuation and
rhetoric will be for naught, or rather squandered.

Effective usage means avoiding words that are lazy, weak, awkward,
overused, imprecise, boring, abused, imprecise, redundant, or which merely
serve as filler. Identifying and fixing such language serves as a central 
challenge to each of us in our writing.

Because the goals of our writing are nearly as diverse as ourselves, there 
is no single set of rules guiding usage. What stands for formal writing 
will fail for informal. What’s needed for dialogue won’t jibe with that 
needed for narrative. The demands placed on the technical writer aren’t 
wholly shared by other writers of non-fiction.

Works of prose evolve. We expect our first drafts to be saddled with poor 
usage, full of weak and repetitive language to be culled on later 
rewrites. With enough polishing a work can emerge for which we can be 
proud.

Writers can benefit from tools which can help them along that path. 
_wordy_ aspires to be such a tool.

Existing proofreading software can scan your text for potential problems 
in grammar and usage and provide comprehensive feedback. However, some 
services like ‘After the Deadline’ require transmission of your work to 
a server for checking. Others require installation and configuration of a 
complex software package, where integration with Vim may prove difficult
or infeasible.

In contrast, _wordy_ stands as a lightweight alternative to these
comprehensive tools, focusing narrowly on identifying potential problems
in word usage. Because it’s primitive by comparison, it’s best used in
concert with books and other resources on good usage in writing.

## Requirements

May require a recent version of Vim.

## Installation

Best installed using Pathogen, Vundle, Neobundle, or your favorite Vim
package manager.

## Configuration

You’ll typically use this plugin on-demand. It does not require any 
special configuration, unless you want to map its commands to keys. More 
on that below.

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

## Usage Dictionaries

_wordy_ can’t read your mind. Even if it could it couldn’t understand your
intent. In fact _wordy_ is pretty dumb, as it will flag words and phrases
that may fit your goals perfectly well. In such a case you can ignore
_wordy’s_ protestations.

_wordy_ errs on the side of identifying potential problems. For example,
if it highlights ‘moreover’, a word for which there may be no good usage,
you should consider a rewrite to eliminate it. But if it highlights
‘therefore’ in a sentence, you may consider it worthy and elect to keep
it, _wordy_ be damned.

_wordy_ has a dozen dictionaries at the ready to attempt to shoot down
your prose.

### Weak and lazy words

``` 
:LazyWordy
```

Lazy and weak words are common in first drafts.

We sabotage ourselves though weak language.
We defeat our goal of effective writing by kicking the legs out from
beneath our verbs and tearing at the foundations of our nouns.

Words that water down the points we are trying to drive home.

“I _got_ up and _went_ to work.” => “I awoke and drove to work.”

We diminish the weight of our ideas by adding modifiers.

“The regiment was _perhaps_ a hundred strong, and took the hill.”

“The regiment took the hill, despite fewer than a hundred soldiers
remaining in its ranks.”

Text can also be weakened through overuse 

“He _actually_ drove to work in the blizzard.” => “He drove to work in
spite of the blizzard.”

Use in rare occasions, effectively. Consult the books.

Words can be fillers and play no active role, such as needless use of
‘that’:

“A dog that was missing an eye followed us.” => “A dog missing an eye
followed us.”

The use of ‘the’ can weaken, such as in this sentence. Better: start with
“Using ‘the’”.

You can use the word ‘have’ in situations where you can be more direct:
“Can I have the ice cream?” => “I want ice cream.”

Wordiness can be weak: “Joe _has the ability to_ eat beef.” => “Joe can
eat beef.”

Using forms of ‘to be’ when action verbs can be used. Covered as
a separate target.


### Redundant phrases

``` 
:RedundantWordy
```

Did you ever receive an ‘advance warning’ when a mere warning would do?
Why plan when you can ‘plan ahead’? Why need a thought to ‘occur to me’
when the thought can merely ‘occur’?

But redundancies may not actually be redundant: ‘invited guests’ may not
be redundant if some of the guests have crashed your event. Or dialect
differences can erase redundancies, as the British will ‘protest against’
where Americans may simply ‘protest’.

To reveal [common redundancies][1] from which you can scrub from your
prose, enter this command:

### WordyPuffery

TODO describe puffery

“The guru embodies authenticity; his disruptive ideas on
self-actualization reflect his dynamic and transformative personality.”

Instead of using these words, instead provide a graphic example.

“The Empire State Building is enormously tall.” => “My ears popped several
times during the X minute elevator ride to the observation deck.”

### WordyCred

“Along with a growing body of evidence, because common sense insists that
my opponent’s policies threaten and untrustworthy.”

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
