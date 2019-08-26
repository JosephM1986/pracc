class PeopleController < ApplicationController
  def index
    @people = Person.search(params[:search])
    @organisation = Organisation.joins(:people).where(["title LIKE ?", "%#{params[:search]}"])

  end
  def new
    @people = Person.new
    # @people.organisations.new
  end
  def create
    @people = Person.new(people_params)
    if @people.save
      redirect_to @people
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
   params.require(:person).permit(:first_name, :last_name, :organisation_id,:id)
  end
end
