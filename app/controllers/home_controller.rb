class HomeController < ApplicationController
  def index
  end

  def instructions
    render layout: 'instructions'
  end
end
