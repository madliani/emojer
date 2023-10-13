#!/usr/bin/env rake

task default: [:run]

task :doc do
  sh "bundle exec yard"
end

task :fasterer do
  sh "bundle exec fasterer src spec"
end

task :format do
  sh "bundle exec rubocop -x src spec"
end

task :install do
  sh "bundle config set --local path vendor/bundle"
  sh "bundle install"
  sh "bundle lock --add-platform ruby"
end

task :lint do
  sh "bundle exec rubocop -a -l src spec"
end

task :reek do
  sh "bundle exec reek src spec"
end

task :rubycritic do
  sh "bundle exec rubycritic src spec --deduplicate-symlinks --format=console --no-browser --suppress-ratings"
end

task :run do
  sh "ruby --enable-frozen-string-literal --jit src/app.rb"
end

task :test do
  sh "bundle exec rspec"
end
