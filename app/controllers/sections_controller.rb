class SectionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  actions :all, :except => [:index, :show]

  belongs_to :book, :optional => true do
    belongs_to :chapter, :optional => true
  end

  def create
    create! { book_chapter_path(@book, @chapter) }
  end

  def update
    update! {
      if request.xhr?
        render :nothing => true and return
      else
        redirect_to book_chapter_path(@book, @chapter) and return
      end
    }
  end

  protected

  def permitted_params
     { :section => params.fetch(:section, {}).permit(:title, :text) }
  end
end
