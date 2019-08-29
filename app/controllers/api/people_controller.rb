# frozen_string_literal: true

class Api::PeopleController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :set_people

  def index
    @people = Person.search(params[:search])
    render json: @people.to_json(include: :organisation)

     # @response = HTTParty.get('http://localhost:3000/api/people',
     #                          headers: { 'Content-Type' => 'application/json' })
     # @response.code
   end

  def show
    # @people = Person.find(params[:id])
    #
    # render json: @people.to_json(include: :organisation)
  end

  def create
    people = Person.new(people_params)
    if people.save
      render json: people, status: 201, location: [:api, people]
    else
      render json: { errors: people.errors }, status: 422
    end
  end

  def update
    people = Person.find(params[:id])

    if people.update(people_params)
      render json: people, status: 200, location: [:api, people]
    else
      render json: { errors: people.errors }, status: 422
    end
  end

    private

  def people_params
    params.require(:person).permit(:first_name, :last_name, :organisation_id)
    end
  end
