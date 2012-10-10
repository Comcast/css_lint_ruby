Gem::Specification.new do |s|
  s.name        = 'csslint'
  s.version     = '0.0.0'
  s.date        = '2012-04-28'
  s.summary     = "Nicole Sullivan's CSS Lint available as a Gem."
  s.description = "Lint your CSS."
  s.authors     = ["Mike Ball", "John Riviello", "Jen Valure", "Mike Rottina"]
  s.email       = 'john_riviello@comcast.com'
  s.files       = ["lib/css_lint.rb",
                   "lib/vendor/csslint-rhino.js",
                   "lib/vendor/js.jar"
                  ]
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n") 
  s.homepage    = 'http://github.com/comcast'
  s.executables = ["csslint"]
  s.require_paths = ["lib"]
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
end
