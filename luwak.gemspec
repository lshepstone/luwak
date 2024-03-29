# frozen_string_literal: true

require_relative 'lib/luwak/version'

Gem::Specification.new do |spec|
  spec.name          = 'luwak'
  spec.version       = Luwak::VERSION
  spec.authors       = ['Lawrance Shepstone']
  spec.email         = ['lawrance.shepstone@gmail.com']

  spec.summary       = 'General file format converter'
  spec.description   = 'Ingest a file in one format and poo it out in another.'
  spec.homepage      = 'https://github.com/lshepstone/luwak'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/lshepstone/luwak.git'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'qif', '~> 1.2'

  spec.add_development_dependency 'pry', '~> 0'
  spec.add_development_dependency 'rubocop', '~> 0.0'
end
