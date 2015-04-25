class ChaptersController < ApplicationController
  inherit_resources
  load_and_authorize_resource

  actions :all, :except => :index

  belongs_to :book

  protected

  def permitted_params
    params.permit(:chapter => :title)
  end
end
