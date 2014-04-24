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
    
    
end
