require 'redmine'
require 'project_hook'
require 'cost_project_patch'
require 'cost_issue_patch'
require 'date_helper'
require 'brazilian-rails'
require 'brdinheiro'

Redmine::Plugin.register :redmine_costs do
  name 'Redmine Costs plugin'
  author 'Denis Santos'
  description 'Este é um plugin para o Redmine que viabiliza o gerenciamento de custos de um projeto. Por ele po-se cadastrar um valor total para o projeto e valores parciais para tarefas que serão debitados desse montante. Também pode-se informar um período de vigência do contrato.'
  version '0.0.1'
  
  #cria um modulo para ser adicionado ou removido do projeto
   project_module :redmine_costs do
       permission :read_cost, {:costs => [:index]}, :public => true
   end

   menu :project_menu, :costs, { :controller => 'costs', :action => 'index' }, {:caption => 'Custos', :after => :activity}


   # Envia a informação de relacionamento de tabelas para a model Project.
   ActionDispatch::Callbacks.to_prepare do 
     require_dependency 'project'
     Project.send(:include, CostProjectPatch)
   end
   
   # Envia a informação de relacionamento de tabelas para a model Issue.
   ActionDispatch::Callbacks.to_prepare do 
      require_dependency 'issue'
      Issue.send(:include, CostIssuePatch)
   end
   
end

