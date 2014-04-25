class CostIssue < ActiveRecord::Base
  unloadable
  
  include Redmine::SafeAttributes
  belongs_to :issue
  attr_accessible :value, :issue_id
  
  # Gem brazilian-rails
  usar_como_dinheiro :value
  
   
end



