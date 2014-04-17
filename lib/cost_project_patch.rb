module CostProjectPatch 

    def self.included(base) 
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      
      base.unloadable 
      base.has_one :cost
      base.accepts_nested_attributes_for :cost
      
    end

    module ClassMethods  
      Project.safe_attributes 'cost_attributes'
      
    end

    module InstanceMethods
    end

end
