class PeopleController < ApplicationController
  def index
    @people = Person.order("created_at DESC")
  end
  
  def new
    @person = Person.new
    respond_to do |format|
      format.js  # new.js.erb
    end
  end
  
  def create
    @person = Person.new(person_params)
    if @person.save
      @people = Person.order("created_at DESC")
      respond_to do |format|
        format.js # create.js.erb  
      end
    end
  end
  
  private
  
  def person_params
    params.require(:person).permit(:first_name, :last_name, :country)  
  end
end
