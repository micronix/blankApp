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
      @host.save
      redirect_to action: :show, token: params[:token]
    end
  end
end
