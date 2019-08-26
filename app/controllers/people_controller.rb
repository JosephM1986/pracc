# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    # refers to the search function in the model
    @people = Person.search(params[:search])
  end

  def new
    # creates an instance variable for Person.new

    @people = Person.new
  end

  def create
    # will create a new instance and if save is successful will redirect to
    # the instance @people otherwise will render the new file which is a form partial
    @people = Person.new(people_params)
    if @people.save
      redirect_to @people
    else
      render 'new'
    end
  end

  def edit
    # will find a person by the id parameter
    @people = Person.find(params[:id])
  end

  def update
    # will find the person by id
    # will update the parameters that are permitted in the people_params
    # will redirect back to the instance of @people otherwise will render the edit file
    @people = Person.find(params[:id])

    if @people.update(people_params)
      redirect_to @people
    else
      render 'edit'
    end
  end

  # finds the person by the id parameters
  def show
    @people = Person.find(params[:id])
  end

  # will find the person by the id parameters
  # then will destroy that record and redirect back to index/show
  def destroy
    @people = Person.find(params[:id])
    @people.destroy
    redirect_to people_path
      end

  # these strong parameters are required when actions
  private

  def people_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
