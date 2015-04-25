class SectionsController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  actions :all, :except => [:index, :show]

  belongs_to :book do
    belongs_to :chapter
  end

  protected

  def permitted_params
    params.permit(:section => [:title, :text])
  end
end
