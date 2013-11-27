IceCream
==============

[![Gem Version](https://badge.fury.io/rb/icecream.png)](http://badge.fury.io/rb/icecream)
[![Build Status](https://secure.travis-ci.org/camiloribeiro/icecream.png)](http://travis-ci.org/camiloribeiro/icecream)
[![Dependency Status](https://gemnasium.com/camiloribeiro/icecream.png)](https://gemnasium.com/camiloribeiro/icecream)
[![Code Climate](https://codeclimate.com/github/camiloribeiro/icecream.png)](https://codeclimate.com/github/camiloribeiro/icecream)
[![Coverage Status](https://coveralls.io/repos/camiloribeiro/icecream/badge.png)](https://coveralls.io/r/camiloribeiro/icecream)
[![endorse](https://api.coderwall.com/camiloribeiro/endorsecount.png)](https://coderwall.com/camiloribeiro)

I was looking for a really simple factory gem, such as factory_girl, but without any magic to use with rails. I was incompetent at that, so I built this really simple factory called IceCream.

The Idea
-------

The central idea is to have a very simple file to describe what you want to fabricate. When I say simple, I mean SIMPLE. The file is just a "file.flavor" (plain text) with two collums: variable and default value.

This gem goes to the factory directory and for each ".flavor" file, it creates a class (with the given file name) and fills this class with instance variables for each one of the values declared.

Imagine a file called chocolate.flavor that has the following content:

    name = "Chocolate"
    colour = :brown
    calories = 150
    price = 15.5

After that, you can call the IceCream factory using the following commands:
   
    $ IceCream.flavor :chocolate

and it is going to return a Chocolate (class) object called chocolate, with a string, a symbol, a float and an integer. Easy ;)

It works in your non-Rails Ruby project as well. It's just Ruby code, and there is not a single dependency (so far).

Installing
------------------

Terminal

    $ gem install icecream

Gemfile
     
    $ gem 'icecream'

Using
---------

    $ require 'icecream'
    $ creamy_flavors = IceCream::Icecream.new "/path/to/flavors"
    $ cheap_chocolate = creamy_flavors.flavor :chocolate
    $ cheap_chocolate.name= "whathever you want :)"
    # You can have as many "factories" as you need
    $ diet_flavors = IceCream::Icecream.new "/path/to/Diet/flavors"
    $ zero_sugar_chocolate = diet_flavors.flavor :chocolate

Have fun!

Contributing
--------------

Fork and send pull requests, as usual. Thank you! :)

LICENCE
-------------

Copyright 2013 Camilo Ribeiro <camilo@camiloribeiro.com>

This file is part of IceCream.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
