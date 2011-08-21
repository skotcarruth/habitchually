class HabitsController < ApplicationController

  layout 'mobile'

  def index
    @habits = Habit.where(:user_id => current_user.id)
  end
  
  def checkin
    @habit = Habit.find(params[:id])
    s = Date.today.beginning_of_day 
    e = Date.today.end_of_day
    if @habit.can_checkin?(s,e)
      p 'yes'
      #Checkin.create(:habit_id => @habit.id)
      render :json => { :status => 202 }
    else
      p 'no'
      render :json => { :status => 401 }  
    end
  end

  def show
    @habit = Habit.find(params[:id]) if @habit.user_id == current_user.id
  end

  def new
    @habit = Habit.new
  end

  def edit
    @habit = Habit.find(params[:id])
  end

  def create
    @habit = Habit.new(params[:habit])  
    @habit.user_id = current_user.id
    if @habit.save
      redirect_to @habit, :notice => 'Habit was successfully created.'
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
    redirect_to(habits_url) 
    
  end
end
