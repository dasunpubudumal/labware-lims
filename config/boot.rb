# frozen_string_literal: true

# make the ExecJs use NodeJs
ENV['EXECJS_RUNTIME'] = 'Node'
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' # Speed up boot time by caching expensive operations.
