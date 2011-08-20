class HabitsController < ApplicationController

  layout 'mobile'

  def index
    @habits = Habit.all

    respond_to do |format|
      format.html
      format.json  { render :json => @habits }
    end
  end

  def show
    @habit = Habit.find(params[:id])

    respond_to do |format|
      format.html 
      format.json  { render :json => @habit }
    end
  end

  def new
    @habit = Habit.new

    respond_to do |format|
      format.html 
      format.json  { render :json => @habit }
    end
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def create
    p = params[:habit][0]
    @habit = Habit.new({ :name => p[:name] })  
    respond_to do |format|
      if @habit.save
        format.html { redirect_to(@habit, :notice => 'Habit was successfully created.') }
        format.json  do
          render :json => { :data => @habit }
        end
      else
      
      end
    end
  end

  def update
    @habit = Habit.find(params[:id])

    respond_to do |format|
      if @habit.update_attributes(params[:habit])
        format.html { redirect_to(@habit, :notice => 'Habit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @habit.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @habit = Habit.find(params[:id])
    @habit.destroy

    respond_to do |format|
      format.html { redirect_to(habits_url) }
      format.xml  { head :ok }
    end
  end
end
