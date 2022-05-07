module ApplicationHelper
  def page_title(page_title = '', admin = false)
    base_title = if admin
                    'Negative word share(管理画面)'
                  else
                    'Negative word share'
                  end

    page_title.empty? ? base_title : page_title + ' | ' + base_title

    def active_if(path)
      path == controller_path ? 'active' : ''
    end
  end
end
