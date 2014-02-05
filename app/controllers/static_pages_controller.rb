class StaticPagesController < ApplicationController
  def home

  	@news = News.where(:status => 1).last(3)
  end

  def help
  end
end
