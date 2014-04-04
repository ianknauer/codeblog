class PagesController < ApplicationController
  def home
    @entries = Entry.all
  end
end