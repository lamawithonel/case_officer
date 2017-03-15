# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'case_officer/version'

Gem::Specification.new do |spec|
  spec.name                  = 'case_officer'
  spec.version               = CaseOfficer::VERSION
  spec.authors               = ['Lucas Yamanishi']
  spec.email                 = ['lucas.yamanishi@gmail.com']
  spec.summary               = 'Source Repository Asset Handler'
  spec.description           = 'Case Officer handles assets.  Namely, it handles all the static assets used in source repos.' # rubocop:disable Metrics/LineLength
  spec.homepage              = 'http://github.com/lamawithonel/case_officer'
  spec.license               = 'Apache-2.0'
  spec.required_ruby_version = '>= 2.1.9'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec'

  spec.add_runtime_dependency 'cri'
  spec.add_runtime_dependency 'sysexits'
end
