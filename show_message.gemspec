lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'show_message/version'

Gem::Specification.new do |spec|
  spec.name          = 'show_message'
  spec.version       = ShowMessage::VERSION
  spec.authors       = ['Jarrett Lusso']
  spec.email         = ['jclusso@gmail.com']
  spec.description   = %q{show_message makes it easy to manage your flash messages.}
  spec.summary       = %q{show_message makes it easy to manage your flash messages.}
  spec.homepage      = "http://github.com/jclusso/show_message"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
