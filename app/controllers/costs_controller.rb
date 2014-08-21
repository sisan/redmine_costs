class CostsController < ApplicationController
  unloadable
  before_filter :find_project, :authorize
  
  def index
    
    @cost = Cost.where(:project_id => @project.id)
    @cost_effort = CostEffort.where(:project_id => @project.id)
    
     respond_to do |format|
        format.html 
        format.json { render :json => @cost }
      end      
  end
  
  def show 
     
   @cost = Cost.where(:project_id => @project.id) 
   @cost_effort = CostEffort.where(:project_id => @project.id)
   
  end
  
end
