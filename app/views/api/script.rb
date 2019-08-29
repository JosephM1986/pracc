# frozen_string_literal: true

# require 'app/controllers/api/people_controller'
# require 'rubygems'
# require 'httparty'
# require 'rest-client'

class CallingEndpoint
  def call_endpoint
    # Person.where('assessment_count > 0')
    response = HTTParty.get('http://localhost:3000/api/people',
                            headers: { 'Content-Type' => 'application/json' })
  end
end

# calling_endpoint = CallingEndpoint.new
#
# puts calling_endpoint
#
#
#
#
#
#
# asdkaslkdn

response = HTTParty.get('http://localhost:3000/api/people',
                        headers: { 'Content-Type' => 'application/json' })

pr = response.parsed_response.sort_by { |hsh| hsh['last_name'] }

pr.each do |p|
  if p['assessment_count'] > 0 && p['organisation']['title'].include?('ABC')
    puts "#{p['first_name']} #{p['last_name']}"
  end
end

# Person.each do |people|
# people = people
#   people.where('aseessment_count > 0 & title == 'ABC')
# return p
