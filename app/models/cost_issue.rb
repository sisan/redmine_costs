class CostIssue < ActiveRecord::Base
  unloadable
  
  include Redmine::SafeAttributes
  belongs_to :issue
  attr_accessible :value, :issue_id
  
  # Gem brazilian-rails
  usar_como_dinheiro :value
  
  
  # def total_paid_or_no
  #    
  #    #total de tarefas concluídas (pagas)
  #    tp = 0    
  #    #total de tarefas em andamento (não-pagas)
  #    np = 0
  #  
  #         
  #      unless self.issue.cost_issue.nil?        
  #         if self.issue.done_ratio == 100
  #            tp = tp + 1
  #         else
  #            np = np + 1
  #        end       
  #      end
  # 
  #    
  #  end
   
end



