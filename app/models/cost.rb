class Cost < ActiveRecord::Base
  unloadable  
  
  include Redmine::SafeAttributes
  belongs_to :project
  attr_accessible :value, :start_date, :end_date, :project_id
 
   # Gem brazilian-rails 
   usar_como_dinheiro :value
  
   
  # Método que subtrai do valor total do projeto o valor de cada tarefa relacionada à pagamento.
  def calcula_valor_restante(project)
    @project = project
    
    #valor total do projeto 
    vt = @project.cost.value
    
    #valor individual de cada tarefa do projeto
    vpt = 0
    
    @project.issues.each do |c|      
      unless c.cost_issue.nil?
        vpt = vpt + c.cost_issue.value
      end
    end    
    
    #Fórmula que calcula a diferença VT - VPT = VA (Valor Atual)
    va = vt - vpt
    return va
  end
  
  # Método que calcula o período de término do contrato entre a data atual e de fim do contrato.
  def calcula_termino_contrato(project)    
    unless @project.cost.end_date.nil?
      @project = project
      dt1 = Date.today
      dt2 = @project.cost.end_date
    
      #Fórmula que calcula a diferença
      dtf = distance_of_time_in_words(dt1, dt2, include_seconds: true)
      return dtf
    end
    return 0
  end
  
end
