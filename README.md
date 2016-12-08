ICECREAM
=======================================
[![Gem Version](https://badge.fury.io/rb/icecream.png)](http://badge.fury.io/rb/icecream)
[![Build Status](https://secure.travis-ci.org/camiloribeiro/icecream.png)](http://travis-ci.org/camiloribeiro/icecream)
[![Dependency Status](https://gemnasium.com/camiloribeiro/icecream.png)](https://gemnasium.com/camiloribeiro/icecream)
[![Code Climate](https://codeclimate.com/github/camiloribeiro/icecream.png)](https://codeclimate.com/github/camiloribeiro/icecream)
[![Coverage Status](https://coveralls.io/repos/camiloribeiro/icecream/badge.png)](https://coveralls.io/r/camiloribeiro/icecream)

        . ,                “Without ice cream, there would be darkness and chaos.” 
         *                              ― Don Kardong
    ` *~.|,~* '   
    '  ,~*~~* `     _            “Ice cream is happiness condensed.”
     ,* / \`* '    //                   ― Jessie Lane Adams
      ,* ; \,O.   //      
          ,(:::)=//    “... everyone knows that ice cream is worth the trouble of being cold.  
         (  `~(###)             Like all things virtuous, you have to suffer to gain the reward.”
          %---'`"y                      ― Brandon Sanderson, The Rithmatist
           \    /
            \  /            “There were some problems only coffee and ice cream could fix.”
           __)(__                        ― Amal El-Mohtar, Steam-Powered: Lesbian Steampunk Stories
          '------`        

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

You can have different folders (fridges) with different factories definitions as exemplified bellow:

    $ require 'icecream'
    $ creamy_flavors = IceCream::Icecream.new "/path/to/flavors"
    $ cheap_chocolate = creamy_flavors.flavor :chocolate
    $ cheap_chocolate.name= "whathever you want :)"
    # You can have as many "factories" as you need
    $ diet_flavors = IceCream::Icecream.new "/path/to/Diet/flavors"
    $ zero_sugar_chocolate = diet_flavors.flavor :chocolate

You can also, define an object from nowhere, creating it with a single line!

    $ IceCream::IceCream.flavor :Orange, "[name = 'orange', color = :orange, price = 35.5, calories = 3]"

If you are working with big sets of data, you can update information of an object with the information of another object using merge. For instance:
    
    $ chocolate = @fridge.flavor :chocolate
    # it has: name => "chocolate", color => :brown, price => 15.5 and calories => 150.
    
    $ update = IceCream::IceCream.flavor :Update_chocolate, "[name = 'Dark Chocolate', price = 55.5]"
    # you created a new object with part of the data that chocolate has

    $ IceCream::IceCream.merge chocolate, update
    $ chocolate
    # returns: name => "Dark Chocolate", color => :brown, price => 55.5 and calories => 150.

Have fun!

Contributing
--------------

Fork and send pull requests, as usual. Thank you! :)

IceCream ASCII art from: http://ascii.co.uk/art/icecream

LICENCE
-------------

Copyright 2013 - 2016 Camilo Ribeiro <camilo@camiloribeiro.com>

This file is part of IceCream.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
