# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','dpla','version.rb'])
spec = Gem::Specification.new do |s|
  s.name = 'dpla'
  s.version = DPLA::CLI::VERSION
  s.author = 'Misty De Meo'
  s.email = 'mistydemeo@gmail.com'
  s.homepage = 'github.com/mistydemeo/dpla-tool'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Ultra-tiny commandline tool for accessing the DPLA API'
# Add your other files here if you make them
  s.files = `git ls-files`.chomp
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','dpla.rdoc']
  s.rdoc_options << '--title' << 'dpla' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'dpla'
  s.add_dependency('ruby-dpla')
  s.add_development_dependency('rake')
  s.add_runtime_dependency('slop','3.3.3')
end
