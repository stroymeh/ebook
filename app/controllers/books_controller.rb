class BooksController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  actions :all

  def sort
    @book = Book.find(params[:book_id])

    @book.sort_childrens(params[:chapter])

    render :nothing => true and return
  end

  protected

  def permitted_params
    params.permit(:book => :title)
  end
end
