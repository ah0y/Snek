# Snek
Alex drools, Abe rules


~~Classic snake game in ASCII made with ruby.~~

~~Only run form a terminal/console with fixed-width characters (some 'fixed width' fonts are only fixed width for standard characters like the default font for the RubyMine console, so don't run this from ruby mine because its Block character "█" is not the same width!).~~

~~The map size is 64x40 so you may want to maximize the console window. if it's still too big you can change the size by editing $x and $y at the top of run.rb~~

## To get started

1. `cd` into your project directory 
2. run `bundle install` to install all of the gem dependencies
3. finally, run `ruby game.rb` in a terminal to start playing!


**Snek**

*Up, Down, Left, Right arrow keys to move*

![Snek](https://imgur.com/YyUdyNA.png)



## To build a Windows executable
1. `gem install ocra`
2. run `ocra game.rb media/**/*.png  --gemfile Gemfile --windows --chdir-first`
