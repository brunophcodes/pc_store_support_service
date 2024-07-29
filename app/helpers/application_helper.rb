module ApplicationHelper
  def is_active(url)
    request.path == url ? "nav-link active" : 'nav-link'
  end
end
