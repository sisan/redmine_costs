module CostsHelper
  
  def progress_bar_cost_issue(pcts, options={})
    pcts = [pcts, pcts] unless pcts.is_a?(Array)
    pcts = pcts.collect(&:round)
    pcts[1] = pcts[1] - pcts[0]
    pcts << (100 - pcts[1] - pcts[0])
    width = options[:width] || '50px;'
    legend = options[:legend] || ''
    content_tag('table',
      content_tag('tr',
        (pcts[0] > 0 ? content_tag('td', '', :style => "width: #{pcts[0]}%;", :class => 'closed') : ''.html_safe) +
        (pcts[1] > 0 ? content_tag('td', '', :style => "width: #{pcts[1]}%;", :class => 'done') : ''.html_safe) +
        (pcts[2] > 0 ? content_tag('td', '', :style => "width: #{pcts[2]}%;", :class => 'todo') : ''.html_safe) 
      ), :class => 'progress', :style => "width: #{width};").html_safe 
      #content_tag('td', legend, :class => 'percent').html_safe
  end
  
  
  def is_closed_issue(c)
      if c.done_ratio == 100
        return content_tag(:div, "Pago", :style => "background-color: #DCF3BC") 
      else
        return content_tag(:div, "Não-Pago", :style => "background-color: #FFB4B4")
      end
  end
    
    
  def format_data_br(data)
      data.strftime("%d/%m/%Y")
  end
    
  def total_paid_or_no(project)
       #total de tarefas concluídas (pagas)
       tp = 0    
       #total de tarefas em andamento (não-pagas)
       tnp = 0
      
       project.issues.each do |c| 
         unless c.cost_issue.nil?        
            if c.done_ratio == 100
               tp = tp + 1
            else
               tnp = tnp + 1
           end       
         end
       end     
      return "['Pago', #{tp}], ['Não-pago', #{tnp}]".html_safe
  end
    
    
  def total_values(project)
      #valor total do projeto 
        vt = project.cost.value    
      #valor individual de cada tarefa do projeto
        vpt = 0
      #valor restante (total-tarefas pagas)
        va = 0

      project.issues.each do |c|      
          unless c.cost_issue.nil?
            #Somente irá subtrair do valor total do projeto tarefas que estiverem com o percentual de conclusão = 100%
            if c.done_ratio == 100
                 vpt = vpt + c.cost_issue.value
            end          
          end
      end        
      #Fórmula que calcula a diferença VT - VPT = VA (Valor Gasto)
        va = vt - vpt
      #Fórmula que calcula o valor restante (valor total - Valor Gasto)
        vs = vt - va 
      return "['Gasto', #{vs}], ['Restante', #{va}]".html_safe
  end
end
