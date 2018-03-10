# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usleep/version'

Gem::Specification.new do |spec|
  spec.name          = 'usleep'
  spec.version       = Usleep::VERSION
  spec.authors       = ['Charlie Sharpsteen']
  spec.email         = ['source@sharpsteen.net']
  spec.license       = 'MIT'

  spec.summary       = 'A Ruby library that provides functionality for sleeping while holding the Global VM Lock (GVL).'
  spec.homepage      = 'https://github.com/Sharpie/ruby-usleep'
  spec.description   = <<-EOS
A Ruby library that can execute a sleep while holding the Global VM Lock,
which is pathological behavior that would normally be avoided in practice.
However, having an easy method of blocking the Ruby VM from a thread is
useful in certain debugging and simulation scenarios.
  EOS

  spec.files         = %x[git ls-files].split($/)
  spec.require_paths = ['lib']
  spec.extensions    = Dir['ext/**/extconf.rb']

  spec.add_development_dependency 'rake', '~> 12.3'
  spec.add_development_dependency 'rake-compiler', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
end
