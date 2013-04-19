# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'css_lint/version'

Gem::Specification.new do |s|
  s.name        = 'css_lint'
  s.version     = CSSLint::VERSION
  s.date        = '2013-04-19'
  s.summary     = "Nicholas C. Zakas and Nicole Sullivan's CSS Lint available as a Gem."
  s.description = "Lint your CSS."
  s.authors     = ["Mike Ball", "John Riviello", "Jen Valure", "Mike Rottina"]
  s.homepage    = 'https://github.com/Comcast/css_lint_ruby'

  s.files       = `git ls-files`.split($/)
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '2.4'
  s.add_development_dependency 'simplecov'
end