class HomeController < ApplicationController
  
    layout 'mobile'
  
  def index
    
  end
  
  def test
    redirect_to root_url
  end
  
end
