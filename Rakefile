require 'rubygems'
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "casket"
  gem.homepage = "placek.github.com/casket/"
  gem.license = "MIT"
  gem.summary = "Packaging project for Ruby similar to JAR for Java"
  gem.description = "Packaging project for Ruby similar to JAR for Java"
  gem.email = "placek@ragnarson.com"
  gem.authors = ["Paweł Placzyński"]
  gem.add_development_dependency 'rspec', '>= 1.3.0' 
  gem.add_development_dependency "jeweler", ">= 1.4.0"
end
Jeweler::RubygemsDotOrgTasks.new

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "casket #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
