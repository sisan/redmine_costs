class CostsHookListener < Redmine::Hook::ViewListener

  
    render_on :view_projects_form, :partial => "costs/hook_project"

    render_on :view_issues_form_details_bottom, :partial => "costs/hook_issue"

      
end

