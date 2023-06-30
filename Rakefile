#!/usr/bin/env rake

task default: [:run]

task :doc do
  sh "rdoc"
end

task :run do
  sh "ruby --enable-frozen-string-literal --jit src/app.rb"
end

task :format do
  sh "bundle exec rubocop -x src spec"
end

task :lint do
  sh "bundle exec rubocop -a -l src spec"
end

task :test do
  sh "bundle exec rspec"
end
