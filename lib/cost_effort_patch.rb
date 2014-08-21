module CostEffortPatch 

    def self.included(base) 
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      
      base.unloadable 

      base.has_many :cost_efforts
      base.accepts_nested_attributes_for :cost_efforts, allow_destroy: true    
    end

    module ClassMethods  
      Project.safe_attributes 'cost_efforts_attributes'    
    end

    module InstanceMethods
    end

end
