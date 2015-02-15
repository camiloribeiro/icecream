# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "icecream/version"

Gem::Specification.new do |s|
  s.name        = "icecream"
  s.version     = IceCream::VERSION
  s.authors     = ["Camilo Ribeiro"]
  s.email       = ["cribeiro@camiloribeiro.com"]
  s.homepage    = "http://github.com/camiloribeiro/icecream"
  s.license     = "Apache 2.0"
  s.summary     = %q{Simple Factory to the ones who just wanna a factory}
  s.description = %q{Simple factory without any active record or external library. Just gem install and use!}

  s.rubyforge_project = "cello"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.default_executable = 'icecrem'

  s.require_paths = ["lib"]

  s.add_development_dependency 'pry'
  s.add_development_dependency 'cucumber'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'coveralls'
end
