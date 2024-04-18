#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/partition'
require_relative 'lib/mount'
require_relative 'lib/bootstrap'
require_relative 'lib/desktop'
require_relative 'lib/add_user'
require 'optparse'

OptionParser.new do |opts|
  opts.banner = "Welcome to the Hobby Linux Installer! 🚀\nUsage: ./installer.rb [options]"
  opts.on('-i', '--install DISK USER', 'Install Hobby Linux on DISK with USER') do |disk, user|
    partition(disk)
    mount(disk)
    bootstrap
    desktop
    passwd = add_user(user)
    puts "Installation Complete.\nReboot into Hobby Linux and log in as:\nUser:#{user}\nTemporary Password:#{passwd}"
  end

  opts.on('-h', '--help', 'Show this help message') do
    puts opts
  end
end.parse!
