class PagesController < ApplicationController
  
  def home
    set_metadata("The web Development Blog of Ian Knauer", "This is the blog where i will be sharing my experience learning ruby on rails", "Home, contact, blog, projects" )
    @entries = Entry.all_published
  end
end