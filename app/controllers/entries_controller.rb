class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update]
  before_filter :require_user, only: [:new, :edit, :create, :update]

  def new 
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to entry_path
    else
      render :new
    end
  end

  def index
    if logged_in?
      @entries = Entry.all
    else
      @entries = Entry.all_published
    end
  end

  def show
    if @entry.published?
      set_metadata("#{@entry.title}","#{@entry.excerpt}","b")
    else
      if logged_in?
      else
        flash[:error] = "sorry, you need to be logged in to see that"
        redirect_to root_path
      end
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      flash[:notice] = "Cool, cool cool"
      redirect_to entry_path(@entry)
    else
      flash[:error] = "Sorry, something went wrong"
      render :edit
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :body, :published)
  end

  def set_entry
    @entry = Entry.find_by(slug: params[:id])
  end
end