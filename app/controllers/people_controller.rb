class PeopleController < ApplicationController
  before_action :find_person, only: [:edit, :update, :destroy]
  
  def index
    @people = Person.get_ordered
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
      @people = Person.get_ordered
      respond_to do |format|
        format.js # create.js.erb  
      end
    end
  end
  
  def edit
    respond_to do |format|
      format.js # edit.js.erb
    end
  end
  
  def update
    if @person.update(person_params)
      @people = Person.get_ordered
      respond_to do |format|
        format.js # update.js.erb  
      end
    end
  end
  
  def destroy
    if @person.destroy
      @people = Person.get_ordered
      respond_to do |format|
        format.js # destroy.js.erb  
      end
    end
  end
  
  private
  
  def find_person
    @person = Person.find(params[:id])
  end
  
  def person_params
    params.require(:person).permit(:first_name, :last_name, :country)  
  end
end
