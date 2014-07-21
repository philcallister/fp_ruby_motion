FastPencil
=========

Hi! Thanks for taking the time to look at my RubyMotion solution.  This is the FastPencil exercise I was given, and here are the original requirements with some formatting:

>Requirements
> - Given a list of words, generate two output
files, 'questions' and 'answers'.
> - 'questions' should contain every
sequence of four letters that appear in exactly one word of the
dictionary, one sequence per line.
> - 'answers' should contain the
corresponding words that contain the sequences, in the same order,
again one per line.

>An example, say this is your dictionary:
> - arrows
> - carrots
> - give
> - me

>'questions' would contain:
> - carr
> - give
> - rots
> - rows
> - rrot
> - rrow
> - 'arro' wouldn't show up in 'questions', because it appears in two words

>'answers' would have:
> - carrots
> - give
> - carrots
> - arrows
> - carrots
> - arrows

>My Questions:
> - What about numbers and apostrophes?  I could try to skip over them and include 'aint' => 'ain't'
But right now I just skip any fragment that contains an apostrophe.  And same goes for integers.

Version
--------------
Tested with ==> Ruby 2.0.0p195 / RubyMotion 2.30 / iOS 7.1.1

Installation
--------------
```sh
git clone https://github.com/philcallister/fp_ruby_motion.git
gem install bundler
bundle install
```
Tests
--------------
Test specs are written with Bacon, a small clone of RSpec
```sh
rake spec
```

Input Files
--------------
The app uses the original __words.txt__ file provided with the original specification and has been integrated into the 
__models/words.rb__ class.  All output generated from the original input file is sorted, ignoring case.

Run It...
--------------
The app can be run with the iOS 7 simulator or on an iOS 7.0 device.

```sh
rake
rake device
```

Thanks!
--------------
Again, thanks for taking a look at my solution.  Please feel free to drop me a line if you have any questions!