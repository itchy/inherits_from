# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "inherits_from/version"

Gem::Specification.new do |s|
  s.name        = "inherits_from"
  s.version     = InheritsFrom::VERSION
  s.authors     = ["Scott Johnson"]
  s.email       = ["7.scott.j@gmail.com"]
  s.homepage    = "https://github.com/itchy/inherits_from"
  s.summary     = %q{ gem that provides an inheritance interface for ActiveRecord Models}
  s.description = %q{inherits_from provides an interface that allows ActiveRecord models to access other 
  ActiveRecord models as though they were subclassed, while allowing data to be stored 
  in a normalized RDBMS.}

  s.rubyforge_project = "inherits_from"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "activerecord"
end
