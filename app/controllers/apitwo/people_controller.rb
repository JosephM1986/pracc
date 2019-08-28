# frozen_string_literal: true

module Apitwo
  class PeopleController < ApplicationController
    def index
      @people = Person.new
    end
    def create
      @people = Person.new(people_params)
      if people.save
        redirect_to @people
      else
        render 'new'
    end
private

def people_params
  params.require(:person).permit(:first_name, :last_name)
end
      end
end
