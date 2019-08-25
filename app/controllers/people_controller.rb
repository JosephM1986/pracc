class PeopleController < ApplicationController
  def index
    @people = Person.search(params[:search])
  end
  def new
    @people = Person.new
  end
  def create
    @people = Person.new(params[:id])
    @organisation = @person.organisations.create(organisations_params)
    

    if @people.save
      redirect_to people_path, notice: 'successfully created'
    else
      render 'new'
    end
  end
  def edit
    @people = Person.find(params[:id])
  end
  def update
    @people = Person.find(params[:id])

    if @people.update(people_params)
      redirect_to @people
    else
      render 'edit'
    end
  end
def show
  @people = Person.find(params[:id])
end

def destroy
  @people = Person.find(params[:id])
  @people.destroy
  redirect_to people_path

  # @people = Person.find(params[:id])
  # @people.destroy

  # redirect_to people_path
end


  private
  def people_params
    params.require(:people).require(:first_name, :last_name,:location, :title, :assessment_count,
       :search)
  end 
end
