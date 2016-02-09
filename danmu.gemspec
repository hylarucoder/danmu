# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'danmu/version'

Gem::Specification.new do |spec|
  spec.name          = "danmu"
  spec.version       = Danmu::VERSION
  spec.authors       = ["twocucao"]
  spec.email         = ["twocucao@gmail.com"]

  spec.summary       = %q{斗鱼弹幕助手,终端下读取斗鱼的弹幕}
  spec.description   = %q{斗鱼弹幕助手}
  spec.homepage      = "https://github.com/twocucao/danmu"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'thor', '~> 0.19.1'
  spec.add_dependency 'nokogiri', '~> 1.6', '>= 1.6.7.2'
  spec.add_dependency 'awesome_print', '~> 1.6', '>= 1.6.1'
end
