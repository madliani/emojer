#!/usr/bin/env rake

task default: [:build]

task :build do
  sh "ruby --enable-frozen-string-literal --jit src/app.rb"
end

task :format do
  sh "bundle exec rubocop -x src spec"
end

task :lint do
  sh "bundle exec fasterer src spec"
  sh "bundle exec reek src spec"
  sh "bundle exec rubocop -a -wc src spec"
end

task :test do
  sh "rspec"
end
