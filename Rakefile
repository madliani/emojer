#!/usr/bin/env rake

task default: [:run]

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

task :run do
  sh "ruby --enable-frozen-string-literal --jit src/app.rb"
end

task :test do
  sh "bundle exec rspec"
end
