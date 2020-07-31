require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1 
require "tty-prompt"
prompt = TTY::Prompt.new
cli = CommandLineInterface.new
cli.greet
cli.next_choice