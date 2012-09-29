class ListsController < ApplicationController
  before_filter :find_list, :except => [:index, :new]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    if @list.save
      flash[:notice] = 'Success!'
      redirect_to lists_url
    else
      flash[:error] = @list.errors.full_messages
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @list.update_attributes(params[:list])
      flash[:notice] = 'Success!'
      redirect_to lists_path
    else
      flash[:error] = @list.errors.full_messages
      render action: 'edit'
    end
  end

  def show
  end

  def destroy
    @list.destroy
    redirect_to lists_url
  end

  private
  def find_list
    @list = List.find(params[:id])
  end

end
