#!/usr/bin/env ruby

begin
  require 'commit-meat'
rescue LoadError
  require 'rubygems'
  require 'commit-meat'
end

include CommitMeat

Choice.options do

  header "Installs a pre-commit hook that tells you when your commit messages are too short or uninformative."

  option :install do
    short '-i'
    long '--install'
    desc "Install Commit-Meat for this Git repository."
    action { CommitMeat::Installation::install }
  end

  option :uninstall do
    short '-u'
    long '--uninstall'
    desc "Uninstall Commit-Meat for this git repository."
    action { CommitMeat::Installation::uninstall }
  end

  option :run do
    short '-r'
    long '--run'
    desc "Run Commit-Meat"
    action { CommitMeat::run() }
  end

  option :version do
    short '-v'
    long '--version'
    desc "Print Commit-Meat's version"
    action { puts["Version: #{CommitMeat::VERSION.to_s.green}"] }
  end

end

Choice.help if Choice.choices.empty?