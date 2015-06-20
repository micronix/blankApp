class HostsController < ApplicationController
  TOKEN = 'jJcf97qGdz8WhMwB'

  def index
    @hosts = Host.all
  end

  def show
    if params[:token] != TOKEN
      render action: 'error'
    else
      @host = Host.find params[:id]
    end
  end

  def update
    if params[:token] != TOKEN
      render action: 'error'
    else
      @host = Host.find params[:id]
      @host.script = params[:host][:script]
      if @host.save
        redirect_to action: :show, token: params[:token]
      else
        render action: :show
      end
    end
  end

  def fix
    uri = URI(params[:q])

    # find host
    host = Host.find_by(url: uri.host)
    if host
      render text: host.script
    else
      render text: ''
    end
  end
end
