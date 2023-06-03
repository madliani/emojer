#!/usr/bin/env rake

task default: [:run]

task :run do
  sh "ruby --enable-frozen-string-literal --jit src/app.rb"
end

task :format do
  sh "bundle exec rubocop -x src spec"
end

task :lint do
  sh "bundle exec rubocop -a -l src spec"
end

task :typecheck do
  sh "bundle exec srb tc src spec"
end

task :test do
  sh "bundle exec rspec"
end
