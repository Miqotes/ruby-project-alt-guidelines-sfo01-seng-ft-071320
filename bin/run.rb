require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1 
cli = CommandLineInterface.new
cli.greet

#cli.enter_store_name

#cli.create_review

#cli.update_review

cli.delete_review