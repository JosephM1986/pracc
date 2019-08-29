# frozen_string_literal: true

# require 'app/controllers/api/people_controller'
class CallingEndpoint
  include HTTParty

def call_endpoint

Person.where('assessment_count > 0 & title == ABC').ordered

end
