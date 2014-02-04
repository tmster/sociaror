class StaticPagesController < ApplicationController
  def home

  	@news = News.last(3)
  end

  def help
  end
end
