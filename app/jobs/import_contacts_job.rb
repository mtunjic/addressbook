class ImportContactsJob < ApplicationJob
  queue_as :default
  class InvalidFile < StandardError; end
  
  discard_on InvalidFile
  
  def perform(file)
    # Do something later
    
    Rails.logger.info "Importing: #{file}..."
  end
end
