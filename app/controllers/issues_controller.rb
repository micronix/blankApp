class IssuesController < ApplicationController
  def create
    uri = URI(params[:url])

    # find host
    host = Host.find_by(url: uri.host)
    if host.nil?
      host = Host.create(url: uri.host)
    end

    # find path
    full_path = uri.path
    full_path += "?#{uri.query}" if uri.query
    full_path += "##{uri.fragment}" if uri.fragment
    path = host.paths.find_by(path: full_path)
    if path.nil?
      path = host.paths.create(path: full_path)
    end

    issue = path.issues.create(
      user_id: 1,
      message: params[:message],
      timestamp: DateTime.now
    )

    render json: issue
  end
end
