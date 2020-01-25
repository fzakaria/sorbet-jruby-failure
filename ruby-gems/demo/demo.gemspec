lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|

  # Since the codebase uses JRuby -- if the gem is pure Ruby
  # specify the platform as CRuby to make it more generally available
  spec.platform      = Gem::Platform::RUBY

  # follow best practices for naming the gem
  # https://guides.rubygems.org/name-your-gem/
  spec.name          = "demo"

  # this version should never change since this gem will always be referenced within
  # the same repository. You can read more information about it in the ruby-gems/README.md
  spec.version       = "1.0"

  # Feel free to include authors & e-mail here
  # if you'd like others to know they should reach out for changes
  # within the gem
  spec.authors       = ["Farid Zakaria"]
  spec.email         = ["farid.zakaria@gmail.com"]

  # A short summary of this gem's description.
  spec.summary       = %q{A demo gem}

  # Since we are not actually distributing the gem, lets just include the code itself.
  # Typically you'd also include README as well
  spec.files         = Dir.glob("lib/**/*")

  # Paths in the gem to add to <code>$LOAD_PATH</code> when this gem is
  # activated.
  spec.require_paths = ["lib"]

  # Quiet the warning from RubyGems
  spec.license = "#{Gem::Licenses::NONSTANDARD}"

  spec.homepage = "https://github.com/fzakaria/demo-warbler-bug"

  # Add your dependencies here:
  #
  # Development dependencies aren't installed by default and aren't
  # activated when a gem is required.
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.13"

end
