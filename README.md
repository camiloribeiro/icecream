IceCream
==============

[![Build Status](https://secure.travis-ci.org/camiloribeiro/icecream.png)](http://travis-ci.org/camiloribeiro/icecream)

!!!WORK IN PROGRESS!!!
I was looking for a really simple factory gem, such as factory_grill, but without any magic to use with rails. I was imcompetent at that, so I built this really simple Factory called IceCream.

It is a IceCream factory. It means that you can fabricate any IceCream flavor that you have in your fridge :D And, as any Factory, you can change the properties of an object that you got from the fridge.

The idea
-------
The central idea is to have a very simple file to describe what you want to fabricate. When I say simple, I mean SIMPLE. The file is just a file with two collums: variable and default value.

This gem goes to the factory directory and for each file, it is going to create a class (with the file name) and fill this class with instance variables for each one of the variables, and, of course set the value for the variables :)

Imagine a file called chocolate.flavor that has the following content
name = "Chocolate"
collor = :brown
calories = 150
price = 15.5

At the end, you can call the IceCream factory using the following commands:
$ IceCream.flavor :chocolate

and it is going to return a Chocolate (class) object called chocolate, with a string, a symble, a float and an integer. Easy ;)

And it is going to work in your non-rails as good as in your rails projects :D It is just ruby code, there is not one single dependency (so far).


    .-"`'"-.

   /        \

   |        |

   /'---'--`\

  |          |

  \.--.---.-./

  (_.--._.-._)

    \=-=-=-/

     \=-=-/

      \=-/

       \/


LICENCE
=======

Copyright 2013 Camilo Ribeiro camilo@camiloribeiro.com

This file is part of IceCream.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
