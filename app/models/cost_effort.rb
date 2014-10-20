class CostEffort < ActiveRecord::Base
  unloadable
  
  include Redmine::SafeAttributes
  belongs_to :project
  attr_accessible :number, :project_id
  
  
end

