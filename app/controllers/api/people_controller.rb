# frozen_string_literal: true

module Api
  class PeopleController < ApplicationController
    # before_action :set_people
    def index
      # @people = Person.search(params[:search])
      @people = Person.search(params[:search])
      render json: @people
     end

    def show
      @people = Person.find(params[:id]).limit(1)

      render json: @people
    end

    def edit
      @people = Person.find(params[:id])
    end

    def update
      @people = Person.find(params[:id])

      if @people.update(people_params)
        redirect_to @people

      else
        render json: @people
    end
  end

    # def new
    #   @people = Person.new
    # end
    #
    # def show
    #   @people = Person.find(params[:id])
    #  end
    #
    # def temporary_people
    #   @people = Perso.search(params[:search])
    # end

    def people_params
      params.require(:person).permit(:first_name, :last_name)
      end
  end
end
