class SectionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  actions :all, :except => [:index, :show]

  belongs_to :book, :optional => true do
    belongs_to :chapter, :optional => true
  end

  def update
    update! {
      render :nothing => true and return if request.xhr?
    }
  end

  protected

  def permitted_params
     { :section => params.fetch(:section, {}).permit(:title, :text) }
  end
end
