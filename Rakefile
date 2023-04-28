#!/usr/bin/env rake

task default: [:build]

task :build do
  sh "ruby --enable-frozen-string-literal --jit src/app.rb"
end

task :format do
  sh "bundle exec rubocop -x src"
end

task :lint do
  sh "bundle exec fasterer src"
  sh "bundle exec reek src"
  sh "bundle exec rubocop -a -wc src"
end

task :test do
  sh "ruby --enable-frozen-string-literal --jit spec/app_spec.rb"
end
