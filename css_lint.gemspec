Gem::Specification.new do |s|
  s.name        = 'css_lint'
  s.version     = '0.9.9'
  s.date        = '2012-04-28'
  s.summary     = "Nicholas C. Zakas and Nicole Sullivan's CSS Lint available as a Gem."
  s.description = "Lint your CSS."
  s.authors     = ["Mike Ball", "John Riviello", "Jen Valure", "Mike Rottina"]
  s.email       = 'john_riviello@comcast.com'
  s.files       = ["lib/css_lint.rb",
                   "lib/vendor/csslint-rhino.js",
                   "lib/vendor/js.jar"
                  ]
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n") 
  s.homepage    = 'http://github.com/comcast'
  s.executables = ["css_lint"]
  s.require_paths = ["lib"]
  s.add_development_dependency 'rspec', '2.4'
  s.add_development_dependency 'simplecov'
end
