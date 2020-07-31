require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1
# require 'colorized_string'
# require 'colorized'
require "tty-prompt"
prompt = TTY::Prompt.new
cli = CommandLineInterface.new
cli.greet

while true
  cli.next_choice 
end