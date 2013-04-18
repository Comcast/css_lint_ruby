Gem::Specification.new do |s|
  s.name        = 'css_lint'
  s.version     = '0.9.10.0'
  s.date        = '2013-04-18'
  s.summary     = "Nicholas C. Zakas and Nicole Sullivan's CSS Lint available as a Gem."
  s.description = "Lint your CSS."
  s.authors     = ["Mike Ball", "John Riviello", "Jen Valure", "Mike Rottina"]
  s.files       = ["lib/css_lint.rb",
                   "lib/vendor/csslint-rhino.js",
                   "lib/vendor/js.jar"
                  ]
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.homepage    = 'https://github.com/Comcast/css_lint_ruby'
  s.executables = ["css_lint"]
  s.require_paths = ["lib"]
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '2.4'
  s.add_development_dependency 'simplecov'
end
