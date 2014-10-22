Gem::Specification.new do |s|
  s.name        = 'cordovaplugincreator'
  s.version     = '0.0.1'
  s.date        = '2014-10-21'
  s.summary     = "Cordova Plugin Creator"
  s.description = "A generator for creating Cordova plugins. Building a Cordova Plugin from scratch can be cumbersome as there is a very specific structure to follow. This creates everything for you!"
  s.authors     = ["Don Marges"]
  s.email       = 'donniemarges@gmail.com'
  s.files       = ["bin/cordovaplugincreator", "lib/PluginDirectory.rb", "lib/PluginFiles.rb", "lib/PluginExampleApp.rb"]
  s.homepage    =
      'http://rubygems.org/gems/cordovaplugincreator'
  s.license       = 'MIT'
  s.executables = ['cordovaplugincreator']
  s.add_development_dependency('optparse')
  s.require_paths = ['lib']
end