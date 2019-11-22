# vim-wordy

> Uncover usage problems in your writing

<br/>

- - -
![demo](http://i.imgur.com/cXDCwdE.gif)
- - -

## Features of the _wordy_ plugin

* Pure Vimscript; no external services or libraries needed
* Uses Vim’s native spell-check engine
* Includes 16 dictionaries covering different types of word usage
* Buffer-scoped configuration (leaves your global settings alone)
* Unicode-friendly, including support for ‘typographic quotes’
* User-configurable ring of dictionaries
* *NEW* adjectives and adverbs, to help you detect overuse

## What is _wordy_?

_wordy_ is not a grammar checker. Nor is it a guide to proper word usage.
Rather, _wordy_ is a lightweight tool to assist you in identifying
those words and phrases known for their history of misuse, abuse, and
overuse, at least according to usage experts.

For example, if _wordy_ highlights `moreover` in your document, a word for
which no good usage exists, you should consider a rewrite to eliminate it.
But if _wordy_ highlights `therefore` in a sentence where you can demonstrate
the usage is sound, you can elect to keep it —_wordy_ be damned.

## Why _wordy_?

Off-the-shelf proofreading software can scan your text for potential problems
and provide comprehensive feedback. However, it may require a complex
software installation or transmission of your work to a remote server for
checking.

_wordy_ stands ready as a simple alternative to these comprehensive tools,
focusing narrowly on identifying potential problems that might otherwise
be missed. To compensate for _wordy_’s bare-bones approach, it’s best used
in concert with the [literature on usage][lit] (Strunk and White, e.g.)
and websites like the [English Language & Usage Stack Exchange][ese].

[lit]: http://www.amazon.com/s/ref=nb_sb_noss_2?url=search-alias%3Dstripbooks&field-keywords=English+Usage
[ese]: http://english.stackexchange.com

## Requirements

_wordy_ may require a recent version of Vim.

## Installation

_wordy_ is best installed using a Vim package manager, such as
[Vundle][vnd], [Plug][plg], [NeoBundle][nbn], or [Pathogen][pth].

[vnd]: https://github.com/gmarik/Vundle.vim
[plg]: https://github.com/junegunn/vim-plug
[nbn]: https://github.com/Shougo/neobundle.vim
[pth]: https://github.com/tpope/vim-pathogen

## Configuration

### On demand

Using this plugin’s commands does not require any special configuration.

Important note: on the first use of each of the plugin’s dictionaries,
a spell file will be built. This produces a message that resembles:

```
Reading word file /Users/reede/.vim/bundle/vim-wordy/data/en/weasel.dic ...
Compressing word tree...
Compressed 618 of 1738 nodes; 1120 (64%) remaining
Writing spell file /Users/reede/.vim/bundle/vim-wordy/spell/weasel.en.utf-8.spl ...
Done!
Estimated runtime memory use: 5600 bytes
Press ENTER or type command to continue
```

As instructed, press the enter key and it will disturb you no longer, at
least until _wordy_ feels the urge to build again.

### Ring navigation

Define your own ring of dictionaries, overriding the default one in your
`.vimrc`:

```vim
let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]
```

You can navigate the ring with the following commands:

```vim
:NextWordy
:PrevWordy
```

Optionally map a key in your `.vimrc` to rapidly cycle through the
ring's dictionaries:

```vim
noremap <silent> <F8> :<C-u>NextWordy<cr>
xnoremap <silent> <F8> :<C-u>NextWordy<cr>
inoremap <silent> <F8> <C-o>:NextWordy<cr>
```

You can browse through a flattened list of dictionaries
specified in your ring with:

```vim
:Wordy <tab>
```

and optionally map a key such as `\w` in your `.vimrc` to it by

```vim
if !&wildcharm | set wildcharm=<C-z> | endif
execute 'nnoremap <leader>w :Wordy<space>'.nr2char(&wildcharm)
```

## Using _wordy_

You’ll use the commands that follow to enable _wordy_. To disable it and
restore your previous spell environment, enter the command:

```vim
:NoWordy
```

Use Vim’s _Normal_ mode commands for navigating misspelled words to
go to those words flagged by _wordy_.

* `]s`			- Move to next misspelled word after the cursor.
* `[s`			- Like `]s` but search backwards

### Weak and lazy usage

```vim
:Wordy weak
```

Weak and lazy words are common in first drafts.

We sabotage our writing though weak language, kicking the legs out from
beneath our verbs and tearing at the foundations of our nouns, watering
down the very points that we are trying to drive home.

* “I _got_ up at precisely 8 AM.” (weak)
* “I woke up at precisely 8 AM.” (better)

We diminish the weight of our ideas by adding modifiers and fillers.

* “That night was _perhaps_ the most important moment of my life, and I don't _think_ I'll ever forget it.” (weak)
* “That night was the most important moment of my life, and I'll never forget it.” (better)

Words can also be weakened through overuse.

* “He _actually_ drove to work in the blizzard.” (weak)
* “He drove to work in spite of the blizzard.” (better)

When using this dictionary, scrutinize each highlighted word or phrase,
asking whether it detracts from the point you are trying to make.

### Redundant and problematic usage

```vim
:Wordy redundant
:Wordy problematic
```

Did you ever receive an ‘advance warning’ when a mere warning would do?
Why plan when you can ‘plan ahead’? Why need a thought to ‘occur to you’
when the thought can merely ‘occur’?

But redundancies may not actually be redundant: ‘invited guests’ may not
if some of the guests have crashed your event. Or dialect differences can
erase redundancies, as the British will ‘protest against’ where Americans
will simply ‘protest’.

See [50 Problem Words and Phrases][1] for more detail on those issues
targeted by _problematic_.

[1]: http://www.dailywritingtips.com/50-problem-words-and-phrases/

### Puffery and Jargon

> “The man embodies _authenticity_; his _disruptive_ ideas on
> _self-actualization_ reflect his _dynamic_ and _transformative_
> personality.” (puffery and jargon)

```vim
:Wordy puffery
:Wordy business-jargon
:Wordy art-jargon
```

Instead of puffery, demonstrate through details.

* “The Empire State Building is _breathtakingly_ tall.” (puffery)
* “My ears popped several times during the rapid ascent to the 80th
  floor.” (better)

### Manipulative language

```vim
:Wordy weasel
```

Words can be used to hide or obscure a weak position, or to cast doubt on
a strong one. They can be used to mislead, to evade blame, or to claim credit
where none has been earned.

* “mistakes were made”
* “discounted up to 50% off”
* “most voters feel that my opponent can’t be trusted”

Assuming that you’re not intentionally trying to manipulate others, you
will seek to purge such loaded language from your writing.

### To be and the passive voice

```vim
:Wordy being
:Wordy passive-voice
```

You may find this dictionary useful in avoiding overuse of the many forms
of the verb to be, often found in overly-passive sentences.

### Colloquialisms, Idioms, and Similies

```vim
:Wordy colloquial
:Wordy idiomatic
:Wordy similies
```

Dictionaries for uncovering the tired cliché, including colloquial and
idiomatic phrases scraped from Wiktionary and Wikipedia.

### Adjectives and Adverbs

```vim
:Wordy adjectives
:Wordy adverbs
```

Dictionaries to help you detect the overuse of modifiers.

### Miscellaneous

```vim
:Wordy said-synonyms
:Wordy opinion
:Wordy contractions
:Wordy vague-time
```

A few dictionaries to serve specific needs.

If you’re writing to be neutral, you will want to avoid editorializing
(`opinion`) and loaded use of ‘said’ (`said-synonyms`).

If you’re writing formally, you’ll want to identify unintentional
contractions with `contractions`. A warning that it’s not yet capturing most
instances of “’s”, such as “Joe’s not here.”

And finally, `vague-time` finds where you are using vague descriptions of
time where you could be more specific.

## See also

* [danielbmarques/vim-ditto][vd] - new plugin to highlight repeated words
* [Words To Avoid in Creative Writing][wa] - a brief guide to usage by writer Cary Morton

[vd]: https://github.com/danielbmarques/vim-ditto
[wa]: http://darlingmionette.deviantart.com/art/Words-To-Avoid-152886782

If you find this plugin useful, you may want to check out these others by
[@reedes][re]:

* [vim-colors-pencil][cp] - color scheme for Vim inspired by IA Writer
* [vim-lexical][lx] - building on Vim’s spell-check and thesaurus/dictionary completion
* [vim-litecorrect][lc] - lightweight auto-correction for Vim
* [vim-one][vo] - make use of Vim’s _+clientserver_ capabilities
* [vim-pencil][pn] - rethinking Vim as a tool for writers
* [vim-textobj-quote][qu] - extends Vim to support typographic (‘curly’) quotes
* [vim-textobj-sentence][ts] - improving on Vim's native sentence motion command
* [vim-thematic][th] - modify Vim’s appearance to suit your task and environment
* [vim-wheel][wh] - screen-anchored cursor movement for Vim
* [vim-wordchipper][wc] - power tool for shredding text in Insert mode

[re]: https://github.com/reedes
[cp]: http://github.com/reedes/vim-colors-pencil
[lx]: http://github.com/reedes/vim-lexical
[lc]: http://github.com/reedes/vim-litecorrect
[vo]: http://github.com/reedes/vim-one
[pn]: http://github.com/reedes/vim-pencil
[ts]: http://github.com/reedes/vim-textobj-sentence
[qu]: http://github.com/reedes/vim-textobj-quote
[th]: http://github.com/reedes/vim-thematic
[wh]: http://github.com/reedes/vim-wheel
[wc]: http://github.com/reedes/vim-wordchipper

## Future development

This early version targets English usage issues and utf-8 encoding.
Support for other languages will be added if there’s interest. (Hint: pull
requests!)

_wordy_ is a work in progress. If you’ve spotted a problem or have an idea
on improving this plugin, please post it to the github project issue page.
Contributions are welcome.

<!-- vim: set tw=74 :-->
