module CostIssuePatch 

    def self.included(base) 
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      
      base.unloadable 
      base.has_one :cost_issue, :dependent => :destroy
      base.accepts_nested_attributes_for :cost_issue
    end

    module ClassMethods  
      Issue.safe_attributes 'cost_issue_attributes'
    end

    module InstanceMethods    
      #:controller_issues_new_after_save 
    end

end
