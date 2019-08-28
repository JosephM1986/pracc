# frozen_string_literal: true

class Api::PeopleController < ApplicationController
  # before_action :set_people
  def index
    # @people = Person.search(params[:search])
    @people = Person.search(params[:search])
    render json: @people.to_json(include: :organisation)
   end

  def show
    @people = Person.find(params[:id])

    render json: @people.to_json(include: :organisation)
  end

  def create
    people = Post.new(people_params)

    if people.save
      render json: people, status: :created
    else
      render json: people.errors, status: :unprocessable_entity
    end
  end

  def update
    if @people.update(update_params)
      render json: @people, status: :ok
    else
      render json: @people.errors, status: :unprocessable_entity
    end
  end

  def destroy; end

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
    private

  def update_params
    params.permit(:first_name, :last_name)
  end

  def people_params
    params.require(:person).permit(:first_name, :last_name)
    end
  end
